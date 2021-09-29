# https://www.instamobile.io/android-development/generate-react-native-release-build-android/
keytool -genkey -v -keystore your_alias.keystore -alias your_alias -keyalg RSA -keysize 2048 -validity 10000
react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res/

# 次のステップは難しかったです。
# https://github.com/mikehardy/jetifier#usage-for-source-files
npx npm i --save-dev jetifier
npx jetifiy

# https://github.com/facebook/react-native/issues/26245
# delete all drawable-hdpi,mdpi,xhdpi,xxhdpi,xxxhdpi and raw folders. from android/app/src/res

# ** OPTIONAL: For http (non https) requests put this in application in AndroidManifest
android:usesCleartextTraffic="true"

# Create the apk
./gradlew assembleRelease
# apk file should be in: app/build/outputs/apk/release/app-release.apk
