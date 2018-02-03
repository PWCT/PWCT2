/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	: HTML Functions Class
**	Date 		: 2017.09.24
**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
*/

class HTMLFunctions


	/*
		HTML Special Character 
		Input : String contains Special Characters like < and >
		Output : String to be displayed in HTML pages
	*/
	func HTMLSpecialChars cStr
		cResult = ""
		if isstring(cStr) and len(cStr) > 0 {
			for x in cStr {
				if x = '&'  { 
					cResult += '&amp;' 
				elseif x = '"' cResult += '&quot;'
				elseif x = "'" cResult += '&#039;'
				elseif x = '<' cResult += '&lt;'
				elseif x = '>' cResult += '&gt;'
				elseif x = ' ' cResult += '&nbsp;'
				else 	    cResult += x
				}
			}
		}
		return cResult

	/*
		HTML Special Character to Normal Text
	*/

	func HTMLSpecialChars2Text cStr
		cStr = substr(cStr,'&amp;',"&")
		cStr = substr(cStr,'&quot;','"')
		cStr = substr(cStr,'&#039;',"'")
		cStr = substr(cStr,'&lt;',"<")
		cStr = substr(cStr,'&gt;',">")
		cStr = substr(cStr,'&nbsp;'," ")
		return cStr

	func RemoveTags cStr
		cOutput = ""
		lTagStart = False 
		for x = 1 to len(cStr) { 
			if lTagStart and cStr[x] = ">" {
				lTagStart = False
				loop 
			}
			if lTagStart { Loop }
			if cStr[x] = "<" {
				lTagStart = True
				loop 
			}
			cOutput += cStr[x]
		}
		return cOutput
