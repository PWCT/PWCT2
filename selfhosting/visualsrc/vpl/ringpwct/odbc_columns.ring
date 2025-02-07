#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  odbc_columns Component
#**	Date : 2017.09.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class odbc_columnsComponentController from ComponentControllerParent
	oView = new odbc_columnsComponentView
	func GenerateAction  { 
		NewStep(T_CT_ODBC_COLUMNS_ST_VALUE+StepData(:Value)+T_CT_ODBC_COLUMNS_ST_VALUE2+StepData(:Value2))
		SetStepCode("odbc_columns("+Variable(:Value)+","+Variable(:Value2)+")")
		return True
	} 
private
class odbc_columnsComponentView from ComponentViewParent
	Title(T_CT_ODBC_COLUMNS_IP_TITLE)
	TextBox(T_CT_ODBC_COLUMNS_IP_VALUE,:value)
	TextBox(T_CT_ODBC_COLUMNS_IP_VALUE2,:value2)
	PageButtons()
private
