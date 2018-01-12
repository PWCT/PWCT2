/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newstatusbar Component
**	Date : 2018.01.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newstatusbarComponentController from ComponentControllerParent 

	oView = new newstatusbarComponentView

	func GenerateAction 

		if Variable(:value) = NULL {
			cOutStep = ""
			cOutCode = ""
		else
			cOutStep =  StepData(:value) + " = "
			cOutCode = Variable(:value) + " = " 
		}
		NewParentStep(  cOutStep + T_CT_NEWQSTATUSBAR_ST_NEWQSTATUSBAR  )
		SetStepCode( cOutCode + "new QStatusBar("+Variable(:value2)+") { " + nl  )
			AllowInteraction()
			NewStep( T_CT_NEWQSTATUSBAR_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_NEWQSTATUSBAR_ST_END )
			SetStepCode( Variable(:value2) + ".setStatusbar(self)" + nl + "}" )
			SetActiveStep(oStep)

		return True 

class newstatusbarComponentView from ComponentViewParent
	 
		Title( T_CT_NEWSTATUSBAR_IP_TITLE )	
		TextBox( T_CT_NEWSTATUSBAR_IP_VALUE , :value)
		TextBox( T_CT_NEWSTATUSBAR_IP_VALUE2 , :value2)
		PageButtons()
