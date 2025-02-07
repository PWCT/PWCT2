#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  shutdown Component
#**	Date : 2017.09.26
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class shutdownComponentController from ComponentControllerParent
	oView = new shutdownComponentView
	func GenerateAction  { 
		NewStep(T_CT_SHUTDOWN_ST_VALUE+StepData(:Value))
		SetStepCode("shutdown("+Variable(:Value)+")")
		return True
	} 
private
class shutdownComponentView from ComponentViewParent
	Title(T_CT_SHUTDOWN_IP_TITLE)
	TextBox(T_CT_SHUTDOWN_IP_VALUE,:value)
	PageButtons()
private
