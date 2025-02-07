#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  libcurl_easyinit Component
#**	Date : 2018.03.29
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class libcurl_easyinitComponentController from ComponentControllerParent
	oView = new libcurl_easyinitComponentView
	func GenerateAction  { 
		NewStep(StepData(:Value)+" = "+T_CT_LIBCURL_EASYINIT_ST_VALUE)
		SetStepCode(Variable(:Value)+" = "+"curl_easy_init()")
		return True
	} 
private
class libcurl_easyinitComponentView from ComponentViewParent
	Title(T_CT_LIBCURL_EASYINIT_IP_TITLE)
	TextBox(T_CT_LIBCURL_EASYINIT_IP_VALUE,:value)
	PageButtons()
private
