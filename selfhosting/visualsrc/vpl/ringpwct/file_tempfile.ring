#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  file_tempfile Component
#**	Date : 2017.07.31
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class file_tempfileComponentController from ComponentControllerParent
	oView = new file_tempfileComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_FILE_TEMPFILE_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"tempfile()")
		return True
	} 
private
class file_tempfileComponentView from ComponentViewParent
	Title(T_CT_FILE_TEMPFILE_IP_TITLE)
	TextBox(T_CT_FILE_TEMPFILE_IP_VALUE,:value)
	PageButtons()
private
