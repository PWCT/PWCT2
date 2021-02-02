/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysql_commit Component
**	Date : 2017.09.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class mysql_commitComponentController from ComponentControllerParent 

	oView = new mysql_commitComponentView

	func GenerateAction 

		NewStep( T_CT_MYSQL_COMMIT_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "mysql_commit("  + Variable(:Value ) + ")"  )

		return True 

class mysql_commitComponentView from ComponentViewParent
	 
		Title( T_CT_MYSQL_COMMIT_IP_TITLE )	
		TextBox( T_CT_MYSQL_COMMIT_IP_VALUE , :value)
		PageButtons()
