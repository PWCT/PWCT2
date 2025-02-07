#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  newqbuttongroup Component
#**	Date : 2017.12.24
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class newqbuttongroupComponentController from ComponentControllerParent
	oView = new newqbuttongroupComponentView
	func GenerateAction  { 
		if Variable(:value) = NULL { 
			cOutStep = ""
			cOutCode = ""
			else
				cOutStep = StepData(:value)+" = "
				cOutCode = Variable(:value)+" = "
		} 
		NewParentStep(cOutStep+T_CT_NEWQBUTTONGROUP_ST_NEWQBUTTONGROUP)
		SetStepCode(cOutCode+"new QButtonGroup("+Variable(:value3)+") { "+nl)
		AllowInteraction()
		NewStep(T_CT_NEWQBUTTONGROUP_ST_STARTHERE)
		oStep = GetActiveStep()
		NewStep(T_CT_NEWQBUTTONGROUP_ST_END)
		SetStepCode("}")
		SetActiveStep(oStep)
		return True
	} 
private
class newqbuttongroupComponentView from ComponentViewParent
	Title(T_CT_NEWQBUTTONGROUP_IP_TITLE)
	TextBoxValue(T_CT_NEWQBUTTONGROUP_IP_VALUE,:value,T_CT_NEWQBUTTONGROUP_IP_VALUE_DEFAULT)
	TextBoxValue(T_CT_NEWQBUTTONGROUP_IP_VALUE2,:value3,T_CT_NEWQBUTTONGROUP_IP_VALUE2_DEFAULT)
	PageButtons()
private
