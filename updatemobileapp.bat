echo Generate the Ring Object File
ring pwct.ring -go -geo -norun
echo Copy files to target\mobile\qtproject folder
copy *.ringo target\mobile\qtproject
copy *.c target\mobile\qtproject
copy *.h target\mobile\qtproject
echo Delete temp. files
del *.c
del *.h
del *.ringo
echo Done!
