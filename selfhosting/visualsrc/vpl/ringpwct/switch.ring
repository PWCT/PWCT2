#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  Switch Component
#**	Date : 2017.07.06
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class SwitchComponentController from ComponentControllerParent
	oView = new SwitchComponentView
	func GenerateAction  { 
		if NoValueMsg(:Variable) { 
			return False
		} 
		NewParentStep(T_CT_SWITCH_ST_SWITCH+StyleData(Variable(:Variable)))
		#"Switch "
		SetStepCode("switch "+Variable(:Variable)+" { ")
		AllowInteraction()
		NewStep(T_CT_SWITCH_ST_STARTHERE)
		#"Start Here"
		oStep = GetActiveStep()
		NewStep(T_CT_SWITCH_ST_ENDOFSWITCH)
		#"End of Switch"
		SetStepCode("}")
		SetActiveStep(oStep)
		return True
	} 
private
class SwitchComponentView from ComponentViewParent
	Title(T_CT_SWITCH_IP_TITLE)
	#"Switch Component"
	TextBox(T_CT_SWITCH_IP_VARIABLE,:Variable)
	#"Variable : "
	PageButtons()
private
