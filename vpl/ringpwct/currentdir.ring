/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  currentdir Component
**	Date : 2017.09.26
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class currentdirComponentController from ComponentControllerParent 

	oView = new currentdirComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_CURRENTDIR_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "currentdir()" )

		return True 

class currentdirComponentView from ComponentViewParent
	 
		Title( T_CT_CURRENTDIR_IP_TITLE )	
		TextBox( T_CT_CURRENTDIR_IP_VALUE , :value)
		PageButtons()
