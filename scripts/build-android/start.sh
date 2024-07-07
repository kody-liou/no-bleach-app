#!/bin/bash

# Function to check if Docker is running
check_docker() {
  if ! docker info >/dev/null 2>&1; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
  fi
}

# Check if Docker is running
check_docker

# Define image name
IMAGE_NAME="android-build"

# # Get the directory of the current script
# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# # Navigate to the project root directory (assumes start-android.sh is in scripts/)
# cd "$SCRIPT_DIR/../.."

# Build the Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME -f scripts/build-android/Dockerfile .

# Run the Docker container and execute the custom script
echo "Running Docker container..."
docker run --rm -it \
    -v "$(pwd)":/workdir \
    -v /workdir/node_modules \
    $IMAGE_NAME
