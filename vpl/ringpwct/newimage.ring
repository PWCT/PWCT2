/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newimage Component
**	Date : 2017.12.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newimageComponentController from ComponentControllerParent 

	oView = new newimageComponentView

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
					cCode += 'setStyleSheet("' + Variable(:value6) + '")' + nl
				}
				if Variable(:value8) != NULL {
				cCode += `labelimage = new qpixmap("` + Variable(:value8) + `")` + nl +  
						`setpixmap(labelimage)` + nl
					if Variable(:value5) = NULL and Variable(:value6) = NULL {
						cCode += "resize(labelimage.width(),labelimage.height())"+nl
					}
		
				}
				
				
				NewParentStep(  cOutStep + T_CT_NEWIMAGE_ST_NEWQIMAGE + " " + Variable(:value8)  )
					SetStepCode( cOutCode + "new QLabel("+Variable(:value7)+") { " + nl + cCode )
					AllowInteraction()
					NewStep( T_CT_NEWIMAGE_ST_STARTHERE )
					oStep = GetActiveStep()
					NewStep( T_CT_NEWIMAGE_ST_END )
						SetStepCode( "}" )
					SetActiveStep(oStep)

		return True 

class newimageComponentView from ComponentViewParent
	 
		Title( T_CT_NEWIMAGE_IP_TITLE )	
		TextBox( T_CT_NEWIMAGE_IP_VALUE , :value)
		TextBox( T_CT_NEWIMAGE_IP_VALUE2 , :value2)
		TextBox( T_CT_NEWIMAGE_IP_VALUE3 , :value3)
		TextBox( T_CT_NEWIMAGE_IP_VALUE4 , :value4)
		TextBox( T_CT_NEWIMAGE_IP_VALUE5 , :value5)
		TextBox( T_CT_NEWIMAGE_IP_VALUE6 , :value6)
		TextBox( T_CT_NEWIMAGE_IP_VALUE7 , :value7)
		TextBox( T_CT_NEWIMAGE_IP_VALUE8 , :value8)
		PageButtons()
