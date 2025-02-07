#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  mysql_info Component
#**	Date : 2017.09.28
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class mysql_infoComponentController from ComponentControllerParent
	oView = new mysql_infoComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_MYSQL_INFO_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"mysql_info()")
		return True
	} 
private
class mysql_infoComponentView from ComponentViewParent
	Title(T_CT_MYSQL_INFO_IP_TITLE)
	TextBox(T_CT_MYSQL_INFO_IP_VALUE,:value)
	PageButtons()
private
