#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  odbc_init Component
#**	Date : 2017.09.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class odbc_initComponentController from ComponentControllerParent
	oView = new odbc_initComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_ODBC_INIT_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"odbc_init()")
		return True
	} 
private
class odbc_initComponentView from ComponentViewParent
	Title(T_CT_ODBC_INIT_IP_TITLE)
	TextBox(T_CT_ODBC_INIT_IP_VALUE,:value)
	PageButtons()
private
