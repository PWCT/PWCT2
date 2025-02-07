#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  If Statement Component
#**	Date : 2017.02.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class IfStatementComponentController from ComponentControllerParent
	oView = new IfStatementComponentView
	func GenerateAction  { 
		if NoValueMsg(:Condition) { 
			return False
		} 
		NewParentStep(T_CT_IFSTATEMENT_ST_IF+StyleData(Variable(:condition)))
		#"If "
		SetStepCode("if "+Variable(:condition)+" { ")
		AllowInteraction()
		NewStep(T_CT_IFSTATEMENT_ST_STARTHERE)
		#"Start Here"
		oStep = GetActiveStep()
		NewStep(T_CT_IFSTATEMENT_ST_ENDOFIFSTATEMENT)
		#"End of IF Statement"
		SetStepCode("}")
		SetActiveStep(oStep)
		return True
	} 
private
class IfStatementComponentView from ComponentViewParent
	Title(T_CT_IFSTEATEMENT_IP_TITLE)
	#"If Statement Component"
	TextBox(T_CT_IFSTEATEMENT_IP_CONDITION,:condition)
	#"Condition : "
	PageButtons()
private
