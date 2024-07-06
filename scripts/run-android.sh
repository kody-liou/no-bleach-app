#!/bin/bash

echo "===================================="
source "$(dirname "$0")/helpers/install-jdk.sh"
echo "===================================="
source "$(dirname "$0")/helpers/install-dependencies.sh"
echo "===================================="
npx cap sync android
npx cap run android