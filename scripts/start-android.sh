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

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Navigate to the directory containing the Dockerfile
cd "$SCRIPT_DIR/dockerfiles"

# Build the Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME -f android-env .

# Navigate back to the project root directory
cd "$SCRIPT_DIR/../.."

# Run the Docker container and execute the development script
echo "Running Docker container..."
docker run --rm -it \
    -v "$(pwd)":/app \
    -v /app/node_modules \
    $IMAGE_NAME

# Note: You might need to add more volume mounts or environment variables as per your project's requirements
