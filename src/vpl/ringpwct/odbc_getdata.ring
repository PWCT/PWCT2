/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbc_getdata Component
**	Date : 2017.09.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class odbc_getdataComponentController from ComponentControllerParent 

	oView = new odbc_getdataComponentView

	func GenerateAction 

		NewStep( StepData(:Value3) + " = "  +  T_CT_ODBC_GETDATA_ST_VALUE  + StepData(:Value ) +  T_CT_ODBC_GETDATA_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode( Variable(:Value3) + " = odbc_getdata("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class odbc_getdataComponentView from ComponentViewParent
	 
		Title( T_CT_ODBC_GETDATA_IP_TITLE )	
		TextBox( T_CT_ODBC_GETDATA_IP_VALUE , :value)
		TextBox( T_CT_ODBC_GETDATA_IP_VALUE2 , :value2)
		TextBox( T_CT_ODBC_GETDATA_IP_VALUE3 , :value3)
		PageButtons()