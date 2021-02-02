/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbc_datasources Component
**	Date : 2017.09.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class odbc_datasourcesComponentController from ComponentControllerParent 

	oView = new odbc_datasourcesComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_ODBC_DATASOURCES_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = odbc_datasources("  + Variable(:Value ) + ")"  )

		return True 

class odbc_datasourcesComponentView from ComponentViewParent
	 
		Title( T_CT_ODBC_DATASOURCES_IP_TITLE )	
		TextBox( T_CT_ODBC_DATASOURCES_IP_VALUE , :value)
		TextBox( T_CT_ODBC_DATASOURCES_IP_VALUE2 , :value2)
		PageButtons()
