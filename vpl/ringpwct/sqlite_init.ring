/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  sqlite_init Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class sqlite_initComponentController from ComponentControllerParent 

	oView = new sqlite_initComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_SQLITE_INIT_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "sqlite_init()" )

		return True 

class sqlite_initComponentView from ComponentViewParent
	 
		Title( T_CT_SQLITE_INIT_IP_TITLE )	
		TextBox( T_CT_SQLITE_INIT_IP_VALUE , :value)
		PageButtons()
