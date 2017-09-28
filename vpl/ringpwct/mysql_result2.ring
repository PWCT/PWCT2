/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysql_result2 Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mysql_result2ComponentController from ComponentControllerParent 

	oView = new mysql_result2ComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_MYSQL_RESULT2_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = mysql_result2("  + Variable(:Value ) + ")"  )

		return True 

class mysql_result2ComponentView from ComponentViewParent
	 
		Title( T_CT_MYSQL_RESULT2_IP_TITLE )	
		TextBox( T_CT_MYSQL_RESULT2_IP_VALUE , :value)
		TextBox( T_CT_MYSQL_RESULT2_IP_VALUE2 , :value2)
		PageButtons()
