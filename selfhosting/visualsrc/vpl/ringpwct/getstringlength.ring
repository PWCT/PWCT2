#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  getstringlength Component
#**	Date : 2017.07.23
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class getstringlengthComponentController from ComponentControllerParent
	oView = new getstringlengthComponentView
	func GenerateAction  { 
		if NoValueMsg(:value) OR NoValueMsg(:value2) { 
			return False
		} 
		NewStep(StepData(:value2)+" = "+T_CT_GETSTRINGLENGTH_ST_STRINGLENGTH+StepData(:value))
		SetStepCode(Variable(:value2)+" = len("+Variable(:value)+")")
		return True
	} 
private
class getstringlengthComponentView from ComponentViewParent
	Title(T_CT_GETSTRINGLENGTH_IP_TITLE)
	TextBox(T_CT_GETSTRINGLENGTH_IP_VALUE,:value)
	TextBox(T_CT_GETSTRINGLENGTH_IP_VALUE2,:value2)
	PageButtons()
private
