#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  GetChar() Component
#**	Date : 2017.07.12
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class GetCharComponentController from ComponentControllerParent
	oView = new GetCharComponentView
	func GenerateAction  { 
		if NoValueMsg(:Output) { 
			return False
		} 
		NewStep(StyleData(Variable(:Output))+" = "+T_CT_GETCHAR_ST_GETCHAR)
		SetStepCode(Variable(:Output)+" = GetChar()")
		return True
	} 
private
class GetCharComponentView from ComponentViewParent
	Title(T_CT_GETCHAR_IP_TITLE)
	TextBoxValue(T_CT_GETCHAR_IP_OUTPUT,:Output,"c")
	PageButtons()
private
