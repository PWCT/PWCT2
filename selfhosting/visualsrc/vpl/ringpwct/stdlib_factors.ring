#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_factors Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_factorsComponentController from ComponentControllerParent
	oView = new stdlib_factorsComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_STDLIB_FACTORS_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = factors("+Variable(:Value)+")")
		return True
	} 
private
class stdlib_factorsComponentView from ComponentViewParent
	Title(T_CT_STDLIB_FACTORS_IP_TITLE)
	TextBox(T_CT_STDLIB_FACTORS_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_FACTORS_IP_VALUE2,:value2)
	PageButtons()
private
