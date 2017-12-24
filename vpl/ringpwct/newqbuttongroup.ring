/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  newqbuttongroup Component
**	Date : 2017.12.24
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class newqbuttongroupComponentController from ComponentControllerParent 

	oView = new newqbuttongroupComponentView

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
					cCode += 'setStyleSheet("' + Variable(:value2) + '")' + nl
				}
				
				
				NewParentStep(  cOutStep + T_CT_NEWQBUTTONGROUP_ST_NEWQBUTTONGROUP  )
					SetStepCode( cOutCode + "new QButtonGroup("+Variable(:value3)+") { " + nl + cCode )
					AllowInteraction()
					NewStep( T_CT_NEWQBUTTONGROUP_ST_STARTHERE )
					oStep = GetActiveStep()
					NewStep( T_CT_NEWQBUTTONGROUP_ST_END )
						SetStepCode( "}" )
					SetActiveStep(oStep)

		return True 

class newqbuttongroupComponentView from ComponentViewParent
	 
		Title( T_CT_NEWQBUTTONGROUP_IP_TITLE )	
		TextBox( T_CT_NEWQBUTTONGROUP_IP_VALUE , :value)
		TextBox( T_CT_NEWQBUTTONGROUP_IP_VALUE2 , :value2)
		TextBox( T_CT_NEWQBUTTONGROUP_IP_VALUE3 , :value3)
		PageButtons()
