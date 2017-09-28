/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysql_next_result Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mysql_next_resultComponentController from ComponentControllerParent 

	oView = new mysql_next_resultComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_MYSQL_NEXT_RESULT_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = mysql_next_result("  + Variable(:Value ) + ")"  )

		return True 

class mysql_next_resultComponentView from ComponentViewParent
	 
		Title( T_CT_MYSQL_NEXT_RESULT_IP_TITLE )	
		TextBox( T_CT_MYSQL_NEXT_RESULT_IP_VALUE , :value)
		TextBox( T_CT_MYSQL_NEXT_RESULT_IP_VALUE2 , :value2)
		PageButtons()
