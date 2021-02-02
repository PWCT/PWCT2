/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  exefolder Component
**	Date : 2017.09.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class exefolderComponentController from ComponentControllerParent 

	oView = new exefolderComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_EXEFOLDER_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "exefolder()" )

		return True 

class exefolderComponentView from ComponentViewParent
	 
		Title( T_CT_EXEFOLDER_IP_TITLE )	
		TextBox( T_CT_EXEFOLDER_IP_VALUE , :value)
		PageButtons()
