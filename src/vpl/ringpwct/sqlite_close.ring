/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  sqlite_close Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class sqlite_closeComponentController from ComponentControllerParent 

	oView = new sqlite_closeComponentView

	func GenerateAction 

		NewStep( T_CT_SQLITE_CLOSE_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "sqlite_close("  + Variable(:Value ) + ")"  )

		return True 

class sqlite_closeComponentView from ComponentViewParent
	 
		Title( T_CT_SQLITE_CLOSE_IP_TITLE )	
		TextBox( T_CT_SQLITE_CLOSE_IP_VALUE , :value)
		PageButtons()
