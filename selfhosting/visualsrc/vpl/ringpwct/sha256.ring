#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  sha256 Component
#**	Date : 2017.09.30
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class sha256ComponentController from ComponentControllerParent
	oView = new sha256ComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_SHA256_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = sha256("+Variable(:Value)+")")
		return True
	} 
private
class sha256ComponentView from ComponentViewParent
	Title(T_CT_SHA256_IP_TITLE)
	TextBox(T_CT_SHA256_IP_VALUE,:value)
	TextBox(T_CT_SHA256_IP_VALUE2,:value2)
	PageButtons()
private
