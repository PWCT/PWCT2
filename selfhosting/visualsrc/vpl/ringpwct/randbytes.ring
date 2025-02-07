#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  randbytes Component
#**	Date : 2017.09.30
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class randbytesComponentController from ComponentControllerParent
	oView = new randbytesComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_RANDBYTES_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = randbytes("+Variable(:Value)+")")
		return True
	} 
private
class randbytesComponentView from ComponentViewParent
	Title(T_CT_RANDBYTES_IP_TITLE)
	TextBox(T_CT_RANDBYTES_IP_VALUE,:value)
	TextBox(T_CT_RANDBYTES_IP_VALUE2,:value2)
	PageButtons()
private
