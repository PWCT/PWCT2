rem	Simple Batch file to update Ring and RingQt in the WebAssembly-Qt Version 
rem	Author : Mahmoud Fayed <msfclipper@yahoo.com>

copy b:\ring\src\*.c ..\qtproject\
copy ring_ext.c ..\qtproject\
copy b:\ring\include\*.h ..\qtproject\
copy ring_ext.h ..\qtproject\
cd\
cd ring\extensions\ringqt\
call gencodewebassemblylight.bat
copy cpp\src\*.cpp b:\pwct2\target\webassembly\qtproject\
copy cpp\include\*.h b:\pwct2\target\webassembly\qtproject\
call gencodeqt512_nobluetooth.bat
cd\
cd pwct2\target\webassembly\update_ring