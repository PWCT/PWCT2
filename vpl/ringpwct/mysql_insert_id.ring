/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysql_insert_id Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mysql_insert_idComponentController from ComponentControllerParent 

	oView = new mysql_insert_idComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_MYSQL_INSERT_ID_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "mysql_insert_id()" )

		return True 

class mysql_insert_idComponentView from ComponentViewParent
	 
		Title( T_CT_MYSQL_INSERT_ID_IP_TITLE )	
		TextBox( T_CT_MYSQL_INSERT_ID_IP_VALUE , :value)
		PageButtons()
