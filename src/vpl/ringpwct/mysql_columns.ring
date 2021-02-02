/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysql_columns Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mysql_columnsComponentController from ComponentControllerParent 

	oView = new mysql_columnsComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_MYSQL_COLUMNS_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = mysql_columns("  + Variable(:Value ) + ")"  )

		return True 

class mysql_columnsComponentView from ComponentViewParent
	 
		Title( T_CT_MYSQL_COLUMNS_IP_TITLE )	
		TextBox( T_CT_MYSQL_COLUMNS_IP_VALUE , :value)
		TextBox( T_CT_MYSQL_COLUMNS_IP_VALUE2 , :value2)
		PageButtons()
