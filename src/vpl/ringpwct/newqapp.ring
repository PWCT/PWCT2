/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newqapp Component
**	Date : 2017.12.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newqappComponentController from ComponentControllerParent 

	oView = new newqappComponentView

	func GenerateAction 

		if Variable(:value) = NULL {
			cOutStep = ""
			cOutCode = ""
		else
			cOutStep =  StepData(:value) + " = "
			cOutCode = Variable(:value) + " = " 
		}
		NewParentStep( cOutStep +  T_CT_NEWQAPP_NEWQAPP  )
			SetStepCode( 'load "guilib.ring"' + nl +
					cOutCode + " new qApp {")
			AllowInteraction()
			NewStep( T_CT_NEWQAPP_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_NEWQAPP_ST_END )
				SetStepCode(  " exec() " + nl + "}" )
			SetActiveStep(oStep)

		return True 

class newqappComponentView from ComponentViewParent
	 
		Title( T_CT_NEWQAPP_IP_TITLE )	
		TextBox( T_CT_NEWQAPP_IP_VALUE , :value)
		PageButtons()
