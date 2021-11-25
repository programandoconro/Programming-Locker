## Create apk file for Android in React-Native

Based on: https://www.instamobile.io/android-development/generate-react-native-release-build-android/

Go to android/app folder and create a ``keystore``.
```
cd android/app
keytool -genkey -v -keystore your_alias.keystore -alias your_alias -keyalg RSA -keysize 2048 -validity 10000
```

Make the bundle:
```
cd ../..
react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res/

```
Si hay error en el comando anterio ``ENOENT: no such file or directory, open 'android/app/src/main/assets/index.android.bundle'``, crear folder ``assets`` con 

```
mkdir android/app/src/main/assets   
```
### Edit the build.gradle file.
```
vim android/app/build.gradle
```
Add your files for release version.

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

## 次のステップは難しかったです。
```
npx npm i --save-dev jetifier
npx jetify
```
Answer found in https://github.com/mikehardy/jetifier#usage-for-source-files

Now you should remove some folders for the build to work.
Issue found in: https://github.com/facebook/react-native/issues/26245

Delete all drawable-hdpi,mdpi,xhdpi,xxhdpi,xxxhdpi and raw folders. from android/app/src/main/res
```
rm -r android/app/src/main/res/drawable-raw/
rm -r android/app/src/main/res/drawable-hdpi/
rm -r android/app/src/main/res/drawable-mdpi/
rm -r android/app/src/main/res/drawable-xhdpi/
rm -r android/app/src/main/res/drawable-xxhdpi/
rm -r android/app/src/main/res/drawable-xxxhdpi/
```
Also, delete ``raw`` folder in /android/app/src/main/. 

```
rm -r android/app/src/main/res/raw/  
```

### Create the apk file.
```
cd android
./gradlew assembleRelease
```
### That is it, 
The apk file should be in: app/build/outputs/apk/release/app-release.apk

