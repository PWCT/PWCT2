/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbc_drivers Component
**	Date : 2017.09.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class odbc_driversComponentController from ComponentControllerParent 

	oView = new odbc_driversComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_ODBC_DRIVERS_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = odbc_drivers("  + Variable(:Value ) + ")"  )

		return True 

class odbc_driversComponentView from ComponentViewParent
	 
		Title( T_CT_ODBC_DRIVERS_IP_TITLE )	
		TextBox( T_CT_ODBC_DRIVERS_IP_VALUE , :value)
		TextBox( T_CT_ODBC_DRIVERS_IP_VALUE2 , :value2)
		PageButtons()
