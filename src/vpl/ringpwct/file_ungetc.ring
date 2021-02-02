/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_ungetc Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_ungetcComponentController from ComponentControllerParent 

	oView = new file_ungetcComponentView

	func GenerateAction 

		NewStep( T_CT_FILE_UNGETC_ST_VALUE  + StepData(:Value ) +  T_CT_FILE_UNGETC_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode(  "ungetc("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class file_ungetcComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_UNGETC_IP_TITLE )	
		TextBox( T_CT_FILE_UNGETC_IP_VALUE , :value)
		TextBox( T_CT_FILE_UNGETC_IP_VALUE2 , :value2)
		PageButtons()
