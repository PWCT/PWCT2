/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  file_tempname Component
**	Date : 2017.07.31
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class file_tempnameComponentController from ComponentControllerParent 

	oView = new file_tempnameComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_FILE_TEMPNAME_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "tempname()" )

		return True 

class file_tempnameComponentView from ComponentViewParent
	 
		Title( T_CT_FILE_TEMPNAME_IP_TITLE )	
		TextBox( T_CT_FILE_TEMPNAME_IP_VALUE , :value)
		PageButtons()
