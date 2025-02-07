#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  package Component
#**	Date : 2017.10.01
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class packageComponentController from ComponentControllerParent
	oView = new packageComponentView
	func GenerateAction  { 
		NewStep(T_CT_PACKAGE_ST_PACKAGE+" "+StepData(:value))
		SetStepCode("package "+Variable(:value))
		return True
	} 
private
class packageComponentView from ComponentViewParent
	Title(T_CT_PACKAGE_IP_TITLE)
	TextBox(T_CT_PACKAGE_IP_VALUE,:value)
	PageButtons()
private
