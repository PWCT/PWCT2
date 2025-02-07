#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose : Automatic creation of Selfhosting PWCT2 version
#**	Date : 2025.02.07
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
load "stdlibcore.ring"
chdir("../")
OSCreateOpenFolder("visualsrc")
OSCopyFolder("../../src",".")
chdir("../")
aList = listallfiles("visualsrc","*.ring")
for cFile in aList step 1 { 
	cFile2 = substr(cFile,".ring",".pwct")
	system("ring2pwct "+cFile+" "+cFile2)
	system("pwct2ring "+cFile2+" "+cFile)
} 
