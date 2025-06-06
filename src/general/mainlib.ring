/* 
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
** 	File Purpose : Main Library (Common Functions)
**	Date : 2017.12.03
** 	Author : Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlibcore.ring"

if isMainSourceFile() {
	mylist = [ 1,2,3,"four","five",[ :six = 6 , :seven = 7],8,:nine,:ten]
	see list2RingCode(mylist)
}

func List2RingCode aList
	cCode = "["+Windowsnl()
	lStart = True
	for item in aList {
		if !lStart {
			cCode += ","
		else 
			lStart = False
		}
		if isString(item) {
			cCode += '"' + item + '"' 
		elseif isnumber(item)
			cCode += (""+item)
		elseif islist(item)
			cCode += List2RingCode(item)
		}
	}
	cCode += windowsnl()+"]"
	return cCode

func RemoveFirstTabs cString,nCount
	aList = str2list(cString)
	for item in aList 
		if left(item,nCount) = Copy(char(9),nCount)
			if len(item) > nCount
				item = substr(item,nCount+1)
			ok
		ok
	next
	return list2str(aList)


/*
	Purpose : Set the Encoding 
	Parameters : File Name 
	Output : File Name after changing the Encoding to local8bit  
*/

func FileNameEncoding cFileName
    # Starting from Ring 1.16 - We don't need this function
	if number(version()) <= 1.15 {
		if isWindows() {
			return fileSystemToLocal8Bit(cFileName)
		}

	}
	return cFileName


/*
	Purpose : Change the current folder
	Parameters : Folder Name 
	Output : None
*/

func changeFolder cFolder 
	cFolder = fileSystemToLocal8Bit(cFolder)
	chdir(cFolder)
	
func fileSystemToLocal8Bit cName 
	if isWindows() {
		oString = new qString2()
		oString.Append(cName)
		cName = oString.tolocal8bit().data() 
	}
	return cName 
	
