#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  string2list Component
#**	Date : 2017.07.26
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class string2listComponentController from ComponentControllerParent
	oView = new string2listComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_STRING2LIST_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = str2list("+Variable(:Value)+")")
		return True
	} 
private
class string2listComponentView from ComponentViewParent
	Title(T_CT_STRING2LIST_IP_TITLE)
	TextBox(T_CT_STRING2LIST_IP_VALUE,:value)
	TextBox(T_CT_STRING2LIST_IP_VALUE2,:value2)
	PageButtons()
private
