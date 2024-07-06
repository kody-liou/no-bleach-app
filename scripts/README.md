# Scripts Folder Structure

## Overview

This document describes the structure and purpose of the various scripts and directories found in the `scripts` folder of the project.

## Directory Structure

```plaintext
project_root/
    scripts/
        dockerfiles/
            android-env: Dockerfile for the Android build environment.
        helpers/
            android-home.sh: Script to set the `ANDROID_HOME` environment variable.
            install-dependencies.sh: Script to install Node.js dependencies.
            install-jdk.sh: Script to install OpenJDK, required for building Android code.
        dev.sh: Script to debug the app.
        run-android.sh: Script to build the Android app bundle and run it in the Android emulator.
        
    ...other files in project
```

## Detailed Descriptions

### dockerfiles/
- **android-env**: Contains the Dockerfile used to create a Docker image for the Android build environment.

### helpers/
- **android-home.sh**: A helper script to set the `ANDROID_HOME` environment variable, essential for Android development.
- **install-dependencies.sh**: A helper script to install all required Node.js dependencies for the project.
- **install-jdk.sh**: A helper script to install OpenJDK, which is necessary for building Android code.

### dev.sh
- This script is used for debugging the application.

### run-android.sh
- This script builds the Android app bundle file and runs it in the Android emulator.

## Other Files
- The project may contain additional files and directories not listed here.
