#!/bin/bash

# Use local environment variables
source "$(dirname "$0")/.bashrc"

# Print JAVA_HOME to verify
echo $JAVA_HOME

# Run the Android build script
pnpm run android
