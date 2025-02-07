#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_isglobal Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_isglobalComponentController from ComponentControllerParent
	oView = new refmeta_isglobalComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_REFMETA_ISGLOBAL_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = isglobal("+Variable(:Value)+")")
		return True
	} 
private
class refmeta_isglobalComponentView from ComponentViewParent
	Title(T_CT_REFMETA_ISGLOBAL_IP_TITLE)
	TextBox(T_CT_REFMETA_ISGLOBAL_IP_VALUE,:value)
	TextBox(T_CT_REFMETA_ISGLOBAL_IP_VALUE2,:value2)
	PageButtons()
private
