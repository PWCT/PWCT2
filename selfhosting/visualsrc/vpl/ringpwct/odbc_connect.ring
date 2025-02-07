#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  odbc_connect Component
#**	Date : 2017.09.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class odbc_connectComponentController from ComponentControllerParent
	oView = new odbc_connectComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value3)+" = "+T_CT_ODBC_CONNECT_ST_VALUE+StepData(:Value)+T_CT_ODBC_CONNECT_ST_VALUE2+StepData(:Value2))
		SetStepCode(Variable(:Value3)+" = odbc_connect("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class odbc_connectComponentView from ComponentViewParent
	Title(T_CT_ODBC_CONNECT_IP_TITLE)
	TextBox(T_CT_ODBC_CONNECT_IP_VALUE,:value)
	TextBox(T_CT_ODBC_CONNECT_IP_VALUE2,:value2)
	TextBox(T_CT_ODBC_CONNECT_IP_VALUE3,:value3)
	PageButtons()
private
