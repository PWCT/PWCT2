#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  mysql_init Component
#**	Date : 2017.09.28
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class mysql_initComponentController from ComponentControllerParent
	oView = new mysql_initComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_MYSQL_INIT_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"mysql_init()")
		return True
	} 
private
class mysql_initComponentView from ComponentViewParent
	Title(T_CT_MYSQL_INIT_IP_TITLE)
	TextBox(T_CT_MYSQL_INIT_IP_VALUE,:value)
	PageButtons()
private
