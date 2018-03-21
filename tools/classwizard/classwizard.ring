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
x = 1
for cMethod in aMethods
	cCode += copy(tab,3)+"case "+x+' cFunc = "' + cMethod + '"' + nl
	if x != 1
		cCode2 += ","
	ok
	cCode2 += '"' + cMethod + '"'
	x++ 
next 
cCode2 += "]"

? cCode 
? cCode2 

cFile = cCode+cCode2
cFile = substr(CFile,nl,windowsnl())
write("output.txt",cFile)
system("start notepad output.txt")
