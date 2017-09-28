/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysql_autocommit Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mysql_autocommitComponentController from ComponentControllerParent 

	oView = new mysql_autocommitComponentView

	func GenerateAction 

		NewStep( T_CT_MYSQL_AUTOCOMMIT_ST_VALUE  + StepData(:Value ) +  T_CT_MYSQL_AUTOCOMMIT_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode(  "mysql_autocommit("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class mysql_autocommitComponentView from ComponentViewParent
	 
		Title( T_CT_MYSQL_AUTOCOMMIT_IP_TITLE )	
		TextBox( T_CT_MYSQL_AUTOCOMMIT_IP_VALUE , :value)
		TextBox( T_CT_MYSQL_AUTOCOMMIT_IP_VALUE2 , :value2)
		PageButtons()
