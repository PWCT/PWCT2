#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  getobjectattribute Component
#**	Date : 2017.10.01
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class getobjectattributeComponentController from ComponentControllerParent
	oView = new getobjectattributeComponentView
	func GenerateAction  { 
		NewStep(StepData(:value)+" = "+StepData(:value2)+"."+StepData(:value3))
		SetStepCode(Variable(:value)+" = "+Variable(:value2)+"."+Variable(:value3))
		return True
	} 
private
class getobjectattributeComponentView from ComponentViewParent
	Title(T_CT_GETOBJECTATTRIBUTE_IP_TITLE)
	TextBox(T_CT_GETOBJECTATTRIBUTE_IP_VALUE,:value)
	TextBox(T_CT_GETOBJECTATTRIBUTE_IP_VALUE2,:value2)
	TextBox(T_CT_GETOBJECTATTRIBUTE_IP_VALUE3,:value3)
	PageButtons()
private
