#!/bin/bash

# Build the Docker image with the specified tag
docker build -t ghcr.io/kevinadityaikhsan/shipping-service:latest .

# Authenticate with GitHub Container Registry using the provided token
echo $GH_PACKAGES_TOKEN | docker login ghcr.io -u kevinadityaikhsan --password-stdin

# Push the Docker image to GitHub Container Registry
docker push ghcr.io/kevinadityaikhsan/shipping-service:latest
