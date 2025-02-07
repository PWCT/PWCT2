#/*
#	Author     : Mahmoud Fayed
#	Date       : 2021.07.12
#	Description: This script add the next source code line to each component
#		     that represent a class
#		          aAllowEmptyValue = [:value3,:value4]
#		     The goal is to set Parameters/Output Textboxes as optional
#*/
load "stdlib.ring"
aList = listAllFiles("..\..\vpl\ringpwct","ring")
for item in aList step 1 { 
	cValue = "class.ring"
	if right(item,len(cValue)) = cValue { 
		? item
		cFile = read(item)
		cFile = substr(cFile,"func GenerateAction","aAllowEmptyValue = [:value3,:value4]"+WindowsNL()+WindowsNL()+Tab+"func GenerateAction")
		? cFile
		? "Replace the file?"
		give cRep
		if cRep = "y" { 
			write(item,cFile)
		} 
	} 
} 
