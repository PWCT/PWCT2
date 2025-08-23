#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  windowcontroller Component
#**	Date : 2025.03.09
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class windowcontrollerComponentController from ComponentControllerParent
	oView = new windowcontrollerComponentView
	func GenerateAction  { 
		NewParentStep(T_CT_WINDOWCONTROLLER_ST_WINCNT+StyleData(Variable(:name)+T_CT_WINDOWCONTROLLER_ST_CONTROLLER))
		SetStepCode('load "'+Variable(:name)+T_CT_WINDOWCONTROLLER_ST_VIEWFILE+'"'+nl+"import System.GUI"+nl+"if IsMainSourceFile() {"+nl+Variable(:app)+"= new App {"+nl)
		AllowInteraction()
		NewStep(T_CT_WINDOWCONTROLLER_ST_MAINFILE)
		oStep = GetActiveStep()
		NewParentStep(T_CT_WINDOWCONTROLLER_ST_CLASS+StyleData(Variable(:name)+T_CT_WINDOWCONTROLLER_ST_CONTROLLER))
		if trim(lower(Variable(:view))) != "oview" { 
			cCreateView = Variable(:view)+" = ref(oView)"
			if T_LAYOUTDIRECTION { 
				cCreateView += nl+"addAttribute(oView,'نافذة')"
				cCreateView += nl+"oView.نافذة = oView.win"
			} 
			else
				cCreateView = ""
		} 
		SetStepCode("}"+nl+"}"+nl+"class "+Variable(:name)+T_CT_WINDOWCONTROLLER_ST_CONTROLLER+" from windowsControllerParent"+nl+"oView = new "+Variable(:name)+"View"+nl+cCreateView+nl)
		AllowInteraction()
		NewStep(T_CT_WINDOWCONTROLLER_ST_ATTRIBUTES)
		AllowInteraction()
		NewStep(T_CT_WINDOWCONTROLLER_ST_METHODS)
		NewParentStep(T_CT_WINDOWCONTROLLER_ST_PRIVATE)
		AllowInteraction()
		NewStep(T_CT_WINDOWCONTROLLER_ST_ATTRIBUTES)
		AllowInteraction()
		NewStep(T_CT_WINDOWCONTROLLER_ST_METHODS)
		NewStep(T_CT_WINDOWCONTROLLER_ST_END)
		SetActiveStep(oStep)
		return True
	} 
private
class windowcontrollerComponentView from ComponentViewParent
	Title(T_CT_WINDOWCONTROLLER_IP_TITLE)
	TextBoxValue(T_CT_WINDOWCONTROLLER_IP_VALUE,:name,T_CT_WINDOWCONTROLLER_IP_NAME)
	TextBoxValue(T_CT_WINDOWCONTROLLER_IP_VALUE2,:app,T_CT_WINDOWCONTROLLER_IP_APP)
	TextBoxValue(T_CT_WINDOWCONTROLLER_IP_VALUE3,:view,T_CT_WINDOWCONTROLLER_IP_VIEW)
	PageButtons()
private
