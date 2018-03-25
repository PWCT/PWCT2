/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  weblib_newwebpagesubobject Component
**	Date : 2018.03.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class weblib_newwebpagesubobjectComponentController from ComponentControllerParent 

	oView = new weblib_newwebpagesubobjectComponentView

	func GenerateAction 

				switch Variable(:Value) {
					
					case 1 cObjName = "H1" 
					case 2 cObjName = "H2" 
					case 3 cObjName = "H3" 
					case 4 cObjName = "H4" 
					case 5 cObjName = "H5" 
					case 6 cObjName = "H6" 
		
				}
		
				# Get the object Name 
					cObjNameUI = T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_IP_VALUE2LIST [Variable(:Value)]
		
				# Generate Step and Code 
					NewParentStep( cObjNameUI + " " + T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_ST_NEWOBJ )
					SetStepCode( cObjName + " { "  )
						AllowInteraction()
						NewStep( T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_ST_STARTHERE )
						oStep = GetActiveStep()
						NewStep( T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_ST_END )
						SetStepCode( "}" )
						SetActiveStep(oStep)

		return True 

class weblib_newwebpagesubobjectComponentView from ComponentViewParent
	 
		Title( T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_IP_TITLE )	
		ListBox( T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_IP_VALUE , :value, 
				T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_IP_VALUE2LIST )
		PageButtons()
