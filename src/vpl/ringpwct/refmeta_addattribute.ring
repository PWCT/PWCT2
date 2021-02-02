/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  refmeta_addattribute Component
**	Date : 2017.10.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class refmeta_addattributeComponentController from ComponentControllerParent 

	oView = new refmeta_addattributeComponentView

	func GenerateAction 

		NewStep( T_CT_REFMETA_ADDATTRIBUTE_ST_VALUE  + StepData(:Value ) +  T_CT_REFMETA_ADDATTRIBUTE_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode(  "addattribute("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class refmeta_addattributeComponentView from ComponentViewParent
	 
		Title( T_CT_REFMETA_ADDATTRIBUTE_IP_TITLE )	
		TextBox( T_CT_REFMETA_ADDATTRIBUTE_IP_VALUE , :value)
		TextBox( T_CT_REFMETA_ADDATTRIBUTE_IP_VALUE2 , :value2)
		PageButtons()
