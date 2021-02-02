/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbc_tables Component
**	Date : 2017.09.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class odbc_tablesComponentController from ComponentControllerParent 

	oView = new odbc_tablesComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_ODBC_TABLES_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = odbc_tables("  + Variable(:Value ) + ")"  )

		return True 

class odbc_tablesComponentView from ComponentViewParent
	 
		Title( T_CT_ODBC_TABLES_IP_TITLE )	
		TextBox( T_CT_ODBC_TABLES_IP_VALUE , :value)
		TextBox( T_CT_ODBC_TABLES_IP_VALUE2 , :value2)
		PageButtons()
