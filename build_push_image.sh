#!/bin/sh

# Defining variables used for the image name, image version, and GitHub account name.
image_name="item-app"
image_version="v1"
github_account="kevinadityaikhsan"

# Building a Docker image.
echo -e "Building a new Docker image:"
docker build . -t $image_name:$image_version

# Viewing the list of local Docker images.
echo -e "\nViewing the list of Docker images:"
docker images

# Giving a new tag name to the Docker image to match the format of GitHub Container Registry.
echo -e "\nGiving a new tag name to the Docker image to match the format of GitHub Container Registry:"
docker tag $image_name:$image_version ghcr.io/$github_account/$image_name:$image_version
docker images

# Logging into GitHub Container Registry.
echo -e "\nLogin into GitHub Container Registry:"
docker login ghcr.io -u $github_account

# Publishing the image to GitHub Container Registry.
echo -e "\nPublishing image to GitHub Container Registry:"
docker push ghcr.io/$github_account/$image_name:$image_version

echo -e "\nDone."
