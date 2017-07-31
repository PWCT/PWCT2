/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_ftell Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_ftellComponentController from ComponentControllerParent 

	oView = new file_ftellComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_FILE_FTELL_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = ftell("  + Variable(:Value ) + ")"  )

		return True 

class file_ftellComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_FTELL_IP_TITLE )	
		TextBox( T_CT_FILE_FTELL_IP_VALUE , :value)
		TextBox( T_CT_FILE_FTELL_IP_VALUE2 , :value2)
		PageButtons()
