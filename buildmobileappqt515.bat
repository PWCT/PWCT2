ring pwct.ring -go -norun
copy /Y *.ringo target\mobile\qtproject
cd target\mobile\qtproject
set ANDROID_HOME=C:/JavaAndroid/AndroidSDK
set ANDROID_NDK_ROOT=C:/JavaAndroid/android-ndk-r21/
set ANDROID_API_VERSION=android-19
set JAVA_HOME=C:\Program Files (x86)\Java\jdk1.8.0_05
set ANDROID_SDK_ROOT=C:\JavaAndroid\AndroidSDK
set ANDROID_NDK_HOST=windows-x86_64

"C:\Qt\5.15.0\android\bin\qmake.exe" PWCT.pro -spec android-clang  "CONFIG+=debug" "CONFIG+=qml_debug"
"C:\JavaAndroid\android-ndk-r20b\prebuilt\windows-x86_64\bin\make.exe"
call C:\Qt\5.15.0\mingw81_32\bin\qtenv2.bat
b:
cd pwct2\target\mobile\qtproject
mingw32-make install INSTALL_ROOT=B:/pwct2/target/mobile/qtproject/build-android

"C:\Qt\5.15.0\android\bin\androiddeployqt.exe" --input %cd%/android-libPWCT.so-deployment-settings.json --output  %cd%/build-android --android-platform android-19 --jdk "C:/Program Files (x86)/Java/jdk1.8.0_05" --gradle

cd ..\..\..\
