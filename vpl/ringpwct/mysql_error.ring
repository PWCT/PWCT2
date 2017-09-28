/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysql_error Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mysql_errorComponentController from ComponentControllerParent 

	oView = new mysql_errorComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_MYSQL_ERROR_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = mysql_error("  + Variable(:Value ) + ")"  )

		return True 

class mysql_errorComponentView from ComponentViewParent
	 
		Title( T_CT_MYSQL_ERROR_IP_TITLE )	
		TextBox( T_CT_MYSQL_ERROR_IP_VALUE , :value)
		TextBox( T_CT_MYSQL_ERROR_IP_VALUE2 , :value2)
		PageButtons()
