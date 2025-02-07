#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  reverse Component
#**	Date : 2017.07.21
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class reverseComponentController from ComponentControllerParent
	oView = new reverseComponentView
	func GenerateAction  { 
		NewStep(StepData(:value2)+" = "+T_CT_REVERSE_ST_REVERSELIST+StepData(:value))
		SetStepCode(Variable(:value2)+" = reverse("+Variable(:value)+")")
		return True
	} 
private
class reverseComponentView from ComponentViewParent
	Title(T_CT_REVERSE_IP_TITLE)
	TextBox(T_CT_REVERSE_IP_VALUE,:value)
	TextBox(T_CT_REVERSE_IP_VALUE2,:value2)
	PageButtons()
private
