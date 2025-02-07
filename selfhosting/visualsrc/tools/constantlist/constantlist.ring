#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  Constant List
#**	Date : 2018.03.29
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
load "stdlib.ring"
load "guilib.ring"
load "weblib.ring"
import System.web
see "Enter the file name : "
give cFileName
cFile = read(cFileName)
aConstants = Str2List(cFile)
aConstants = sort(aConstants)
#Remove Duplication
for x = len(aConstants) to 1 step -1 { 
	if find(aConstants,aConstants[x]) < x { 
		del(aConstants,x)
	} 
} 
cCode = ""
cCode2 = "["
x = 1
for cMethod in aConstants step 1 { 
	cCode += copy(tab,3)+"case "+x+' cFunc = "'+cMethod+'"'+nl
	if x! = 1 { 
		cCode2 += ","
	} 
	cCode2 += '"'+cMethod+'"'
	x++
} 
cCode2 += "]"
? cCode
? cCode2
cFile = cCode+cCode2
cFile = substr(CFile,nl,windowsnl())
write("output.txt",cFile)
system("start notepad output.txt")
