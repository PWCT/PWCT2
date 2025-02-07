#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_packagename Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_packagenameComponentController from ComponentControllerParent
	oView = new refmeta_packagenameComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_REFMETA_PACKAGENAME_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"packagename()")
		return True
	} 
private
class refmeta_packagenameComponentView from ComponentViewParent
	Title(T_CT_REFMETA_PACKAGENAME_IP_TITLE)
	TextBox(T_CT_REFMETA_PACKAGENAME_IP_VALUE,:value)
	PageButtons()
private
