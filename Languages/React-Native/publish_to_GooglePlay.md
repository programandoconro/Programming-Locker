## How to publish your React Native App to Google Play

First generate your ``keystore`` and configure it as explained here https://github.com/programandoconro/Programming-Locker/blob/master/Languages/React-Native/create-apk.md

Then test your production app with:

```
npx react-native run-android --variant=release
```

If everything is ok, go to your ``android`` folder and run:

```
./gradlew bundleRelease
```
the ``app-release.aab`` bundle file will be in ``/android/app/build/outputs/bundle/release`` folder. Google will ask you for this file. 


Now you must do some google requirements:

* take some screenshots of your app. 
* make a 512 X 512 px logo for your app.
* make a 1024 X 500 feature image for you app. If you want also make a video.
* create a ``PRIVACY_POLICY`` available in a URL link. 
* then you have to answer some forms in google play. 
* google will test your app before the release for production.



Extra notes:
* The easiest way is to create a document in ``github`` or ``gitlab`` and provide that link.
Like this: https://gitlab.com/programandoconro/kanjiholic/-/blob/master/PRIVACY_POLICY.md

* If you generate many versions, be aware that you have to change them in ``android/app/build.gradle`` file for Google not to complain.

