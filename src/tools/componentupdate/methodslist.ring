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
? aClasses
? "Count : " + len(aClasses)

for cClass in aClasses
	UpdateTranslationFile(GetClassFiles(cClass)[1],cClass)
	UpdateTranslationFile(GetClassFiles(cClass)[2],cClass)	
next



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

	eval("oObject = new "+cClassName)
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