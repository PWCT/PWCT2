/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbc_execute Component
**	Date : 2017.09.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class odbc_executeComponentController from ComponentControllerParent 

	oView = new odbc_executeComponentView

	func GenerateAction 

		NewStep( StepData(:Value3) + " = "  +  T_CT_ODBC_EXECUTE_ST_VALUE  + StepData(:Value ) +  T_CT_ODBC_EXECUTE_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode( Variable(:Value3) + " = odbc_execute("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class odbc_executeComponentView from ComponentViewParent
	 
		Title( T_CT_ODBC_EXECUTE_IP_TITLE )	
		TextBox( T_CT_ODBC_EXECUTE_IP_VALUE , :value)
		TextBox( T_CT_ODBC_EXECUTE_IP_VALUE2 , :value2)
		TextBox( T_CT_ODBC_EXECUTE_IP_VALUE3 , :value3)
		PageButtons()
