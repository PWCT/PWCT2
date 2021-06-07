/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  confirmmessage Component
**	Date : 2018.03.11
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class confirmmessageComponentController from ComponentControllerParent 

	oView = new confirmmessageComponentView

	func GenerateAction 

		NewStep( StepData(:Value3) + " = "  +  T_CT_CONFIRMMESSAGE_ST_VALUE  + StepData(:Value ) +  T_CT_CONFIRMMESSAGE_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode( Variable(:Value3) + " = confirmmsg("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class confirmmessageComponentView from ComponentViewParent
	 
		Title( T_CT_CONFIRMMESSAGE_IP_TITLE )	
		TextBoxValue( T_CT_CONFIRMMESSAGE_IP_VALUE , :value, C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
		TextBoxValue( T_CT_CONFIRMMESSAGE_IP_VALUE2 , :value2, C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
		TextBox( T_CT_CONFIRMMESSAGE_IP_VALUE3 , :value3)
		PageButtons()
