/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  libcurl_easyperformsilent Component
**	Date : 2018.03.29
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class libcurl_easyperformsilentComponentController from ComponentControllerParent 

	oView = new libcurl_easyperformsilentComponentView

	func GenerateAction 

		 NewStep( StepData(:Value2) + " = "  +  T_CT_LIBCURL_EASYPERFORMSILENT_ST_VALUE  + StepData(:Value )  )
		SetStepCode( Variable(:Value2) + " = curl_easy_perform_silent("  + Variable(:Value ) + ")"  )

		return True 

class libcurl_easyperformsilentComponentView from ComponentViewParent
	 
		Title( T_CT_LIBCURL_EASYPERFORMSILENT_IP_TITLE )	
		TextBox( T_CT_LIBCURL_EASYPERFORMSILENT_IP_VALUE , :value)
		TextBox( T_CT_LIBCURL_EASYPERFORMSILENT_IP_VALUE2 , :value2)
		PageButtons()
