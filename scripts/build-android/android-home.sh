#!/bin/bash

# Function to set the ANDROID_HOME environment variable based on the operating system
set_android_home() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # For Linux, set ANDROID_HOME to the default Android SDK path
    export ANDROID_HOME=$HOME/Android/Sdk
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # For macOS, set ANDROID_HOME to the default Android SDK path
    export ANDROID_HOME=$HOME/Library/Android/sdk
  elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    # For Windows (Cygwin, MSYS, or Git Bash), convert the path to Windows format
    export ANDROID_HOME=$(cygpath -w "$HOME/AppData/Local/Android/Sdk")
  else
    # If the OS is unsupported, print an error message and exit
    echo "Unsupported OS. Please set ANDROID_HOME manually."
    exit 1
  fi

  # Check if the ANDROID_HOME directory exists
  if [ ! -d "$ANDROID_HOME" ]; then
    # If not, print an error message and exit
    echo "Android SDK not found at $ANDROID_HOME. Please install the Android SDK and try again."
    exit 1
  fi

  # Print the set ANDROID_HOME path
  echo "ANDROID_HOME is set to $ANDROID_HOME"
}

# Function to update the local.properties file with the ANDROID_HOME path
update_local_properties() {
  # Set the path to the local.properties file
  local properties_file="$1/android/local.properties"

  # Create the directory for the properties file if it doesn't exist
  mkdir -p "$(dirname "$properties_file")"

  # Check if the OS is Windows (Cygwin, MSYS, or Git Bash)
  if [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    # Convert the ANDROID_HOME path to Windows format
    sdk_path=$(cygpath -w "$ANDROID_HOME")
    # Write the SDK path to the local.properties file
    echo "sdk.dir=$sdk_path" > "$properties_file"
  else
    # Write the SDK path to the local.properties file for other OS
    echo "sdk.dir=$ANDROID_HOME" > "$properties_file"
  fi

  # Print a message indicating that the local.properties file has been updated
  echo "Updated local.properties with sdk.dir=$ANDROID_HOME"
}

# Main function to set ANDROID_HOME and update local.properties
main() {
  # Call the function to set ANDROID_HOME
  set_android_home
  # Call the function to update local.properties, passing the current directory as an argument
  update_local_properties "$(pwd)"
}

# Call the main function to execute the script
main
