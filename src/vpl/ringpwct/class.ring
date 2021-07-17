/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  class Component
**	Date : 2017.10.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class classComponentController from ComponentControllerParent 

	oView = new classComponentView

	aAllowEmptyValue = [:value2]

	func GenerateAction 

		if Variable(:value2) = NULL {
			NewParentStep( T_CT_CLASS_ST_CLASS + StepData(:VALUE) )
			SetStepCode( "class " + Variable(:VALUE) )
		else
			NewParentStep( T_CT_CLASS_ST_CLASS + StepData(:VALUE) + T_CT_CLASS_ST_FROM +
						StepData(:VALUE2)  )
			SetStepCode( "class " + Variable(:VALUE) + " from " +Variable(:VALUE2)  )
		
		}
			oStepRoot = GetActiveStep()
			AllowInteraction()
			NewStep( T_CT_CLASS_ST_ATTRIBUTES )
			oStep = GetActiveStep()
			AllowInteraction()
			NewStep( T_CT_CLASS_ST_METHODS )
			if Variable(:value3) {
				NewParentStep( T_CT_CLASS_ST_PRIVATE )
				SetStepCode("private")
				AllowInteraction()
				NewStep( T_CT_CLASS_ST_ATTRIBUTES )
				AllowInteraction()
				NewStep( T_CT_CLASS_ST_METHODS )
				SetActiveStep(oStepRoot)
				NewStep( T_CT_CLASS_ST_END )
					SetStepCode( "" )
			}
			SetActiveStep(oStep)

		return True 

class classComponentView from ComponentViewParent
	 
		Title( T_CT_CLASS_IP_TITLE )	
		TextBox( T_CT_CLASS_IP_VALUE , :value)
		TextBox( T_CT_CLASS_IP_VALUE2 , :value2)
		CheckBox( T_CT_CLASS_IP_VALUE3 , :value3)
		PageButtons()
