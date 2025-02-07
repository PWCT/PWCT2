#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  stdlib_trim Component
#**	Date : 2017.10.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class stdlib_trimComponentController from ComponentControllerParent
	oView = new stdlib_trimComponentView
	func GenerateAction  { 
		switch Variable(:Value2) { 
			case 1
				cFunc = "trimall"
			case 2
				cFunc = "trimleft"
			case 3
				cFunc = "trimright"
		} 
		NewStep(StepData(:Value3)+" = "+T_CT_STDLIB_TRIM_ST_VALUE+StepData(:Value)+T_CT_STDLIB_TRIM_ST_VALUE2+StyleData(T_CT_STDLIB_TRIM_IP_VALUE2LIST[Variable(:Value2)]))
		SetStepCode(Variable(:Value3)+" = "+cFunc+"("+Variable(:Value)+")")
		return True
	} 
private
class stdlib_trimComponentView from ComponentViewParent
	Title(T_CT_STDLIB_TRIM_IP_TITLE)
	TextBox(T_CT_STDLIB_TRIM_IP_VALUE,:value)
	ListBox(T_CT_STDLIB_TRIM_IP_VALUE2,:value2,T_CT_STDLIB_TRIM_IP_VALUE2LIST)
	TextBox(T_CT_STDLIB_TRIM_IP_VALUE3,:value3)
	PageButtons()
private
