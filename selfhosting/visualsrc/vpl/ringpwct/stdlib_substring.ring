#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_substring Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_substringComponentController from ComponentControllerParent
	oView = new stdlib_substringComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value4)+" = "+T_CT_STDLIB_SUBSTRING_ST_VALUE+StepData(:Value)+T_CT_STDLIB_SUBSTRING_ST_VALUE2+StepData(:Value2)+T_CT_STDLIB_SUBSTRING_ST_VALUE3+StepData(:Value3))
		SetStepCode(Variable(:Value4)+" = substring("+Variable(:Value)+","+Variable(:Value2)+","+Variable(:Value3)+")")
		return True
	} 
private
class stdlib_substringComponentView from ComponentViewParent
	Title(T_CT_STDLIB_SUBSTRING_IP_TITLE)
	TextBox(T_CT_STDLIB_SUBSTRING_IP_VALUE,:value)
	TextBox(T_CT_STDLIB_SUBSTRING_IP_VALUE2,:value2)
	TextBox(T_CT_STDLIB_SUBSTRING_IP_VALUE3,:value3)
	TextBox(T_CT_STDLIB_SUBSTRING_IP_VALUE4,:value4)
	PageButtons()
private
