#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  refmeta_packages Component
#**	Date : 2017.10.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class refmeta_packagesComponentController from ComponentControllerParent
	oView = new refmeta_packagesComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_REFMETA_PACKAGES_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"packages()")
		return True
	} 
private
class refmeta_packagesComponentView from ComponentViewParent
	Title(T_CT_REFMETA_PACKAGES_IP_TITLE)
	TextBox(T_CT_REFMETA_PACKAGES_IP_VALUE,:value)
	PageButtons()
private
