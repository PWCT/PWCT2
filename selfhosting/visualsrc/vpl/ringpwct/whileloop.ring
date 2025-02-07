#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  While Loop Component
#**	Date : 2017.07.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class WhileLoopComponentController from ComponentControllerParent
	oView = new WhileLoopComponentView
	func GenerateAction  { 
		if NoValueMsg(:condition) { 
			return False
		} 
		NewParentStep(T_CT_WHILELOOP_ST_WHILE+StyleData(Variable(:condition)))
		SetStepCode("while "+Variable(:condition)+" { ")
		AllowInteraction()
		NewStep(T_CT_WHILELOOP_ST_STARTHERE)
		oStep = GetActiveStep()
		NewStep(T_CT_WHILELOOP_ST_ENDOFWHILELOOP)
		SetStepCode("}")
		SetActiveStep(oStep)
		return True
	} 
private
class WhileLoopComponentView from ComponentViewParent
	Title(T_CT_WHILELOOP_IP_TITLE)
	#"WhileLoop Component"
	TextBoxValue(T_CT_WHILELOOP_IP_CONDITION,:condition,T_CT_WHILELOOP_IP_STARTVALUE)
	#"Condition : "
	PageButtons()
private
