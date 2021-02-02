/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_ferror Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_ferrorComponentController from ComponentControllerParent 

	oView = new file_ferrorComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_FILE_FERROR_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = ferror("  + Variable(:Value ) + ")"  )

		return True 

class file_ferrorComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_FERROR_IP_TITLE )	
		TextBox( T_CT_FILE_FERROR_IP_VALUE , :value)
		TextBox( T_CT_FILE_FERROR_IP_VALUE2 , :value2)
		PageButtons()
