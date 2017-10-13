echo off
rem call vc.bat
call "C:\Program Files\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86

cls

rc pwct.rc
cl /DEBUG pwct.c pwct.res /link advapi32.lib shell32.lib /SUBSYSTEM:WINDOWS,"5.01" 

copy pwct.exe ..\
