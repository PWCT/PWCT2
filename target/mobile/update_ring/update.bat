rem	Simple Batch file to update Ring and RingQt in the Android-Qt Version 
rem	Author : Mahmoud Fayed <msfclipper@yahoo.com>

copy b:\ring\language\src\*.c ..\qtproject\ring\src\
copy ring_ext.c ..\qtproject\ring\src\
copy b:\ring\language\include\*.h ..\qtproject\ring\include\
copy ring_ext.h ..\qtproject\ring\include\
cd ..\..\..\..\ring\extensions\ringqt\
call gencodeandroid.bat
copy cpp\src\*.cpp b:\pwct2\target\mobile\qtproject\ringqt\src\
copy cpp\include\*.h b:\pwct2\target\mobile\qtproject\ringqt\include\
call gencodeqt515_nobluetooth.bat
cd \
cd B:\pwct2\target\mobile\update_ring