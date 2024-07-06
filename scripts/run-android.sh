#!/bin/bash

echo "===================================="
source "$(dirname "$0")/helpers/install-jdk.sh"
echo "===================================="
source "$(dirname "$0")/helpers/android-home.sh"
echo "===================================="
source "$(dirname "$0")/helpers/install-dependencies.sh"
echo "===================================="
npx vite build
echo "===================================="
echo "sync android"
npx cap sync android
echo "===================================="
echo "run android"
npx cap run android --info