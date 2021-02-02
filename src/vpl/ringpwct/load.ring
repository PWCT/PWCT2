/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Return Component
**	Date : 2017.07.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class LoadComponentController from ComponentControllerParent 

	oView = new LoadComponentView

	func GenerateAction 

		cFile = Variable(:file)
		
		# No Extension
		if not substr(cFile,".") {
			cFile += ".ring"
		}
								
		NewStep(T_CT_LOAD_ST_LOAD + StyleData(cFile)   )  
			SetStepCode("load " + '"' + cFile + '"')

		return True 

class LoadComponentView from ComponentViewParent
	 
		Title(T_CT_LOAD_IP_TITLE)	
		TextBox(T_CT_LOAD_IP_FILE , :file)
		PageButtons()
