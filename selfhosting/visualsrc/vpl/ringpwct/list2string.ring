#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  list2string Component
#**	Date : 2017.07.26
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class list2stringComponentController from ComponentControllerParent
	oView = new list2stringComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_LIST2STRING_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = list2str("+Variable(:Value)+")")
		return True
	} 
private
class list2stringComponentView from ComponentViewParent
	Title(T_CT_LIST2STRING_IP_TITLE)
	TextBox(T_CT_LIST2STRING_IP_VALUE,:value)
	TextBox(T_CT_LIST2STRING_IP_VALUE2,:value2)
	PageButtons()
private
