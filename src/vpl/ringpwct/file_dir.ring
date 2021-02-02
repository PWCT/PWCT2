/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_dir Component
**	Date : 2017.07.30
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_dirComponentController from ComponentControllerParent 

	oView = new file_dirComponentView

	func GenerateAction 

		if NoValueMsg(:value) { return False }
		
		NewStep( StepData(:Value2) + " = "  +  T_CT_FILE_DIR_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = dir("  + Variable(:Value ) + ")"  )

		return True 

class file_dirComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_DIR_IP_TITLE )	
		TextBox( T_CT_FILE_DIR_IP_VALUE , :value)
		TextBox( T_CT_FILE_DIR_IP_VALUE2 , :value2)
		PageButtons()
