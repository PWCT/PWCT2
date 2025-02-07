#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  chdir Component
#**	Date : 2017.09.26
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class chdirComponentController from ComponentControllerParent
	oView = new chdirComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_CHDIR_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = chdir("+Variable(:Value)+")")
		return True
	} 
private
class chdirComponentView from ComponentViewParent
	Title(T_CT_CHDIR_IP_TITLE)
	TextBox(T_CT_CHDIR_IP_VALUE,:value)
	TextBox(T_CT_CHDIR_IP_VALUE2,:value2)
	PageButtons()
private
