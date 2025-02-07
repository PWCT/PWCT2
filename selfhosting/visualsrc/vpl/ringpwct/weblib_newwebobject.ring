#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  weblib_newwebobject Component
#**	Date : 2018.03.22
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class weblib_newwebobjectComponentController from ComponentControllerParent
	oView = new weblib_newwebobjectComponentView
	func GenerateAction  { 
		switch Variable(:Value) { 
			case 1
				cObjName = "Page"
			case 2
				cObjName = "Pagebuffer"
			case 3
				cObjName = "HTML2PDF"
			case 4
				cObjName = "BootStrapPage"
			case 5
				cObjName = "WebPage"
		} 
		#Get the object Name
		cObjNameUI = T_CT_WEBLIB_NEWWEBOBJECT_IP_VALUE2LIST[Variable(:Value)]
		#Generate Step and Code
		NewParentStep(T_CT_WEBLIB_NEWWEBOBJECT_ST_NEWOBJ+" "+cObjNameUI)
		SetStepCode("new "+cObjName+" { ")
		AllowInteraction()
		NewStep(T_CT_WEBLIB_NEWWEBOBJECT_ST_STARTHERE)
		oStep = GetActiveStep()
		NewStep(T_CT_WEBLIB_NEWWEBOBJECT_ST_END)
		SetStepCode("}")
		SetActiveStep(oStep)
		return True
	} 
private
class weblib_newwebobjectComponentView from ComponentViewParent
	Title(T_CT_WEBLIB_NEWWEBOBJECT_IP_TITLE)
	ListBox(T_CT_WEBLIB_NEWWEBOBJECT_IP_VALUE,:value,T_CT_WEBLIB_NEWWEBOBJECT_IP_VALUE2LIST)
	PageButtons()
private
