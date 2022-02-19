echo Generate the Ring Object File
ring pwct.ring -go -norun
echo Copy files to target\webassembly\qtproject folder
copy *.ringo target\webassembly\qtproject
rem copy /Y mobileapp\*.ring target\webassembly\qtproject\mobileapp
rem copy /Y project.qrc target\webassembly\qtproject\mobileapp
echo Done!
