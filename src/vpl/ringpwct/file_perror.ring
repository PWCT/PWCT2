/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_perror Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_perrorComponentController from ComponentControllerParent 

	oView = new file_perrorComponentView

	func GenerateAction 

		NewStep( T_CT_FILE_PERROR_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "perror("  + Variable(:Value ) + ")"  )

		return True 

class file_perrorComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_PERROR_IP_TITLE )	
		TextBox( T_CT_FILE_PERROR_IP_VALUE , :value)
		PageButtons()
