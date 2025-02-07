#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  getlistitem Component
#**	Date : 2017.07.21
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class getlistitemComponentController from ComponentControllerParent
	oView = new getlistitemComponentView
	func GenerateAction  { 
		NewStep(StepData(:value3)+" = "+T_CT_GETLISTITEM_ST_GETITEM+StepData(:value2)+T_CT_GETLISTITEM_ST_FROMLIST+StepData(:value))
		SetStepCode(Variable(:value3)+" = "+Variable(:value)+"["+Variable(:value2)+"]")
		return True
	} 
private
class getlistitemComponentView from ComponentViewParent
	Title(T_CT_GETLISTITEM_IP_TITLE)
	TextBox(T_CT_GETLISTITEM_IP_VALUE,:value)
	TextBox(T_CT_GETLISTITEM_IP_VALUE2,:value2)
	TextBox(T_CT_GETLISTITEM_IP_VALUE3,:value3)
	PageButtons()
private
