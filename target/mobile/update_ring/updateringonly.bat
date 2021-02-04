rem	Simple Batch file to update Ring only Android-Qt Version 
rem	Author : Mahmoud Fayed <msfclipper@yahoo.com>

copy b:\ring\language\src\*.c ..\qtproject\ring\src\
copy ring_ext.c ..\qtproject\ring\src\
copy b:\ring\language\include\*.h ..\qtproject\ring\include\
copy ring_ext.h ..\qtproject\ring\include
