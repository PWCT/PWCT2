/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_isfunction Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_isfunctionComponentController from ComponentControllerParent 

	oView = new refmeta_isfunctionComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_REFMETA_ISFUNCTION_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = isfunction("  + Variable(:Value ) + ")"  )

		return True 

class refmeta_isfunctionComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_ISFUNCTION_IP_TITLE )	
		TextBox( T_CT_REFMETA_ISFUNCTION_IP_VALUE , :value)
		TextBox( T_CT_REFMETA_ISFUNCTION_IP_VALUE2 , :value2)
		PageButtons()
