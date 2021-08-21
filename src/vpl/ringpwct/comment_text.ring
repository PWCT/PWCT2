/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  comment_text Component
**	Date : 2021.08.18
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class comment_textComponentController from ComponentControllerParent 

	oView = new comment_textComponentView

	func GenerateAction 

		StepIsAComment()
		NewStep(substr(Variable(:Value),nl,nl+"<br>"))

		aLines = str2List(Variable(:Value) )
		cCode  = ""

		if len(aLines) > 0 {
			for cLine in aLines {
				cCode += "# " + cLine + WindowsNL()
			}
		}
		setStepCode(cCode)

		return True 

	func CheckSyntax
		return True

class comment_textComponentView from ComponentViewParent
	 
		Title( T_CT_COMMENT_TEXT_IP_TITLE )	
		EditBox( T_CT_COMMENT_TEXT_IP_VALUE , :value)
		PageButtons()
