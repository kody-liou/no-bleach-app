# Scripts folder structure

project_root/
    scripts/
        dockerfiles/
            android-env: This is Dockerfile for android build environment
        helpers/: This folder is the helper script for do some small tasks
            android-home.sh: This is for add ANDROID_HOME
            install-dependencies.sh: This is for install nodejs dependencies
            install-jdk.sh: This is for install OpenJDK, which required for build android code
        dev.sh: This is for debug the APP
        run-android.sh: This can build android appbundle file and run it in android emulator
        
    ...other files in project
