#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_fexists Component
#**	Date : 2017.07.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_fexistsComponentController from ComponentControllerParent
	oView = new file_fexistsComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value2)+" = "+T_CT_FILE_FEXISTS_ST_VALUE+StepData(:Value))
		SetStepCode(Variable(:Value2)+" = fexists("+Variable(:Value)+")")
		return True
	} 
private
class file_fexistsComponentView from ComponentViewParent
	Title(T_CT_FILE_FEXISTS_IP_TITLE)
	TextBox(T_CT_FILE_FEXISTS_IP_VALUE,:value)
	TextBox(T_CT_FILE_FEXISTS_IP_VALUE2,:value2)
	PageButtons()
private
