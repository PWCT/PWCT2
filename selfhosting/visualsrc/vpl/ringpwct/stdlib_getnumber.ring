#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_getnumber Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_getnumberComponentController from ComponentControllerParent
	oView = new stdlib_getnumberComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_STDLIB_NUMBER_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"getnumber()")
		return True
	} 
private
class stdlib_getnumberComponentView from ComponentViewParent
	Title(T_CT_STDLIB_GETNUMBER_IP_TITLE)
	TextBox(T_CT_STDLIB_GETNUMBER_IP_VALUE,:value)
	PageButtons()
private
