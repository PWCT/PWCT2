/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newmediaplayer Component
**	Date : 2017.12.27
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newmediaplayerComponentController from ComponentControllerParent 

	oView = new newmediaplayerComponentView

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
					cCode += 'setmedia(new qurl("' + Variable(:value2) + '"))' + nl
				}
				if Variable(:value3) != NULL {
					cCode += 'setvideooutput(' + Variable(:value3) + ')' + nl
				}
				if Variable(:value4) != NULL {
					cCode += 'setposition(' + Variable(:value4) + ')' + nl
				}
		
				NewParentStep(  cOutStep + T_CT_NEWQMEDIAPLAYER_ST_NEWQMEDIAPLAYER  )
					SetStepCode( cOutCode + "new QMediaPlayer() { " + nl + cCode )
					AllowInteraction()
					NewStep( T_CT_NEWQMEDIAPLAYER_ST_STARTHERE )
					oStep = GetActiveStep()
					NewStep( T_CT_NEWQMEDIAPLAYER_ST_END )
						SetStepCode( "}" )
					SetActiveStep(oStep)

		return True 

class newmediaplayerComponentView from ComponentViewParent
	 
		Title( T_CT_NEWMEDIAPLAYER_IP_TITLE )	
		TextBox( T_CT_NEWMEDIAPLAYER_IP_VALUE , :value)
		TextBox( T_CT_NEWMEDIAPLAYER_IP_VALUE2 , :value2)
		TextBox( T_CT_NEWMEDIAPLAYER_IP_VALUE3 , :value3)
		TextBox( T_CT_NEWMEDIAPLAYER_IP_VALUE4 , :value4)
		PageButtons()
