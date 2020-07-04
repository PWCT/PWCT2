echo Generate the Ring Object File
ring pwct.ring -go -norun
echo Copy files to target\webassembly\qtproject folder
copy *.ringo target\webassembly\qtproject
copy /Y mobileapp\*.ring target\webassembly\qtproject\mobileapp
copy /Y project.qrc target\webassembly\qtproject\mobileapp
echo Delete temp. files
del *.ringo
echo Done!
