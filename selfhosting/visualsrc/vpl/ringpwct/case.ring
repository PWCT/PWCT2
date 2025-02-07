#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  Case Component
#**	Date : 2017.07.05
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class CaseComponentController from ComponentControllerParent
	oView = new CaseComponentView
	func GenerateAction  { 
		if NoValueMsg(:value) { 
			return False
		} 
		NewParentStep(T_CT_CASE_ST_CASE+StyleData(Variable(:value)))
		#"Case "
		SetStepCode("case "+Variable(:value))
		AllowInteraction()
		NewStep(T_CT_CASE_ST_STARTHERE)
		#"Start Here"
		oStep = GetActiveStep()
		SetActiveStep(oStep)
		return True
	} 
	func CheckAllowParent cParentComponentName,nParentStepNumber { 
		if cParentComponentName = "switch" { 
			return True
		} 
		return False
	} 
private
class CaseComponentView from ComponentViewParent
	Title(T_CT_CASE_IP_TITLE)
	#"Case Component"
	TextBox(T_CT_CASE_IP_VALUE,:value)
	#"Value : "
	PageButtons()
private
