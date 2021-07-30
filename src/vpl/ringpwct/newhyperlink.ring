/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newhyperlink Component
**	Date : 2017.12.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newhyperlinkComponentController from ComponentControllerParent 

	oView = new newhyperlinkComponentView

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
					nTop = 10
				}
				if Variable(:value3) != NULL {
					nLeft = Variable(:value3)
				else
					nLeft = 10
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
					nHeight = 300
				}
				cCode += "resize("+nWidth+","+nHeight+")"+nl
				if Variable(:value6) != NULL {
					cCode += 'setStyleSheet(' + Variable(:value6) + ')' + nl
				}
				cCode += "setopenexternallinks(true)" + nl +
				"_WebsiteTitle = " +  Variable(:value8) + nl +
				"_WebsiteURL = " + Variable(:value9) + nl +
				`settext('<a href="' + _WebsiteURL + '">' + _WebsiteTitle +'</a>')` + nl
				
				NewParentStep(  cOutStep + T_CT_NEWHYPERLINK_ST_NEWHYPERLINK  + " " + StepData(:value8))
					SetStepCode( cOutCode + "new QLabel("+Variable(:value7)+") { " + nl + cCode )
					AllowInteraction()
					NewStep( T_CT_NEWHYPERLINK_ST_STARTHERE )
					oStep = GetActiveStep()
					NewStep( T_CT_NEWHYPERLINK_ST_END )
						SetStepCode( "}" )
					SetActiveStep(oStep)

		return True 

class newhyperlinkComponentView from ComponentViewParent
	 
		Title( T_CT_NEWHYPERLINK_IP_TITLE )	
		TextBoxValue( T_CT_NEWHYPERLINK_IP_VALUE , :value, T_CT_NEWHYPERLINK_IP_VALUE_DEFAULT)
		TextBoxValue( T_CT_NEWHYPERLINK_IP_VALUE2 , :value2, "10")
		TextBoxValue( T_CT_NEWHYPERLINK_IP_VALUE3 , :value3, "10")
		TextBoxValue( T_CT_NEWHYPERLINK_IP_VALUE4 , :value4, "100")
		TextBoxValue( T_CT_NEWHYPERLINK_IP_VALUE5 , :value5, "30")
		TextBoxValue( T_CT_NEWHYPERLINK_IP_VALUE6 , :value6, C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
		TextBoxValue( T_CT_NEWHYPERLINK_IP_VALUE7 , :value7, T_CT_NEWHYPERLINK_IP_VALUE7_DEFAULT)
		TextBoxValue( T_CT_NEWHYPERLINK_IP_VALUE8 , :value8, C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
		TextBoxValue( T_CT_NEWHYPERLINK_IP_VALUE9 , :value9, C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
		PageButtons()
