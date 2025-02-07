#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  freetyping Component
#**	Date : 2017.10.01
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class freetypingComponentController from ComponentControllerParent
	oView = new freetypingComponentView
	func GenerateAction  { 
		NewStep(StepData(:value))
		SetStepCode(Variable(:value))
		return True
	} 
private
class freetypingComponentView from ComponentViewParent
	Title(T_CT_FREETYPING_IP_TITLE)
	EditBox(T_CT_FREETYPING_IP_VALUE,:value)
	PageButtons()
private
