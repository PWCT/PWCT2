/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbc_rollback Component
**	Date : 2017.09.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class odbc_rollbackComponentController from ComponentControllerParent 

	oView = new odbc_rollbackComponentView

	func GenerateAction 

		NewStep( T_CT_ODBC_ROLLBACK_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "odbc_rollback("  + Variable(:Value ) + ")"  )

		return True 

class odbc_rollbackComponentView from ComponentViewParent
	 
		Title( T_CT_ODBC_ROLLBACK_IP_TITLE )	
		TextBox( T_CT_ODBC_ROLLBACK_IP_VALUE , :value)
		PageButtons()
