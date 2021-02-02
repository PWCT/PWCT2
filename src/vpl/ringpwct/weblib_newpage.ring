/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  weblib_newpage Component
**	Date : 2018.03.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class weblib_newpageComponentController from ComponentControllerParent 

	oView = new weblib_newpageComponentView

	func GenerateAction 

		NewParentStep(  T_CT_WEBLIB_NEWPAGE_ST_NEWPAGE  )
		SetStepCode( "new page {" + nl )
			AllowInteraction()
			NewStep( T_CT_WEBLIB_NEWPAGE_ST_STARTHERE )
			oStep = GetActiveStep()
			NewStep( T_CT_WEBLIB_NEWPAGE_ST_END )
			SetStepCode( "}" )
			SetActiveStep(oStep)

		return True 

	func AfterOpen 
		OkAction()

class weblib_newpageComponentView from ComponentViewParent
	 
		Title( T_CT_WEBLIB_NEWPAGE_IP_TITLE )	

		PageButtons()
