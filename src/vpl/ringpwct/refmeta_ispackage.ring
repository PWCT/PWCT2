/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_ispackage Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_ispackageComponentController from ComponentControllerParent 

	oView = new refmeta_ispackageComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_REFMETA_ISPACKAGE_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = ispackage("  + Variable(:Value ) + ")"  )
		

		return True 

class refmeta_ispackageComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_ISPACKAGE_IP_TITLE )	
		TextBox( T_CT_REFMETA_ISPACKAGE_IP_VALUE , :value)
		TextBox( T_CT_REFMETA_ISPACKAGE_IP_VALUE2 , :value2)
		PageButtons()
