/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_isobject Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_isobjectComponentController from ComponentControllerParent 

	oView = new refmeta_isobjectComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_REFMETA_ISOBJECT_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = isobject("  + Variable(:Value ) + ")"  )

		return True 

class refmeta_isobjectComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_ISOBJECT_IP_TITLE )	
		TextBox( T_CT_REFMETA_ISOBJECT_IP_VALUE , :value)
		TextBox( T_CT_REFMETA_ISOBJECT_IP_VALUE2 , :value2)
		PageButtons()
