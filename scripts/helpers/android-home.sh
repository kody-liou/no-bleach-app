#!/bin/bash

set_android_home() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export ANDROID_HOME=$HOME/Android/Sdk
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
  elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    export ANDROID_HOME=$(cygpath -w "$HOME/AppData/Local/Android/Sdk")
  else
    echo "Unsupported OS. Please set ANDROID_HOME manually."
    exit 1
  fi

  if [ ! -d "$ANDROID_HOME" ]; then
    echo "Android SDK not found at $ANDROID_HOME. Please install the Android SDK and try again."
    exit 1
  fi

  echo "ANDROID_HOME is set to $ANDROID_HOME"
}

update_local_properties() {
  local properties_file="$1/android/local.properties"

  mkdir -p "$(dirname "$properties_file")"

  if [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    sdk_path=$(cygpath -w "$ANDROID_HOME")
    echo "sdk.dir=$sdk_path" > "$properties_file"
  else
    echo "sdk.dir=$ANDROID_HOME" > "$properties_file"
  fi

  echo "Updated local.properties with sdk.dir=$ANDROID_HOME"
}

main() {
  set_android_home
  update_local_properties "$(pwd)"
}

main
