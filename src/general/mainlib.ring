/* 
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
** 	File Purpose : Main Library (Common Functions)
**	Date : 2017.12.03
** 	Author : Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"

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