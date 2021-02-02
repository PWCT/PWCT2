/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  libcurl_easyperform Component
**	Date : 2018.03.29
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class libcurl_easyperformComponentController from ComponentControllerParent 

	oView = new libcurl_easyperformComponentView

	func GenerateAction 

		 NewStep( T_CT_LIBCURL_EASYPERFORM_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "curl_easy_perform("  + Variable(:Value ) + ")"  )

		return True 

class libcurl_easyperformComponentView from ComponentViewParent
	 
		Title( T_CT_LIBCURL_EASYPERFORM_IP_TITLE )	
		TextBox( T_CT_LIBCURL_EASYPERFORM_IP_VALUE , :value)
		PageButtons()
