/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  exefilename Component
**	Date : 2017.09.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class exefilenameComponentController from ComponentControllerParent 

	oView = new exefilenameComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_EXEFILENAME_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "exefilename()" )

		return True 

class exefilenameComponentView from ComponentViewParent
	 
		Title( T_CT_EXEFILENAME_IP_TITLE )	
		TextBox( T_CT_EXEFILENAME_IP_VALUE , :value)
		PageButtons()
