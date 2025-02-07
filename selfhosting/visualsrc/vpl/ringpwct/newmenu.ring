#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  newmenu Component
#**	Date : 2017.12.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class newmenuComponentController from ComponentControllerParent
	oView = new newmenuComponentView
	func GenerateAction  { 
		if Variable(:value) = NULL { 
			cOutStep = ""
			cOutCode = ""
			else
				cOutStep = StepData(:value)+" = "
				cOutCode = Variable(:value)+" = "
		} 
		NewParentStep(cOutStep+T_CT_NEWMENU_ST_NEWMENU)
		SetStepCode(cOutCode+"addMenu("+Variable(:value2)+")"+nl+Variable(:value)+" { "+nl)
		AllowInteraction()
		NewStep(T_CT_NEWMENU_ST_STARTHERE)
		oStep = GetActiveStep()
		NewStep(T_CT_NEWMENU_ST_END)
		SetStepCode("}")
		SetActiveStep(oStep)
		return True
	} 
private
class newmenuComponentView from ComponentViewParent
	Title(T_CT_NEWMENU_IP_TITLE)
	TextBoxValue(T_CT_NEWMENU_IP_VALUE,:value,T_CT_NEWMENU_IP_VALUE_DEFAULT)
	TextBoxValue(T_CT_NEWMENU_IP_VALUE2,:value2,C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
	PageButtons()
private
