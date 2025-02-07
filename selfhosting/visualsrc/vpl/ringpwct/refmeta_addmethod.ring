#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_addmethod Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_addmethodComponentController from ComponentControllerParent
	oView = new refmeta_addmethodComponentView
	func GenerateAction  { 
		NewStep(T_CT_REFMETA_ADDMETHOD_ST_VALUE+StepData(:Value)+T_CT_REFMETA_ADDMETHOD_ST_VALUE2+StepData(:Value2)+T_CT_REFMETA_ADDMETHOD_ST_VALUE3+StepData(:Value3))
		SetStepCode("addmethod("+Variable(:Value)+","+Variable(:Value2)+","+Variable(:Value3)+")")
		return True
	} 
private
class refmeta_addmethodComponentView from ComponentViewParent
	Title(T_CT_REFMETA_ADDMETHOD_IP_TITLE)
	TextBox(T_CT_REFMETA_ADDMETHOD_IP_VALUE,:value)
	TextBox(T_CT_REFMETA_ADDMETHOD_IP_VALUE2,:value2)
	TextBox(T_CT_REFMETA_ADDMETHOD_IP_VALUE3,:value3)
	PageButtons()
private
