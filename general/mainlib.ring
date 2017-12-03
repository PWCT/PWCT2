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
