#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  ObjectsLib Component
#**	Date : 2021.10.13
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class objectslibComponentController from ComponentControllerParent
	oView = new objectsLibComponentView
	func GenerateAction  { 
		cFunc = T_CT_OBJECTSLIB_IP_VALUE2FUNC[Variable(:Value2)]
		NewStep(StyleData(T_CT_OBJECTSLIB_IP_VALUE2STEPFUNC[Variable(:Value2)])+T_CT_OBJECTSLIB_ST_VALUE+StepData(:Value)+T_CT_OBJECTSLIB_ST_VALUE2)
		SetStepCode(cFunc+"("+Variable(:Value)+")")
		return True
	} 
private
class objectslibComponentView from ComponentViewParent
	Title(T_CT_OBJECTSLIB_IP_TITLE)
	TextBoxValue(T_CT_OBJECTSLIB_IP_VALUE,:value,T_CT_OBJECTSLIB_IP_VALUE_DEFAULT)
	DisableListBoxSort()
	ListBox(T_CT_OBJECTSLIB_IP_VALUE2,:value2,T_CT_OBJECTSLIB_IP_VALUE2LIST)
	PageButtons()
private
