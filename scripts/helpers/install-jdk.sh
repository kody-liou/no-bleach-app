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
  if ! command_exists choco; then
    echo "Chocolatey is not installed. Installing Chocolatey..."
    set -e
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
    set +e
  fi

  if [ "$EUID" -ne 0 ]; then
    echo "Running with elevated privileges..."
    powershell -Command "Start-Process powershell -ArgumentList 'choco install -y openjdk17' -Verb RunAs"
  else
    choco install -y openjdk17
  fi
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

# Set JAVA_HOME just for this process
case "$(uname -s)" in
  Darwin)
    export JAVA_HOME=$(/usr/libexec/java_home -v 17)
    ;;
  Linux)
    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))
    ;;
  CYGWIN*|MINGW32*|MSYS*|MINGW*)
    export JAVA_HOME="C:/Program Files/OpenJDK/jdk-17"
    ;;
  *)
    echo "Unsupported OS. Please set JAVA_HOME manually."
    exit 1
    ;;
esac

# Print JAVA_HOME to verify
echo $JAVA_HOME
echo "OpenJDK installed successfully!"
