/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newmenubar Component
**	Date : 2017.12.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newmenubarComponentController from ComponentControllerParent 

	oView = new newmenubarComponentView

	func GenerateAction 

		if Variable(:value) = NULL {
			cOutStep = ""
			cOutCode = ""
		else
			cOutStep =  StepData(:value) + " = "
			cOutCode = Variable(:value) + " = " 
		}
		NewParentStep(  cOutStep + T_CT_NEWQMENUBAR_ST_NEWQMENUBAR  )
		SetStepCode( cOutCode + "new QMenubar("+Variable(:value2)+") { " + nl  )
			AllowInteraction()
			NewStep( T_CT_NEWQMENUBAR_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_NEWQMENUBAR_ST_END )
			SetStepCode( "}" )
			SetActiveStep(oStep)

		return True 

class newmenubarComponentView from ComponentViewParent
	 
		Title( T_CT_NEWMENUBAR_IP_TITLE )	
		TextBoxValue( T_CT_NEWMENUBAR_IP_VALUE , :value, T_CT_NEWMENUBAR_IP_VALUE_DEFAULT)
		TextBoxValue( T_CT_NEWMENUBAR_IP_VALUE2 , :value2, T_CT_NEWMENUBAR_IP_VALUE2_DEFAULT)
		PageButtons()
