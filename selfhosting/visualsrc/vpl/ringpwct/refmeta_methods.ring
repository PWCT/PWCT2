#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_methods Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_methodsComponentController from ComponentControllerParent
	oView = new refmeta_methodsComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_REFMETA_METHODS_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = methods("+Variable(:Value)+")")
		return True
	} 
private
class refmeta_methodsComponentView from ComponentViewParent
	Title(T_CT_REFMETA_METHODS_IP_TITLE)
	TextBox(T_CT_REFMETA_METHODS_IP_VALUE,:value)
	TextBox(T_CT_REFMETA_METHODS_IP_VALUE2,:value2)
	PageButtons()
private
