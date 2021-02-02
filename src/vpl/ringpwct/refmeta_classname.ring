/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_classname Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_classnameComponentController from ComponentControllerParent 

	oView = new refmeta_classnameComponentView

	func GenerateAction 

		NewStep( StepData(:Value2) + " = "  +  T_CT_REFMETA_CLASSNAME_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = classname("  + Variable(:Value ) + ")"  )
		

		return True 

class refmeta_classnameComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_CLASSNAME_IP_TITLE )	
		TextBox( T_CT_REFMETA_CLASSNAME_IP_VALUE , :value)
		TextBox( T_CT_REFMETA_CLASSNAME_IP_VALUE2 , :value2)
		PageButtons()
