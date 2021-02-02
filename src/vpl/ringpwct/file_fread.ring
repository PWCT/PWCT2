/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_fread Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_freadComponentController from ComponentControllerParent 

	oView = new file_freadComponentView

	func GenerateAction 

		NewStep( StepData(:Value3) + " = "  +  T_CT_FILE_FREAD_ST_VALUE  + StepData(:Value ) +  T_CT_FILE_FREAD_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode( Variable(:Value3) + " = fread("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class file_freadComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_FREAD_IP_TITLE )	
		TextBox( T_CT_FILE_FREAD_IP_VALUE , :value)
		TextBox( T_CT_FILE_FREAD_IP_VALUE2 , :value2)
		TextBox( T_CT_FILE_FREAD_IP_VALUE3 , :value3)
		PageButtons()
