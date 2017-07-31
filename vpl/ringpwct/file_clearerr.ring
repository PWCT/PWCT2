/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_clearerr Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_clearerrComponentController from ComponentControllerParent 

	oView = new file_clearerrComponentView

	func GenerateAction 

		NewStep( T_CT_FILE_CLEARERR_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "clearerr("  + Variable(:Value ) + ")"  )

		return True 

class file_clearerrComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_CLEARERR_IP_TITLE )	
		TextBox( T_CT_FILE_CLEARERR_IP_VALUE , :value)
		PageButtons()
