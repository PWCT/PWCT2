/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  sendemail Component
**	Date : 2017.09.30
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class sendemailComponentController from ComponentControllerParent 

	oView = new sendemailComponentView

	func GenerateAction 

		NewStep( T_CT_SENDEMAIL_ST_VALUE  + StepData(:Value ) +  T_CT_SENDEMAIL_ST_VALUE2 + StepData(:Value2) +  T_CT_SENDEMAIL_ST_VALUE3 + StepData(:Value3) +  T_CT_SENDEMAIL_ST_VALUE4 + StepData(:Value4) +  T_CT_SENDEMAIL_ST_VALUE5 + StepData(:Value5) +  T_CT_SENDEMAIL_ST_VALUE6 + StepData(:Value6) +  T_CT_SENDEMAIL_ST_VALUE7 + StepData(:Value7) +  T_CT_SENDEMAIL_ST_VALUE8 + StepData(:Value8)  )
		SetStepCode(  "sendemail("  + Variable(:Value ) + ","  + Variable(:Value2) + ","  + Variable(:Value3) + ","  + Variable(:Value4) + ","  + Variable(:Value5) + ","  + Variable(:Value6) + ","  + Variable(:Value7) + ","  + Variable(:Value8) + ")"  )

		return True 

class sendemailComponentView from ComponentViewParent
	 
		Title( T_CT_SENDEMAIL_IP_TITLE )	
		TextBox( T_CT_SENDEMAIL_IP_VALUE , :value)
		TextBox( T_CT_SENDEMAIL_IP_VALUE2 , :value2)
		TextBox( T_CT_SENDEMAIL_IP_VALUE3 , :value3)
		TextBox( T_CT_SENDEMAIL_IP_VALUE4 , :value4)
		TextBox( T_CT_SENDEMAIL_IP_VALUE5 , :value5)
		TextBox( T_CT_SENDEMAIL_IP_VALUE6 , :value6)
		TextBox( T_CT_SENDEMAIL_IP_VALUE7 , :value7)
		TextBox( T_CT_SENDEMAIL_IP_VALUE8 , :value8)
		PageButtons()
