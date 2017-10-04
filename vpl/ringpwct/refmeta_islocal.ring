/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_islocal Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_islocalComponentController from ComponentControllerParent 

	oView = new refmeta_islocalComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_REFMETA_ISLOCAL_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = islocal("  + Variable(:Value ) + ")"  )

		return True 

class refmeta_islocalComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_ISLOCAL_IP_TITLE )	
		TextBox( T_CT_REFMETA_ISLOCAL_IP_VALUE , :value)
		TextBox( T_CT_REFMETA_ISLOCAL_IP_VALUE2 , :value2)
		PageButtons()
