/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_fgetpos Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_fgetposComponentController from ComponentControllerParent 

	oView = new file_fgetposComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_FILE_FGETPOS_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = fgetpos("  + Variable(:Value ) + ")"  )

		return True 

class file_fgetposComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_FGETPOS_IP_TITLE )	
		TextBox( T_CT_FILE_FGETPOS_IP_VALUE , :value)
		TextBox( T_CT_FILE_FGETPOS_IP_VALUE2 , :value2)
		PageButtons()
