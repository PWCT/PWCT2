#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  upper Component
#**	Date : 2017.07.23
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class upperComponentController from ComponentControllerParent
	oView = new upperComponentView
	func GenerateAction  { 
		if NoValueMsg(:value) OR NoValueMsg(:value2) { 
			return False
		} 
		NewStep(StepData(:value2)+" = "+T_CT_UPPER_ST_UPPER+StepData(:value))
		SetStepCode(Variable(:value2)+" = upper("+Variable(:value)+")")
		return True
	} 
private
class upperComponentView from ComponentViewParent
	Title(T_CT_UPPER_IP_TITLE)
	TextBox(T_CT_UPPER_IP_VALUE,:value)
	TextBox(T_CT_UPPER_IP_VALUE2,:value2)
	PageButtons()
private
