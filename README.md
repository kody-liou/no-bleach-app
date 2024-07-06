# Trobleshooting

- Android Gradle plugin requires Java 17 to run. You are currently using Java 11.
    brew install openjdk@17

## Uninstall JAVA
brew uninstall openjdk@17

## Install
```bash
corepack enable
corepack pnpm install
```
## Package management

https://pnpm.io/zh-TW/installation

## Sync your web code to your native project

```
pnpm sync
```

## Created with Capacitor Create App

This app was created using [`@capacitor/create-app`](https://github.com/ionic-team/create-capacitor-app),
and comes with a very minimal shell for building an app.

### Running this example

To run the provided example, you can use `npm start` command.

```bash
npm start
```

<!-- TODO: How to debug the capacitor android APP? -->

## Deploy 

You can choose Appflow or fastlane