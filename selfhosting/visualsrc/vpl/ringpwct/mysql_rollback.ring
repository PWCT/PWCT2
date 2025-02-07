#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  mysql_rollback Component
#**	Date : 2017.09.28
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class mysql_rollbackComponentController from ComponentControllerParent
	oView = new mysql_rollbackComponentView
	func GenerateAction  { 
		NewStep(T_CT_MYSQL_ROLLBACK_ST_VALUE+StepData(:Value))
		SetStepCode("mysql_rollback("+Variable(:Value)+")")
		return True
	} 
private
class mysql_rollbackComponentView from ComponentViewParent
	Title(T_CT_MYSQL_ROLLBACK_IP_TITLE)
	TextBox(T_CT_MYSQL_ROLLBACK_IP_VALUE,:value)
	PageButtons()
private
