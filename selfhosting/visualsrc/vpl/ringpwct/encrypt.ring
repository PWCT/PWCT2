#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  encrypt Component
#**	Date : 2017.09.30
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class encryptComponentController from ComponentControllerParent
	oView = new encryptComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value4)+" = "+T_CT_ENCRYPT_ST_VALUE+StepData(:Value)+T_CT_ENCRYPT_ST_VALUE2+StepData(:Value2)+T_CT_ENCRYPT_ST_VALUE3+StepData(:Value3))
		SetStepCode(Variable(:Value4)+" = encrypt("+Variable(:Value)+","+Variable(:Value2)+","+Variable(:Value3)+")")
		return True
	} 
private
class encryptComponentView from ComponentViewParent
	Title(T_CT_ENCRYPT_IP_TITLE)
	TextBox(T_CT_ENCRYPT_IP_VALUE,:value)
	TextBox(T_CT_ENCRYPT_IP_VALUE2,:value2)
	TextBox(T_CT_ENCRYPT_IP_VALUE3,:value3)
	TextBox(T_CT_ENCRYPT_IP_VALUE4,:value4)
	PageButtons()
private
