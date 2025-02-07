#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  newemptylist Component
#**	Date : 2017.07.20
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class newemptylistComponentController from ComponentControllerParent
	oView = new newemptylistComponentView
	func GenerateAction  { 
		NewStep(StepData(:value)+" = []")
		SetStepCode(Variable(:value)+" = []")
		return True
	} 
private
class newemptylistComponentView from ComponentViewParent
	Title(T_CT_NEWEMPTYLIST_IP_TITLE)
	TextBox(T_CT_NEWEMPTYLIST_IP_VALUE,:value)
	PageButtons()
private
