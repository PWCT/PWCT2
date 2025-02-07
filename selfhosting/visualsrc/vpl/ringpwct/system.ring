#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  system Component
#**	Date : 2017.09.25
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class systemComponentController from ComponentControllerParent
	oView = new systemComponentView
	func GenerateAction  { 
		NewStep(T_CT_SYSTEM_ST_VALUE+StepData(:Value))
		SetStepCode("system("+Variable(:Value)+")")
		return True
	} 
private
class systemComponentView from ComponentViewParent
	Title(T_CT_SYSTEM_IP_TITLE)
	TextBox(T_CT_SYSTEM_IP_VALUE,:value)
	PageButtons()
private
