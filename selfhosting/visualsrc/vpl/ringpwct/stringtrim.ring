#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stringtrim Component
#**	Date : 2017.07.23
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stringtrimComponentController from ComponentControllerParent
	oView = new stringtrimComponentView
	func GenerateAction  { 
		if NoValueMsg(:value) OR NoValueMsg(:value2) { 
			return False
		} 
		NewStep(StepData(:value2)+" = "+T_CT_STRINGTRIM_ST_TRIM+StepData(:value))
		SetStepCode(Variable(:value2)+" = trim("+Variable(:value)+")")
		return True
	} 
private
class stringtrimComponentView from ComponentViewParent
	Title(T_CT_STRINGTRIM_IP_TITLE)
	TextBox(T_CT_STRINGTRIM_IP_VALUE,:value)
	TextBox(T_CT_STRINGTRIM_IP_VALUE2,:value2)
	PageButtons()
private
