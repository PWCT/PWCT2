#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  windowsnl Component
#**	Date : 2017.09.25
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class windowsnlComponentController from ComponentControllerParent
	oView = new windowsnlComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_WINDOWSNL_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"windowsnl()")
		return True
	} 
private
class windowsnlComponentView from ComponentViewParent
	Title(T_CT_WINDOWSNL_IP_TITLE)
	TextBox(T_CT_WINDOWSNL_IP_VALUE,:value)
	PageButtons()
private
