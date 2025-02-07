#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  mysql_result Component
#**	Date : 2017.09.28
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class mysql_resultComponentController from ComponentControllerParent
	oView = new mysql_resultComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_MYSQL_RESULT_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = mysql_result("+Variable(:Value)+")")
		return True
	} 
private
class mysql_resultComponentView from ComponentViewParent
	Title(T_CT_MYSQL_RESULT_IP_TITLE)
	TextBox(T_CT_MYSQL_RESULT_IP_VALUE,:value)
	TextBox(T_CT_MYSQL_RESULT_IP_VALUE2,:value2)
	PageButtons()
private
