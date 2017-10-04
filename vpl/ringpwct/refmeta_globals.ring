/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_globals Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_globalsComponentController from ComponentControllerParent 

	oView = new refmeta_globalsComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_REFMETA_GLOBALS_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "globals()" )
		

		return True 

class refmeta_globalsComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_GLOBALS_IP_TITLE )	
		TextBox( T_CT_REFMETA_GLOBALS_IP_VALUE , :value)
		PageButtons()
