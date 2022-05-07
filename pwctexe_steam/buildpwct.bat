call b:\ring\language\src\locatevc.bat

cls

rc pwct.rc
cl /DEBUG pwct.c pwct.res /link advapi32.lib shell32.lib /SUBSYSTEM:WINDOWS,"5.01" 
