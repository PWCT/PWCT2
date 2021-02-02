/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newqwidget Component
**	Date : 2017.12.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newqwidgetComponentController from ComponentControllerParent 

	oView = new newqwidgetComponentView

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
			cCode = 'setWindowTitle("' + Variable(:value2) + '")' + nl
		}
		if Variable(:value3) != NULL {
			nTop = Variable(:value3)
		else
			nTop = 400
		}
		if Variable(:value4) != NULL {
			nLeft = Variable(:value4)
		else
			nLeft = 400
		}
		cCode += "move("+nLeft+","+nTop+")"+nl
		if Variable(:value5) != NULL {
			nWidth = Variable(:value5)
		else
			nWidth = 400
		}
		if Variable(:value6) != NULL {
			nHeight = Variable(:value6)
		else
			nHeight = 400
		}
		cCode += "resize("+nWidth+","+nHeight+")"+nl
		if Variable(:value7) != NULL {
			cCode += 'setStyleSheet("' + Variable(:value7) + '")' + nl
		}
		
		
		NewParentStep(  cOutStep + T_CT_NEWQWIDGET_ST_NEWQWIDGET + " " + StepData(:value2) )
			SetStepCode( cOutCode + "new qMainWindow() { " + nl + cCode )
			AllowInteraction()
			NewStep( T_CT_NEWQWIDGET_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_NEWQWIDGET_ST_END )
				SetStepCode( "show()" + nl + "}" )
			SetActiveStep(oStep)

		return True 

class newqwidgetComponentView from ComponentViewParent
	 
		Title( T_CT_NEWQWIDGET_IP_TITLE )	
		TextBox( T_CT_NEWQWIDGET_IP_VALUE , :value)
		TextBox( T_CT_NEWQWIDGET_IP_VALUE2 , :value2)
		TextBox( T_CT_NEWQWIDGET_IP_VALUE3 , :value3)
		TextBox( T_CT_NEWQWIDGET_IP_VALUE4 , :value4)
		TextBox( T_CT_NEWQWIDGET_IP_VALUE5 , :value5)
		TextBox( T_CT_NEWQWIDGET_IP_VALUE6 , :value6)
		TextBox( T_CT_NEWQWIDGET_IP_VALUE7 , :value7)
		PageButtons()
