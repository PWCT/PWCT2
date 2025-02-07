#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_mergemethods Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_mergemethodsComponentController from ComponentControllerParent
	oView = new refmeta_mergemethodsComponentView
	func GenerateAction  { 
		NewStep(T_CT_REFMETA_MEGEMETHODS_ST_VALUE+StepData(:Value)+T_CT_REFMETA_MEGEMETHODS_ST_VALUE2+StepData(:Value2))
		SetStepCode("mergemethods("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class refmeta_mergemethodsComponentView from ComponentViewParent
	Title(T_CT_REFMETA_MERGEMETHODS_IP_TITLE)
	TextBox(T_CT_REFMETA_MERGEMETHODS_IP_VALUE,:value)
	TextBox(T_CT_REFMETA_MERGEMETHODS_IP_VALUE2,:value2)
	PageButtons()
private
