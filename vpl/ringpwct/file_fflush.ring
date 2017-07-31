/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_fflush Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_fflushComponentController from ComponentControllerParent 

	oView = new file_fflushComponentView

	func GenerateAction 

		NewStep( T_CT_FILE_FFLUSH_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "fflush("  + Variable(:Value ) + ")"  )

		return True 

class file_fflushComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_FFLUSH_IP_TITLE )	
		TextBox( T_CT_FILE_FFLUSH_IP_VALUE , :value)
		PageButtons()
