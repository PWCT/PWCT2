/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newtimer Component
**	Date : 2017.12.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newtimerComponentController from ComponentControllerParent 

	oView = new newtimerComponentView

	func GenerateAction 

		if Variable(:value) = NULL {
			cOutStep = ""
			cOutCode = ""
		else
			cOutStep =  StepData(:value) + " = "
			cOutCode = Variable(:value) + " = " 
		}
		cCode = ""
		if Variable(:value3) != NULL {
			cCode += "setinterval("+Variable(:value3)+")" + nl
		}
		if Variable(:value4) != NULL {
			cCode += "settimeoutevent("+Variable(:value4)+")" + nl
		}
		if Variable(:value5) {	
			cCode += "start()" + nl
		}
		NewParentStep(  cOutStep + T_CT_NEWQTIMER_ST_NEWQTIMER + " " + Variable(:value4)  )
					SetStepCode( cOutCode + "new QTimer("+Variable(:value2)+") { " + nl + cCode )
					AllowInteraction()
					NewStep( T_CT_NEWQTIMER_ST_STARTHERE )
					oStep = GetActiveStep()
					NewStep( T_CT_NEWQTIMER_ST_END )
						SetStepCode( "}" )
					SetActiveStep(oStep)

		return True 

class newtimerComponentView from ComponentViewParent
	 
		Title( T_CT_NEWTIMER_IP_TITLE )	
		TextBox( T_CT_NEWTIMER_IP_VALUE , :value)
		TextBox( T_CT_NEWTIMER_IP_VALUE2 , :value2)
		TextBox( T_CT_NEWTIMER_IP_VALUE3 , :value3)
		TextBox( T_CT_NEWTIMER_IP_VALUE4 , :value4)
		CheckBox( T_CT_NEWTIMER_IP_VALUE5 , :value5)
		PageButtons()
