#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  comment_newline Component
#**	Date : 2021.08.21
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class comment_newlineComponentController from ComponentControllerParent
	oView = new comment_newlineComponentView
	func GenerateAction  { 
		StepIsAComment()
		if Variable(:type) = 1 { 
			oNode = NewStep("<hr/>")
			setStepCode("#"+copy("=",50))
			else
				oNode = NewStep("")
				setStepCode("#")
		} 
		return True
	} 
private
class comment_newlineComponentView from ComponentViewParent
	Title(T_CT_COMMENT_NEWLINE_IP_TITLE)
	ListBox(T_CT_COMMENT_IP_TYPE,:type,T_CT_COMMENT_IP_TYPELIST)
	PageButtons()
private
