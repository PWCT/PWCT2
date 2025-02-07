#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  mysql_escape_string Component
#**	Date : 2017.09.28
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class mysql_escape_stringComponentController from ComponentControllerParent
	oView = new mysql_escape_stringComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value3)+" = "+T_CT_MYSQL_ESCAPE_STRING_ST_VALUE+StepData(:Value)+T_CT_MYSQL_ESCAPE_STRING_ST_VALUE2+StepData(:Value2))
		SetStepCode(Variable(:Value3)+" = mysql_escape_string("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class mysql_escape_stringComponentView from ComponentViewParent
	Title(T_CT_MYSQL_ESCAPE_STRING_IP_TITLE)
	TextBox(T_CT_MYSQL_ESCAPE_STRING_IP_VALUE,:value)
	TextBox(T_CT_MYSQL_ESCAPE_STRING_IP_VALUE2,:value2)
	TextBox(T_CT_MYSQL_ESCAPE_STRING_IP_VALUE3,:value3)
	PageButtons()
private
