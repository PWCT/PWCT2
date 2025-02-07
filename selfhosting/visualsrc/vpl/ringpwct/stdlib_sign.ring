#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_sign Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_signComponentController from ComponentControllerParent
	oView = new stdlib_signComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_STDLIB_SIGN_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = sign("+Variable(:Value)+")")
		return True
	} 
private
class stdlib_signComponentView from ComponentViewParent
	Title(T_CT_STDLIB_SIGN_IP_TITLE)
	TextBox(T_CT_STDLIB_SIGN_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_SIGN_IP_VALUE2,:value2)
	PageButtons()
private
