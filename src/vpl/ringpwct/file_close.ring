/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_close Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_closeComponentController from ComponentControllerParent 

	oView = new file_closeComponentView

	func GenerateAction 

		if NoValueMsg(:value) { return False }

		NewStep( T_CT_FILE_CLOSE_ST_VALUE  + StepData(:Value )  )
		SetStepCode( "fclose("  + Variable(:Value ) + ")"  )

		return True 

class file_closeComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_CLOSE_IP_TITLE )	
		TextBox( T_CT_FILE_CLOSE_IP_VALUE , :value)
		PageButtons()
