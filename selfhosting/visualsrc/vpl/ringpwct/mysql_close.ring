#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  mysql_close Component
#**	Date : 2017.09.28
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class mysql_closeComponentController from ComponentControllerParent
	oView = new mysql_closeComponentView
	func GenerateAction  { 
		NewStep(T_CT_MYSQL_CLOSE_ST_VALUE+StepData(:Value))
		SetStepCode("mysql_close("+Variable(:Value)+")")
		return True
	} 
private
class mysql_closeComponentView from ComponentViewParent
	Title(T_CT_MYSQL_CLOSE_IP_TITLE)
	TextBox(T_CT_MYSQL_CLOSE_IP_VALUE,:value)
	PageButtons()
private
