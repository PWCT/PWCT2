#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_file2list Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_file2listComponentController from ComponentControllerParent
	oView = new stdlib_file2listComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_STDLIB_FILE2LIST_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = file2list("+Variable(:Value)+")")
		return True
	} 
private
class stdlib_file2listComponentView from ComponentViewParent
	Title(T_CT_STDLIB_FILE2LIST_IP_TITLE)
	TextBox(T_CT_STDLIB_FILE2LIST_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_FILE2LIST_IP_VALUE2,:value2)
	PageButtons()
private
