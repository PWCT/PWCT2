/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  libcurl_easycleanup Component
**	Date : 2018.03.29
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class libcurl_easycleanupComponentController from ComponentControllerParent 

	oView = new libcurl_easycleanupComponentView

	func GenerateAction 

		 NewStep( T_CT_LIBCURL_EASYCLEANUP_ST_VALUE  + StepData(:Value )  )
		SetStepCode(  "curl_easy_cleanup("  + Variable(:Value ) + ")"  )

		return True 

class libcurl_easycleanupComponentView from ComponentViewParent
	 
		Title( T_CT_LIBCURL_EASYCLEANUP_IP_TITLE )	
		TextBox( T_CT_LIBCURL_EASYCLEANUP_IP_VALUE , :value)
		PageButtons()
