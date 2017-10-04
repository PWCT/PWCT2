/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_locals Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_localsComponentController from ComponentControllerParent 

	oView = new refmeta_localsComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_REFMETA_LOCALS_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "locals()" )

		return True 

class refmeta_localsComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_LOCALS_IP_TITLE )	
		TextBox( T_CT_REFMETA_LOCALS_IP_VALUE , :value)
		PageButtons()
