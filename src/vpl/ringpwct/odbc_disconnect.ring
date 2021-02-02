/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbc_disconnect Component
**	Date : 2017.09.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class odbc_disconnectComponentController from ComponentControllerParent 

	oView = new odbc_disconnectComponentView

	func GenerateAction 

		NewStep( T_CT_ODBC_DISCONNECT_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "odbc_disconnect("  + Variable(:Value ) + ")"  )

		return True 

class odbc_disconnectComponentView from ComponentViewParent
	 
		Title( T_CT_ODBC_DISCONNECT_IP_TITLE )	
		TextBox( T_CT_ODBC_DISCONNECT_IP_VALUE , :value)
		PageButtons()
