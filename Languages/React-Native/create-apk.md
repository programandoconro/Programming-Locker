### https://www.instamobile.io/android-development/generate-react-native-release-build-android/

```
cd android/app
keytool -genkey -v -keystore your_alias.keystore -alias your_alias -keyalg RSA -keysize 2048 -validity 10000
react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res/
```
```
vim build.gradle
```
```
    android {
    ....
      signingConfigs {
        release {
          storeFile file('your_key_name.keystore')
          storePassword 'your_key_store_password'
          keyAlias 'your_key_alias'
          keyPassword 'your_key_file_alias_password'
        }
      }
      buildTypes {
        release {
          ....
          signingConfig signingConfigs.release
        }
      }
    }
```

```
cd ..
cd ..
```

## 次のステップは難しかったです。
### https://github.com/mikehardy/jetifier#usage-for-source-files
```
npx npm i --save-dev jetifier
npx jetifiy
```
### https://github.com/facebook/react-native/issues/26245
### delete all drawable-hdpi,mdpi,xhdpi,xxhdpi,xxxhdpi and raw folders. from android/app/src/main/res
```
rm -r android/app/src/main/res/drawable-raw/
rm -r android/app/src/main/res/drawable-hdpi/
rm -r android/app/src/main/res/drawable-mdpi/
rm -r android/app/src/main/res/drawable-xhdpi/
rm -r android/app/src/main/res/drawable-xxhdpi/
rm -r android/app/src/main/res/drawable-xxxhdpi/
```

### Create the apk
```
./gradlew assembleRelease
```
### apk file should be in: app/build/outputs/apk/release/app-release.apk
