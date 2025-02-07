#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_getattribute Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_getattributeComponentController from ComponentControllerParent
	oView = new refmeta_getattributeComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value3)+" = "+T_CT_REFMETA_GETATTRIBUTE_ST_VALUE+StepData(:Value)+T_CT_REFMETA_GETATTRIBUTE_ST_VALUE2+StepData(:Value2))
		SetStepCode(Variable(:Value3)+" = getattribute("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class refmeta_getattributeComponentView from ComponentViewParent
	Title(T_CT_REFMETA_GETATTRIBUTE_IP_TITLE)
	TextBox(T_CT_REFMETA_GETATTRIBUTE_IP_VALUE,:value)
	TextBox(T_CT_REFMETA_GETATTRIBUTE_IP_VALUE2,:value2)
	TextBox(T_CT_REFMETA_GETATTRIBUTE_IP_VALUE3,:value3)
	PageButtons()
private
