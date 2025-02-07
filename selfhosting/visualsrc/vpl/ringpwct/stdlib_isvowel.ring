#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_isvowel Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_isvowelComponentController from ComponentControllerParent
	oView = new stdlib_isvowelComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_STDLIB_ISVOWEL_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = isvowel("+Variable(:Value)+")")
		return True
	} 
private
class stdlib_isvowelComponentView from ComponentViewParent
	Title(T_CT_STDLIB_ISVOWEL_IP_TITLE)
	TextBox(T_CT_STDLIB_ISVOWEL_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_ISVOWEL_IP_VALUE2,:value2)
	PageButtons()
private
