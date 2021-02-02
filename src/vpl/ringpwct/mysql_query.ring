/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysql_query Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mysql_queryComponentController from ComponentControllerParent 

	oView = new mysql_queryComponentView

	func GenerateAction 

		NewStep( T_CT_MYSQL_QUERY_ST_VALUE  + StepData(:Value ) +  T_CT_MYSQL_QUERY_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode(  "mysql_query("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class mysql_queryComponentView from ComponentViewParent
	 
		Title( T_CT_MYSQL_QUERY_IP_TITLE )	
		TextBox( T_CT_MYSQL_QUERY_IP_VALUE , :value)
		TextBox( T_CT_MYSQL_QUERY_IP_VALUE2 , :value2)
		PageButtons()
