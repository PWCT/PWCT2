#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_cfunctions Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_cfunctionsComponentController from ComponentControllerParent
	oView = new refmeta_cfunctionsComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_REFMETA_CFUNCTIONS_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"cfunctions()")
		return True
	} 
private
class refmeta_cfunctionsComponentView from ComponentViewParent
	Title(T_CT_REFMETA_CFUNCTIONS_IP_TITLE)
	TextBox(T_CT_REFMETA_CFUNCTIONS_IP_VALUE,:value)
	PageButtons()
private
