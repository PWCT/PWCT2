#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  checkchar Component
#**	Date : 2017.07.27
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class checkcharComponentController from ComponentControllerParent
	oView = new checkcharComponentView
	func GenerateAction  { 
		switch Variable(:Value2) { 
			case 1
				cFunc = "isalnum"
			case 2
				cFunc = "isalpha"
			case 3
				cFunc = "iscntrl"
			case 4
				cFunc = "isdigit"
			case 5
				cFunc = "isgraph"
			case 6
				cFunc = "islower"
			case 7
				cFunc = "isprint"
			case 8
				cFunc = "ispunct"
			case 9
				cFunc = "isspace"
			case 10
				cFunc = "isupper"
			case 11
				cFunc = "isxdigit"
		} 
		NewStep(StepData(:Value3)+" = "+T_CT_CHECKCHAR_ST_VALUE+StepData(:Value)+T_CT_CHECKCHAR_ST_VALUE2+StyleData(T_CT_CHECKCHAR_IP_VALUE2LIST[Variable(:Value2)]))
		SetStepCode(Variable(:Value3)+" = "+cFunc+"("+Variable(:Value)+")")
		return True
	} 
private
class checkcharComponentView from ComponentViewParent
	Title(T_CT_CHECKCHAR_IP_TITLE)
	TextBox(T_CT_CHECKCHAR_IP_VALUE,:value)
	ListBox(T_CT_CHECKCHAR_IP_VALUE2,:value2,T_CT_CHECKCHAR_IP_VALUE2LIST)
	TextBox(T_CT_CHECKCHAR_IP_VALUE3,:value3)
	PageButtons()
private
