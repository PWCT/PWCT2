set ANDROID_NDK_ROOT=B:\mahmoud\Tools\Java-Android\android-ndk-r10c

set JAVA_HOME=C:\Program Files (x86)\Java\jdk1.8.0_05
set PATH=C:\Qt\Qt5.5.1\5.5\mingw492_32\bin;C:\Qt\Qt5.5.1\Tools\mingw492_32\bin;%PATH%
"C:\Qt\Qt5.5.1\5.5\android_armv5\bin\qmake.exe" B:\pwct2\target\mobile\qtproject\PWCT.pro -r -spec android-g++ "CONFIG+=debug" "CONFIG+=declarative_debug" "CONFIG+=qml_debug"
"C:\Qt\Qt5.5.1\Tools\mingw492_32\bin\mingw32-make.exe" 
"C:\Qt\Qt5.5.1\Tools\mingw492_32\bin\mingw32-make.exe" "INSTALL_ROOT=B:\pwct2\target\mobile\build-PWCT-Android_for_armeabi_GCC_4_9_Qt_5_5_1_7ae842-Debug\android-build" install
"C:\Qt\Qt5.5.1\5.5\android_armv5\bin\androiddeployqt.exe" --input B:/pwct2/target/mobile/build-PWCT-Android_for_armeabi_GCC_4_9_Qt_5_5_1_7ae842-Debug/android-libPWCT.so-deployment-settings.json --output B:/pwct2/target/mobile/build-PWCT-Android_for_armeabi_GCC_4_9_Qt_5_5_1_7ae842-Debug/android-build --deployment bundled --android-platform android-19 --jdk "C:/Program Files (x86)/Java/jdk1.8.0_05" --ant B:/mahmoud/Tools/Java-Android/apache-ant-1.9.4-bin/bin/ant.bat

B:/mahmoud/Tools/Java-Android/adt-bundle-windows-x86-20140702/sdk/platform-tools/adb.exe -s emulator-5554  install -r B:/pwct2/target/mobile/build-PWCT-Android_for_armeabi_GCC_4_9_Qt_5_5_1_7ae842-Debug/android-build//bin/QtApp-debug.apk