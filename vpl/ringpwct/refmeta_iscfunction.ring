/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_iscfunction Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_iscfunctionComponentController from ComponentControllerParent 

	oView = new refmeta_iscfunctionComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_REFMETA_ISCFUNCTION_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = iscfunction("  + Variable(:Value ) + ")"  )
		

		return True 

class refmeta_iscfunctionComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_ISCFUNCTION_IP_TITLE )	
		TextBox( T_CT_REFMETA_ISCFUNCTION_IP_VALUE , :value)
		TextBox( T_CT_REFMETA_ISCFUNCTION_IP_VALUE2 , :value2)
		PageButtons()
