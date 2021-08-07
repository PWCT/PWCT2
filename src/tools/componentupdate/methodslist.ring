/*
	Author     : Mahmoud Fayed 
	Date       : 2021.07.12
	Description: This script add the methods list to translation files 
			The script work on components that represent classes
			So we can control what appears in each list
			i.e. we can delete methods or change the order 
			from translation files without updating the source code.
*/

load "stdlib.ring"
load "guilib.ring"
load "weblib.ring"

import System.web

aList = listAllFiles("..\..\vpl\ringpwct","ring")
aClasses = []
for item in aList
	cValue = "class.ring"
	if right(item,len(cValue)) = cValue 
		nPos = substr(Item,"/")
		cClass = substr(Item,nPos+1)
		cClass = left(cClass, len(cClass) - len(cValue) )
		if find(["qdialslider","refmeta_is","refmeta_ispackage"],cClass)
			cClass = ""
		ok
		if trim(cClass) != NULL 
			aClasses + cClass	
		ok
	ok
next
aClasses + "tree"
aClasses + "weblib_application"
aClasses + "weblib_page"
aClasses + "weblib_scriptfunctions"
aClasses + "weblib_stylefunctions"
? aClasses
? "Count : " + len(aClasses)

for cClass in aClasses
	UpdateTranslationFile(GetClassFiles(cClass)[1],cClass)
	UpdateTranslationFile(GetClassFiles(cClass)[2],cClass)	
	UpdateCodeFile(GetClassFiles(cClass)[3],cClass)	
next

func UpdateCodeFile cFileName,cClass
	cFileContent = Read(cFileName)
	nPos = substr(cFileContent,"switch")
	nPos2 = substr(cFileContent,"}")
	if nPos > 0 and nPos2 > 0 
		cLine = "cFunc = T_CT_"+Upper(cClass)+"CLASS_IP_VALUE2FUNC[ Variable(:Value2) ]" 
		nPos3 = substr(cFileContent,cLine)
		if nPos3 = 0
			? "Update File : " + cFileName
			cFileContent = substr(cFileContent,1,nPos-1) + nl + 
			Copy(Tab,4) + "# Get the function name in the generated code" + nl + 
			Copy(Tab,5) + cLine  +
			substr(cFileContent,nPos2+1)
			write(cFileName,cFileContent)
		ok

	ok

func UpdateTranslationFile cFileName,cClass
	cFileContent = Read(cFileName)
	nPos = substr(cFileContent,"T_CT_"+Upper(cClass)+"CLASS_IP_VALUE2LIST")
	if nPos > 0
		nPos2 = substr(cFileContent,"T_CT_"+Upper(cClass)+"CLASS_IP_VALUE2FUNC")
		if nPos2 = 0
			cFileContent = substr(cFileContent,1,nPos-1) + GetNewList(cClass) + substr(cFileContent,nPos)
			? "Update File : " + cFileName
			write(cFileName,cFileContent)
		ok
	ok

func GetNewList cClassName

	eval("oObject = new "+substr(cClassName,"weblib_",""))
	aMethods = methods(oOBJECT)
	aMethods = sort(aMethods)

	# Remove Duplication
	for x=len(aMethods) to 1 step -1
			if find(aMethods,aMethods[x]) < x
				del(aMethods,x)
			ok
	next

	cCode = nl+"T_CT_"+Upper(cClassName)+"CLASS_IP_VALUE2FUNC = [" + nl
	x = 1
	for cMethod in aMethods
		if x = len(aMethods)
			cCode += Tab + '"' + cMethod + '"' + nl
		else
			cCode += Tab + '"' + cMethod + '"' + "," + nl
		ok
		x++ 
	next 
	cCode += "]" + nl
	
	return cCode

func GetClassFiles cClassName
	cFolder = "..\..\vpl\ringpwct\"
	return [
		cFolder + "translation\english\" + cClassName + "classEnglish.ring",
		cFolder + "translation\arabic\" + cClassName + "classArabic.ring",
		cFolder + cClassName + "class.ring"
	]