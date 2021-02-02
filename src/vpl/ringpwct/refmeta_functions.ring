/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_functions Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_functionsComponentController from ComponentControllerParent 

	oView = new refmeta_functionsComponentView

	func GenerateAction 

		NewStep( StepData(:Value) + ' = '  +  T_CT_REFMETA_FUNCTIONS_ST_VALUE  )
		SetStepCode( Variable(:Value) + ' = ' + "functions()" )
		

		return True 

class refmeta_functionsComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_FUNCTIONS_IP_TITLE )	
		TextBox( T_CT_REFMETA_FUNCTIONS_IP_VALUE , :value)
		PageButtons()
