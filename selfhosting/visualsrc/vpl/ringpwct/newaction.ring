#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  newaction Component
#**	Date : 2017.12.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class newactionComponentController from ComponentControllerParent
	oView = new newactionComponentView
	func GenerateAction  { 
		if Variable(:value) = NULL { 
			cOutStep = ""
			cOutCode = ""
			else
				cOutStep = StepData(:value)+" = "
				cOutCode = Variable(:value)+" = "
		} 
		cCode = ""
		if Variable(:value3) != NULL { 
			cCode += char(9)+"setText("+Variable(:value3)+")"+nl
		} 
		if Variable(:value4) != NULL { 
			cCode += char(9)+"setClickEvent("+Variable(:value4)+")"+nl
		} 
		NewParentStep(cOutStep+T_CT_NEWACTION_ST_NEWACTION)
		SetStepCode(cOutCode+"new QAction("+Variable(:value2)+")"+" { "+nl+cCode+nl)
		AllowInteraction()
		NewStep(T_CT_NEWACTION_ST_STARTHERE)
		oStep = GetActiveStep()
		NewStep(T_CT_NEWACTION_ST_END)
		SetStepCode("}"+nl+"addAction("+Variable(:value)+")"+nl)
		SetActiveStep(oStep)
		return True
	} 
private
class newactionComponentView from ComponentViewParent
	Title(T_CT_NEWACTION_IP_TITLE)
	TextBoxValue(T_CT_NEWACTION_IP_VALUE,:value,T_CT_NEWACTION_IP_VALUE_DEFAULT)
	TextBoxValue(T_CT_NEWACTION_IP_VALUE2,:value2,T_CT_NEWACTION_IP_VALUE2_DEFAULT)
	TextBoxValue(T_CT_NEWACTION_IP_VALUE3,:value3,C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
	TextBoxValue(T_CT_NEWACTION_IP_VALUE4,:value4,C_INTERACTIONPAGE_EXPCONTAINSLITERAL)
	PageButtons()
private
