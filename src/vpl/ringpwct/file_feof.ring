/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_feof Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_feofComponentController from ComponentControllerParent 

	oView = new file_feofComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_FILE_FEOF_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = feof("  + Variable(:Value ) + ")"  )

		return True 

class file_feofComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_FEOF_IP_TITLE )	
		TextBox( T_CT_FILE_FEOF_IP_VALUE , :value)
		TextBox( T_CT_FILE_FEOF_IP_VALUE2 , :value2)
		PageButtons()