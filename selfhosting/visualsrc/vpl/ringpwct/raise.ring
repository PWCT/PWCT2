#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  raise Component
#**	Date : 2017.09.26
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class raiseComponentController from ComponentControllerParent
	oView = new raiseComponentView
	func GenerateAction  { 
		NewStep(T_CT_RAISE_ST_VALUE+StepData(:Value))
		SetStepCode("raise("+Variable(:Value)+")")
		return True
	} 
private
class raiseComponentView from ComponentViewParent
	Title(T_CT_RAISE_IP_TITLE)
	TextBox(T_CT_RAISE_IP_VALUE,:value)
	PageButtons()
private
