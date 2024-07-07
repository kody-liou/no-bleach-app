# Use the official Node.js image as a base
FROM node:20.15.0-bookworm

# Set the working directory
WORKDIR /workdir

# Copy the application files
# TODO: I want copy my whole root project folder into it but failed. Is I need update my start-android.sh script?
COPY . .

# RUN ls -a /workdir

# Make sure the custom script is executable
# RUN chmod +x /workdir/build-android/run-android.sh

RUN "/workdir/scripts/build-android/install-jdk.sh"

# CMD ["/workdir/scripts/run-android.sh"]