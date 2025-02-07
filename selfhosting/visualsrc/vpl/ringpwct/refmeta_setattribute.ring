#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_setattribute Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_setattributeComponentController from ComponentControllerParent
	oView = new refmeta_setattributeComponentView
	func GenerateAction  { 
		NewStep(T_CT_REFMETA_SETATTRIBUTE_ST_VALUE+StepData(:Value)+T_CT_REFMETA_SETATTRIBUTE_ST_VALUE2+StepData(:Value2)+T_CT_REFMETA_SETATTRIBUTE_ST_VALUE3+StepData(:Value3))
		SetStepCode("setattribute("+Variable(:Value)+","+Variable(:Value2)+","+Variable(:Value3)+")")
		return True
	} 
private
class refmeta_setattributeComponentView from ComponentViewParent
	Title(T_CT_REFMETA_SETATTRIBUTE_IP_TITLE)
	TextBox(T_CT_REFMETA_SETATTRIBUTE_IP_VALUE,:value)
	TextBox(T_CT_REFMETA_SETATTRIBUTE_IP_VALUE2,:value2)
	TextBox(T_CT_REFMETA_SETATTRIBUTE_IP_VALUE3,:value3)
	PageButtons()
private
