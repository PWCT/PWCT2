echo off
cls
set RINGEXEPATH=b:/ring/bin/
cd /d %~dp1
"%RINGEXEPATH%/ring.exe" %1
exit
