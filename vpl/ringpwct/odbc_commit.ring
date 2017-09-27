/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbc_commit Component
**	Date : 2017.09.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class odbc_commitComponentController from ComponentControllerParent 

	oView = new odbc_commitComponentView

	func GenerateAction 

		NewStep( T_CT_ODBC_COMMIT_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "odbc_commit("  + Variable(:Value ) + ")"  )

		return True 

class odbc_commitComponentView from ComponentViewParent
	 
		Title( T_CT_ODBC_COMMIT_IP_TITLE )	
		TextBox( T_CT_ODBC_COMMIT_IP_VALUE , :value)
		PageButtons()
