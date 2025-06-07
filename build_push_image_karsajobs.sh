#!/bin/bash

# Build Docker image
docker build -t ghcr.io/kevinadityaikhsan/karsajobs:latest .

# Login to GHCR (GitHub Container Registry)
docker login ghcr.io -u kevinadityaikhsan -p $GH_PACKAGES_TOKEN

# Push Docker image to GHCR
docker push ghcr.io/kevinadityaikhsan/karsajobs:latest
