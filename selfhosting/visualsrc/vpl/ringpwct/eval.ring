#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  eval Component
#**	Date : 2017.09.26
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class evalComponentController from ComponentControllerParent
	oView = new evalComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_EVAL_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = eval("+Variable(:Value)+")")
		return True
	} 
private
class evalComponentView from ComponentViewParent
	Title(T_CT_EVAL_IP_TITLE)
	TextBox(T_CT_EVAL_IP_VALUE,:value)
	TextBox(T_CT_EVAL_IP_VALUE2,:value2)
	PageButtons()
private
