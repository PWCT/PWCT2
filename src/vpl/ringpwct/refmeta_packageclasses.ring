/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_packageclasses Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_packageclassesComponentController from ComponentControllerParent 

	oView = new refmeta_packageclassesComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_REFMETA_PACKAGECLASSES_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = packageclasses("  + Variable(:Value ) + ")"  )
		

		return True 

class refmeta_packageclassesComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_PACKAGECLASSES_IP_TITLE )	
		TextBox( T_CT_REFMETA_PACKAGECLASSES_IP_VALUE , :value)
		TextBox( T_CT_REFMETA_PACKAGECLASSES_IP_VALUE2 , :value2)
		PageButtons()
