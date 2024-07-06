#!/bin/bash

# Define image name
IMAGE_NAME="android-build"

# Navigate to the directory containing the Dockerfile
# TODO: Fix Error: cd: ./scripts/dockerfiles/android-env: Not a directory (android-env actually is the Dockerfile itself)
cd "$(dirname "$0")/dockerfiles/android-env"

# Build the Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME .

# Navigate back to the project root directory
cd ../../..

# Run the Docker container and execute the development script
echo "Running Docker container..."
docker run --rm -it \
    -v "$(pwd)":/app \
    -v /app/node_modules \
    $IMAGE_NAME

# Note: You might need to add more volume mounts or environment variables as per your project's requirements
