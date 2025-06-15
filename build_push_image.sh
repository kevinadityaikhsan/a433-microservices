#!/bin/bash

# Build the Docker image and tag it for GitHub Container Registry
docker build -t ghcr.io/kevinadityaikhsan/order-service:latest .

# Authenticate with GitHub Container Registry using a personal access token
echo $GH_PACKAGES_TOKEN | docker login ghcr.io -u kevinadityaikhsan --password-stdin

# Push the tagged Docker image to GitHub Container Registry
docker push ghcr.io/kevinadityaikhsan/order-service:latest
