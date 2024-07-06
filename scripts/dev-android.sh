#!/bin/bash

source "$(dirname "$0")/install-jdk.sh"

source "$(dirname "$0")/install-dependencies.sh"

# Print JAVA_HOME to verify
echo $JAVA_HOME

# Run the Android build script
pnpm run:android