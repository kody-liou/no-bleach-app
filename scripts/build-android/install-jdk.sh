#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install OpenJDK 17 on Linux
install_openjdk_linux() {
  apt update
  apt install -y openjdk-17-jdk
}

# Detect operating system and install OpenJDK 17 if not installed
if ! command_exists java || [[ "$(java -version 2>&1)" != *"17."* ]]; then
  echo "OpenJDK 17 is not installed. Installing..."
  case "$(uname -s)" in
    Linux)
      install_openjdk_linux
      ;;
    *)
      echo "Unsupported OS. Please install OpenJDK 17 manually."
      exit 1
      ;;
  esac
fi

# Set JAVA_HOME just for this process
case "$(uname -s)" in
  Linux)
    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))
    ;;
  *)
    echo "Unsupported OS. Please set JAVA_HOME manually."
    exit 1
    ;;
esac

# Print JAVA_HOME to verify
echo $JAVA_HOME
echo "OpenJDK installed successfully!"
