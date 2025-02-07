#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  odbc_close Component
#**	Date : 2017.09.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class odbc_closeComponentController from ComponentControllerParent
	oView = new odbc_closeComponentView
	func GenerateAction  { 
		NewStep(T_CT_ODBC_CLOSE_ST_VALUE+StepData(:Value))
		SetStepCode("odbc_close("+Variable(:Value)+")")
		return True
	} 
private
class odbc_closeComponentView from ComponentViewParent
	Title(T_CT_ODBC_CLOSE_IP_TITLE)
	TextBox(T_CT_ODBC_CLOSE_IP_VALUE,:value)
	PageButtons()
private
