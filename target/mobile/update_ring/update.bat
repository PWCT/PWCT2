rem	Simple Batch file to update Ring and RingQt in the Android-Qt Version 
rem	Author : Mahmoud Fayed <msfclipper@yahoo.com>

copy b:\ring\src\*.c ..\qtproject\
copy ring_ext.c ..\qtproject\
copy b:\ring\include\*.h ..\qtproject\
copy ring_ext.h ..\qtproject\
cd\
cd b:\ring\extensions\ringqt\
call gencodeandroid.bat
copy cpp\src\*.cpp b:\pwct2\target\mobile\qtproject\
copy cpp\include\*.h b:\pwct2\target\mobile\qtproject\
call gencodeqt512_nobluetooth.bat
cd b:\pwct2\target\mobile\update_ring