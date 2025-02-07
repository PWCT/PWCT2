#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  findsubstring Component
#**	Date : 2017.07.24
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class findsubstringComponentController from ComponentControllerParent
	oView = new findsubstringComponentView
	func GenerateAction  { 
		NewStep(StepData(:value3)+" = "+T_CT_FINDSUBSTRING_ST_FINDSUBSTRING+StepData(:value2)+T_CT_FINDSUBSTRING_ST_INSTRING+StepData(:value))
		SetStepCode(Variable(:value3)+" = substr("+Variable(:value)+","+Variable(:value2)+")")
		return True
	} 
private
class findsubstringComponentView from ComponentViewParent
	Title(T_CT_FINDSUBSTRING_IP_TITLE)
	TextBox(T_CT_FINDSUBSTRING_IP_VALUE,:value)
	TextBox(T_CT_FINDSUBSTRING_IP_VALUE2,:value2)
	TextBox(T_CT_FINDSUBSTRING_IP_VALUE3,:value3)
	PageButtons()
private
