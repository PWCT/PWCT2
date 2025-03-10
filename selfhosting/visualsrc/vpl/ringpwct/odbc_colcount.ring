#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  odbc_colcount Component
#**	Date : 2017.09.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class odbc_colcountComponentController from ComponentControllerParent
	oView = new odbc_colcountComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_ODBC_COLCOUNT_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = odbc_colcount("+Variable(:Value)+")")
		return True
	} 
private
class odbc_colcountComponentView from ComponentViewParent
	Title(T_CT_ODBC_COLCOUNT_IP_TITLE)
	TextBox(T_CT_ODBC_COLCOUNT_IP_VALUE,:value)
	TextBox(T_CT_ODBC_COLCOUNT_IP_VALUE2,:value2)
	PageButtons()
private
