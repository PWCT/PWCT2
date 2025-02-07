#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_startswith Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_startswithComponentController from ComponentControllerParent
	oView = new stdlib_startswithComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value3)+" = "+T_CT_STDLIB_STARTSWITH_ST_VALUE+StepData(:Value)+T_CT_STDLIB_STARTSWITH_ST_VALUE2+StepData(:Value2))
		SetStepCode(Variable(:Value3)+" = startswith("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class stdlib_startswithComponentView from ComponentViewParent
	Title(T_CT_STDLIB_STARTSWITH_IP_TITLE)
	TextBox(T_CT_STDLIB_STARTSWITH_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_STARTSWITH_IP_VALUE2,:value2)
	TextBox(T_CT_STDLIB_STARTSWITH_IP_VALUE3,:value3)
	PageButtons()
private
