echo Generate the Ring Object File
ring pwct.ring -go -geo -norun
echo Copy files to target\mobile\qtproject folder
copy *.ringo target\mobile\qtproject
rem copy /Y mobileapp\*.ring target\mobile\qtproject\mobileapp
rem copy /Y project.qrc target\mobile\qtproject\mobileapp
rem copy *.c target\mobile\qtproject
rem copy *.h target\mobile\qtproject
echo Delete temp. files
rem del *.c
rem del *.h
del *.ringo
echo Done!
