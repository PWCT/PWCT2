#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stringright Component
#**	Date : 2017.07.23
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stringrightComponentController from ComponentControllerParent
	oView = new stringrightComponentView
	func GenerateAction  { 
		if NoValueMsg(:value) OR NoValueMsg(:value2) OR NoValueMsg(:value3) { 
			return False
		} 
		NewStep(StepData(:value3)+" = "+T_CT_STRINGRIGHT_ST_RIGHT+StepData(:value)+T_CT_STRINGRIGHT_ST_COUNT+StepData(:value2))
		SetStepCode(Variable(:value3)+" = right("+Variable(:value)+","+Variable(:value2)+")")
		return True
	} 
private
class stringrightComponentView from ComponentViewParent
	Title(T_CT_STRINGRIGHT_IP_TITLE)
	TextBox(T_CT_STRINGRIGHT_IP_VALUE,:value)
	TextBox(T_CT_STRINGRIGHT_IP_VALUE2,:value2)
	TextBox(T_CT_STRINGRIGHT_IP_VALUE3,:value3)
	PageButtons()
private
