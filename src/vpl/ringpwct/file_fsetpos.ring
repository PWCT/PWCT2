/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_fsetpos Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_fsetposComponentController from ComponentControllerParent 

	oView = new file_fsetposComponentView

	func GenerateAction 

		NewStep( T_CT_FILE_FSETPOS_ST_VALUE  + StepData(:Value ) +  T_CT_FILE_FSETPOS_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode(  "fsetpos("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class file_fsetposComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_FSETPOS_IP_TITLE )	
		TextBox( T_CT_FILE_FSETPOS_IP_VALUE , :value)
		TextBox( T_CT_FILE_FSETPOS_IP_VALUE2 , :value2)
		PageButtons()