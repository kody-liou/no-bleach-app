#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install OpenJDK 17 on macOS
install_openjdk_mac() {
  brew install openjdk@17
  sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
}

# Function to install OpenJDK 17 on Linux
install_openjdk_linux() {
  sudo apt update
  sudo apt install -y openjdk-17-jdk
}

# Function to install OpenJDK 17 on Windows (requires Chocolatey)
install_openjdk_windows() {
  choco install -y openjdk17
}

# Detect operating system and install OpenJDK 17 if not installed
if ! command_exists java || [[ "$(java -version 2>&1)" != *"17."* ]]; then
  echo "OpenJDK 17 is not installed. Installing..."
  case "$(uname -s)" in
    Darwin)
      install_openjdk_mac
      ;;
    Linux)
      install_openjdk_linux
      ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
      install_openjdk_windows
      ;;
    *)
      echo "Unsupported OS. Please install OpenJDK 17 manually."
      exit 1
      ;;
  esac
fi

# TODO: Split the install JDK part and dev android part to 2 script

# Use local environment variables
source "$(dirname "$0")/.bashrc"

# Print JAVA_HOME to verify
echo $JAVA_HOME

# Run the Android build script
pnpm run:android
