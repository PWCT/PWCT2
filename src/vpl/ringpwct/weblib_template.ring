/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  weblib_template Component
**	Date : 2018.03.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class weblib_templateComponentController from ComponentControllerParent 

	oView = new weblib_templateComponentView

	func GenerateAction 

		 NewStep( StepData(:Value3) + " = "  +  T_CT_WEBLIB_TEMPLATE_ST_VALUE  + StepData(:Value ) +  T_CT_WEBLIB_TEMPLATE_ST_VALUE2 + StepData(:Value2)  )
		SetStepCode( Variable(:Value3) + " = template("  + Variable(:Value ) + ","  + Variable(:Value2) + ")"  )

		return True 

class weblib_templateComponentView from ComponentViewParent
	 
		Title( T_CT_WEBLIB_TEMPLATE_IP_TITLE )	
		TextBox( T_CT_WEBLIB_TEMPLATE_IP_VALUE , :value)
		TextBox( T_CT_WEBLIB_TEMPLATE_IP_VALUE2 , :value2)
		TextBox( T_CT_WEBLIB_TEMPLATE_IP_VALUE3 , :value3)
		PageButtons()
