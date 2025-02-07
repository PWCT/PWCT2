#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_readline Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_readlineComponentController from ComponentControllerParent
	oView = new stdlib_readlineComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_STDLIB_READLINE_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = readline("+Variable(:Value)+")")
		return True
	} 
private
class stdlib_readlineComponentView from ComponentViewParent
	Title(T_CT_STDLIB_READLINE_IP_TITLE)
	TextBox(T_CT_STDLIB_READLINE_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_READLINE_IP_VALUE2,:value2)
	PageButtons()
private
