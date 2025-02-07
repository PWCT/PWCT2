#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  setlistitem Component
#**	Date : 2017.07.21
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class setlistitemComponentController from ComponentControllerParent
	oView = new setlistitemComponentView
	func GenerateAction  { 
		NewStep(T_CT_SETLISTITEM_ST_SETITEM+StepData(:value2)+T_CT_SETLISTITEM_ST_INLIST+StepData(:value)+T_CT_SETLISTITEM_ST_TO+StepData(:value3))
		SetStepCode(Variable(:value)+"["+Variable(:value2)+"] = "+Variable(:value3))
		return True
	} 
private
class setlistitemComponentView from ComponentViewParent
	Title(T_CT_SETLISTITEM_IP_TITLE)
	TextBox(T_CT_SETLISTITEM_IP_VALUE,:value)
	TextBox(T_CT_SETLISTITEM_IP_VALUE2,:value2)
	TextBox(T_CT_SETLISTITEM_IP_VALUE3,:value3)
	PageButtons()
private
