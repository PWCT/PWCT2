/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  filename Component
**	Date : 2017.09.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class filenameComponentController from ComponentControllerParent 

	oView = new filenameComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_FILENAME_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "filename()" )

		return True 

class filenameComponentView from ComponentViewParent
	 
		Title( T_CT_FILENAME_IP_TITLE )	
		TextBox( T_CT_FILENAME_IP_VALUE , :value)
		PageButtons()
