/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newtoolbar Component
**	Date : 2018.01.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newtoolbarComponentController from ComponentControllerParent 

	oView = new newtoolbarComponentView

	func GenerateAction 

		if Variable(:value) = NULL {
			cOutStep = ""
			cOutCode = ""
		else
			cOutStep =  StepData(:value) + " = "
			cOutCode = Variable(:value) + " = " 
		}
		
		cCode = ""
		if Variable(:value2) != NULL {
			nTop = Variable(:value2)
		else
			nTop = 0
		}
		if Variable(:value3) != NULL {
			nLeft = Variable(:value3)
		else
			nLeft = 0
		}
		cCode += "move("+nLeft+","+nTop+")"+nl
		if Variable(:value4) != NULL {
			nWidth = Variable(:value4)
		else
			nWidth = 300
		}
		if Variable(:value5) != NULL {
			nHeight = Variable(:value5)
		else
			nHeight = 30
		}
		cCode += "resize("+nWidth+","+nHeight+")"+nl
		if Variable(:value6) != NULL {
			cCode += 'setStyleSheet(' + Variable(:value6) + ')' + nl
		}
		
		
		NewParentStep(  cOutStep + T_CT_NEWQTOOLBAR_ST_NEWQTOOLBAR  )
			SetStepCode( cOutCode + "new QToolBar("+Variable(:value7)+") { " + nl + cCode )
			AllowInteraction()
			NewStep( T_CT_NEWQTOOLBAR_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_NEWQTOOLBAR_ST_END )
				SetStepCode( "}" )
			SetActiveStep(oStep)

		return True 

class newtoolbarComponentView from ComponentViewParent
	 
	Title( T_CT_NEWTOOLBAR_IP_TITLE )	
	TextBoxValue( T_CT_NEWTOOLBAR_IP_VALUE , :value, T_CT_NEWTOOLBAR_IP_VALUE_DEFAULT)
	TextBoxValue( T_CT_NEWTOOLBAR_IP_VALUE2 , :value2, "10")
	TextBoxValue( T_CT_NEWTOOLBAR_IP_VALUE3 , :value3, "10")
	TextBoxValue( T_CT_NEWTOOLBAR_IP_VALUE4 , :value4, "100")
	TextBoxValue( T_CT_NEWTOOLBAR_IP_VALUE5 , :value5, "30")
	TextBoxValue( T_CT_NEWTOOLBAR_IP_VALUE6 , :value6, C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
	TextBoxValue( T_CT_NEWTOOLBAR_IP_VALUE7 , :value7, T_CT_NEWTOOLBAR_IP_VALUE7_DEFAULT)
	PageButtons()
