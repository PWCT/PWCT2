/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  import Component
**	Date : 2017.10.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class importComponentController from ComponentControllerParent 

	oView = new importComponentView

	func GenerateAction 

		NewStep(  T_CT_IMPORT_ST_IMPORT + " " + StepData(:value)  )
		SetStepCode( "import " + Variable(:value) )

		return True 

class importComponentView from ComponentViewParent
	 
		Title( T_CT_IMPORT_IP_TITLE )	
		TextBox( T_CT_IMPORT_IP_VALUE , :value)
		PageButtons()
