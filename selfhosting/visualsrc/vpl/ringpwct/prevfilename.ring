#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  prevfilename Component
#**	Date : 2017.09.26
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class prevfilenameComponentController from ComponentControllerParent
	oView = new prevfilenameComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_PREVFILENAME_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"prevfilename()")
		return True
	} 
private
class prevfilenameComponentView from ComponentViewParent
	Title(T_CT_PREVFILENAME_IP_TITLE)
	TextBox(T_CT_PREVFILENAME_IP_VALUE,:value)
	PageButtons()
private
