#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  md5 Component
#**	Date : 2017.09.30
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class md5ComponentController from ComponentControllerParent
	oView = new md5ComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_MD5_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = md5("+Variable(:Value)+")")
		return True
	} 
private
class md5ComponentView from ComponentViewParent
	Title(T_CT_MD5_IP_TITLE)
	TextBox(T_CT_MD5_IP_VALUE,:value)
	TextBox(T_CT_MD5_IP_VALUE2,:value2)
	PageButtons()
private
