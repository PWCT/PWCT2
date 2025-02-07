#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  weblib_newwebpagesubobject Component
#**	Date : 2018.03.25
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class weblib_newwebpagesubobjectComponentController from ComponentControllerParent
	oView = new weblib_newwebpagesubobjectComponentView
	func GenerateAction  { 
		switch Variable(:Value) { 
			case 1
				cObjName = "H1"
			case 2
				cObjName = "H2"
			case 3
				cObjName = "H3"
			case 4
				cObjName = "H4"
			case 5
				cObjName = "H5"
			case 6
				cObjName = "H6"
			case 7
				cObjName = "P"
			case 8
				cObjName = "Link"
			case 9
				cObjName = "NewLine"
			case 10
				cObjName = "Div"
			case 11
				cObjName = "Form"
			case 12
				cObjName = "Input"
			case 13
				cObjName = "TextArea"
			case 14
				cObjName = "Select"
			case 15
				cObjName = "Option"
			case 16
				cObjName = "Image"
			case 17
				cObjName = "UL"
			case 18
				cObjName = "LI"
			case 19
				cObjName = "Table"
			case 20
				cObjName = "TR"
			case 21
				cObjName = "TD"
			case 22
				cObjName = "TH"
			case 23
				cObjName = "Audio"
			case 24
				cObjName = "Video"
			case 25
				cObjName = "Nav"
			case 26
				cObjName = "Span"
			case 27
				cObjName = "Button"
		} 
		#Get the object Name
		cObjNameUI = T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_IP_VALUE2LIST[Variable(:Value)]
		#Generate Step and Code
		NewParentStep(cObjNameUI+" "+T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_ST_NEWOBJ)
		SetStepCode(cObjName+" { ")
		AllowInteraction()
		NewStep(T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_ST_STARTHERE)
		oStep = GetActiveStep()
		NewStep(T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_ST_END)
		SetStepCode("}")
		SetActiveStep(oStep)
		return True
	} 
private
class weblib_newwebpagesubobjectComponentView from ComponentViewParent
	Title(T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_IP_TITLE)
	ListBox(T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_IP_VALUE,:value,T_CT_WEBLIB_NEWWEBPAGESUBOBJECT_IP_VALUE2LIST)
	PageButtons()
private
