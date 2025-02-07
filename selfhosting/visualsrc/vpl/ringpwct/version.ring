#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  version Component
#**	Date : 2017.09.26
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class versionComponentController from ComponentControllerParent
	oView = new versionComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_VERSION_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"version()")
		return True
	} 
private
class versionComponentView from ComponentViewParent
	Title(T_CT_VERSION_IP_TITLE)
	TextBox(T_CT_VERSION_IP_VALUE,:value)
	PageButtons()
private
