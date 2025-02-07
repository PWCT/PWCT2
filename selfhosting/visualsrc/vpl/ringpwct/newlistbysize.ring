#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  newlistbysize Component
#**	Date : 2017.07.20
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class newlistbysizeComponentController from ComponentControllerParent
	oView = new newlistbysizeComponentView
	func GenerateAction  { 
		NewStep(StepData(:value)+" = list("+StepData(:value2)+")")
		SetStepCode(Variable(:value)+" = list("+Variable(:value2)+")")
		return True
	} 
private
class newlistbysizeComponentView from ComponentViewParent
	Title(T_CT_NEWLISTBYSIZE_IP_TITLE)
	TextBox(T_CT_NEWLISTBYSIZE_IP_VALUE,:value)
	TextBox(T_CT_NEWLISTBYSIZE_IP_VALUE2,:value2)
	PageButtons()
private
