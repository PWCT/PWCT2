/* 
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
** 	File Purpose : Main Library (Common Functions)
**	Date : 2017.12.03
** 	Author : Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"

if isMainSourceFile() {
	mylist = [ 1,2,3,"four","five",[ :six = 6 , :seven = 7],8,:nine,:ten]
	see listToRingCode(mylist)
}

func ListToRingCode aList
	cCode = "["+nl
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
			cCode += ListToRingCode(item)
		}
	}
	cCode += nl+"]"
	return cCode
