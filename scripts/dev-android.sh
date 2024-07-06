#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if OpenJDK 17 is installed
if ! command_exists java || [[ "$(java -version 2>&1)" != *"17."* ]]; then
  echo "OpenJDK 17 is not installed. Installing..."
  # TODO: brew is only for mac right? Use a way to auto install OpenJDK 17 for all platform (windows, linux , mac)
  brew install openjdk@17
  sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
fi

# Use local environment variables
source "$(dirname "$0")/.bashrc"

# Print JAVA_HOME to verify
echo $JAVA_HOME

# Run the Android build script
pnpm run:android
