#/*
#**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose 	: HTML Functions Class
#**	Date 		: 2017.09.24
#**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class HTMLFunctions
	#/*
	#		HTML Special Character
	#		Input : String contains Special Characters like < and >
	#		Output : String to be displayed in HTML pages
	#	*/
	func HTMLSpecialChars cStr { 
		cResult = ""
		if isstring(cStr) AND len(cStr) > 0 { 
			for x in cStr step 1 { 
				if x = "&" { 
					cResult += "&amp;"
					elseif x = '"'
						cResult += "&quot;"
					elseif x = "'"
						cResult += "&#039;"
					elseif x = "<"
						cResult += "&lt;"
					elseif x = ">"
						cResult += "&gt;"
					elseif x = " "
						cResult += "&nbsp;"
					else
						cResult += x
				} 
			} 
		} 
		return cResult
		#/*
		#		HTML Special Character to Normal Text
		#	*/
	} 
	func HTMLSpecialChars2Text cStr { 
		cStr = substr(cStr,"&amp;","&")
		cStr = substr(cStr,"&quot;",'"')
		cStr = substr(cStr,"&#039;","'")
		cStr = substr(cStr,"&lt;","<")
		cStr = substr(cStr,"&gt;",">")
		cStr = substr(cStr,"&nbsp;"," ")
		return cStr
		#/*
		#		Remove Tags from the string
		#	*/
	} 
	func RemoveTags cStr { 
		if  NOT substr(cStr,"<") { 
			return cStr
		} 
		cOutput = ""
		lTagStart = False
		for x = 1 to len(cStr) step 1 { 
			if lTagStart AND cStr[x] = ">" { 
				lTagStart = False
				loop 1
			} 
			if lTagStart { 
				loop 1
			} 
			if cStr[x] = "<" { 
				lTagStart = True
				loop 1
			} 
			cOutput += cStr[x]
		} 
		return cOutput
		#/*
		#		Get the Plain text from a string contains HTML
		#	*/
	} 
	func PlainText cHtml { 
		return RemoveTags( HTMLSpecialChars2Text( cHTML ) ) 
	} 
private
