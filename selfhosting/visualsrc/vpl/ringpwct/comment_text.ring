#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  comment_text Component
#**	Date : 2021.08.18
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class comment_textComponentController from ComponentControllerParent
	oView = new comment_textComponentView
	oHTML = new HTMLFunctions
	func GenerateAction  { 
		cValue = Variable(:Value)
		if !variable(:Value2) { 
			cValue = oHTML.HTMLSpecialChars(cValue)
			cValue = substr(cValue,nl,nl+"<br>")
		} 
		StepIsAComment()
		oNode = NewStep(cValue)
		aLines = str2List(Variable(:Value))
		cCode = ""
		if len(aLines) > 0 { 
			for cLine in aLines step 1 { 
				cCode += "#"+cLine+WindowsNL()
			} 
		} 
		setStepCode(cCode)
		#Workaround to correctly display the mult-lines comments
		#After we edit a step and increase the number of lines
		oNode.setHidden(False)
		return True
	} 
	func CheckSyntax  { 
		return True
	} 
private
class comment_textComponentView from ComponentViewParent
	Title(T_CT_COMMENT_TEXT_IP_TITLE)
	EditBox(T_CT_COMMENT_TEXT_IP_VALUE,:value)
	CheckBoxValue(T_CT_COMMENT_TEXT_IP_VALUE2,:Value2,False)
	PageButtons()
private
