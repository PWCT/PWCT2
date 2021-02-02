/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_isattribute Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_isattributeComponentController from ComponentControllerParent 

	oView = new refmeta_isattributeComponentView

	func GenerateAction 

		NewStep( StepData(:Value3) + " = "  +  T_CT_REFMETA_ISATTRIBUTE_ST_VALUE  + StepData(:Value ) +  T_CT_REFMETA_ISATTRIBUTE_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode( Variable(:Value3) + " = isattribute("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class refmeta_isattributeComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_ISATTRIBUTE_IP_TITLE )	
		TextBox( T_CT_REFMETA_ISATTRIBUTE_IP_VALUE , :value)
		TextBox( T_CT_REFMETA_ISATTRIBUTE_IP_VALUE2 , :value2)
		TextBox( T_CT_REFMETA_ISATTRIBUTE_IP_VALUE3 , :value3)
		PageButtons()
