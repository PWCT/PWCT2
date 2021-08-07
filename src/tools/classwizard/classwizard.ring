/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Class Wizard 
**	Date : 2017.12.14
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


load "stdlib.ring"
load "guilib.ring"
load "weblib.ring"

import System.web

see "Enter the class name : " give cClassName

eval("oObject = new "+cClassName)
aMethods = methods(oOBJECT)
aMethods = sort(aMethods)

# Remove Duplication
	for x=len(aMethods) to 1 step -1
			if find(aMethods,aMethods[x]) < x
				del(aMethods,x)
			ok
	next


cCode = ""
cCode2 = "[" 
cCode3 = nl+"T_CT_"+Upper(cClassName)+"CLASS_IP_VALUE2FUNC = [" + nl
x = 1
for cMethod in aMethods
	cCode += copy(tab,3)+"case "+x+' cFunc = "' + cMethod + '"' + nl
	if x != 1
		cCode2 += ","
	ok
	cCode2 += '"' + cMethod + '"'
	if x = len(aMethods)
		cCode3 += Tab + '"' + cMethod + '"' + nl
	else
		cCode3 += Tab + '"' + cMethod + '"' + "," + nl
	ok
	x++ 
next 
cCode2 += "]"
cCode3 += "]" + nl

? cCode3
? cCode2 
? cCode 
cFile = cCode3+cCode2+cCode
cFile = substr(CFile,nl,windowsnl())
write("output.txt",cFile)
system("start notepad output.txt")
