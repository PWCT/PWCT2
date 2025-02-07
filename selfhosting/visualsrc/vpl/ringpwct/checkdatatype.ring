#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  checkdatatype Component
#**	Date : 2017.07.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class checkdatatypeComponentController from ComponentControllerParent
	oView = new checkdatatypeComponentView
	func GenerateAction  { 
		switch Variable(:Value2) { 
			case 1
				cFunc = "isstring"
			case 2
				cFunc = "isnumber"
			case 3
				cFunc = "islist"
			case 4
				cFunc = "type"
			case 5
				cFunc = "isnull"
		} 
		NewStep(StepData(:Value3)+" = "+T_CT_CHECKDATATYPE_ST_VALUE+StepData(:Value)+T_CT_CHECKDATATYPE_ST_VALUE2+StyleData(T_CT_CHECKDATATYPE_IP_VALUE2LIST[Variable(:Value2)]))
		SetStepCode(Variable(:Value3)+" = "+cFunc+"("+Variable(:Value)+")")
		return True
	} 
private
class checkdatatypeComponentView from ComponentViewParent
	Title(T_CT_CHECKDATATYPE_IP_TITLE)
	TextBox(T_CT_CHECKDATATYPE_IP_VALUE,:value)
	ListBox(T_CT_CHECKDATATYPE_IP_VALUE2,:value2,T_CT_CHECKDATATYPE_IP_VALUE2LIST)
	TextBox(T_CT_CHECKDATATYPE_IP_VALUE3,:value3)
	PageButtons()
private
