/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  comment_newline Component
**	Date : 2021.08.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class comment_newlineComponentController from ComponentControllerParent 

	oView = new comment_newlineComponentView

	func GenerateAction 

		StepIsAComment()
		oNode = NewStep("<hr/>")
		setStepCode("#"+copy("=",50))

		return True 

	func AfterOpen 
		OkAction()

class comment_newlineComponentView from ComponentViewParent
	 
		Title( T_CT_COMMENT_NEWLINE_IP_TITLE )	
		PageButtons()
