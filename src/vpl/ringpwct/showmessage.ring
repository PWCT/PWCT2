/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  showmessage Component
**	Date : 2018.03.11
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class showmessageComponentController from ComponentControllerParent 

	oView = new showmessageComponentView

	func GenerateAction 

		NewStep( T_CT_SHOWMESSAGE_ST_VALUE  + StepData(:Value ) +  T_CT_SHOWMESSAGE_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode(  "msginfo("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class showmessageComponentView from ComponentViewParent
	 
		Title( T_CT_SHOWMESSAGE_IP_TITLE )	
		TextBox( T_CT_SHOWMESSAGE_IP_VALUE , :value) {
			setText('" "')
		}
		TextBox( T_CT_SHOWMESSAGE_IP_VALUE2 , :value2)  {
			setText('" "')
		}
		PageButtons()
