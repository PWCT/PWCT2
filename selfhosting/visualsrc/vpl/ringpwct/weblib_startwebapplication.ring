#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  weblib_startwebapplication Component
#**	Date : 2018.03.22
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class weblib_startwebapplicationComponentController from ComponentControllerParent
	oView = new weblib_startwebapplicationComponentView
	func GenerateAction  { 
		NewStep(T_CT_WEBLIB_STARTWEBAPPLICATION_ST_STARTWEBAPP)
		SetStepCode("#!ring -cgi"+nl+'load "weblib.ring"'+nl+"import System.Web"+nl)
		return True
	} 
	func AfterOpen  { 
		OkAction()
	} 
private
class weblib_startwebapplicationComponentView from ComponentViewParent
	Title(T_CT_WEBLIB_STARTWEBAPPLICATION_IP_TITLE)
	PageButtons()
private
