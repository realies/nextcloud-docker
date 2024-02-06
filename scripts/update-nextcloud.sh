#!/bin/bash

TAG=$1 # latest or fpm

# Create a Dockerfile that uses the Nextcloud image as a base, installs ffmpeg, and cleans up apt cache
echo "FROM nextcloud:$TAG
RUN apt-get update && apt-get install -y ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*" > Dockerfile.$TAG

# Build the new image. Consider adding --pull to always use the latest version of the base image
docker build --pull -t $DOCKERHUB_USERNAME/nextcloud:$TAG -f Dockerfile.$TAG .

# Push the new image to Docker Hub
docker push $DOCKERHUB_USERNAME/nextcloud:$TAG
