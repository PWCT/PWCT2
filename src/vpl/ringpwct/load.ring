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
		cFileInCode = cFile

		# No Extension
		if not substr(cFile,".") {
			cFileInCode += ".ring"
		}

		# File Extension translation 
		for aExt in T_CT_LOAD_ST_EXT {
			cFileInCode = substr(cFileInCode,aExt[1],aExt[2])
		}
	
		# Type 
		switch Variable(:type) {
			case 1
				cStart = ""
				cStepStart = T_CT_LOAD_ST_LOAD
			case 2
				cStart = "package "
				cStepStart = T_CT_LOAD_ST_LOAD + T_CT_LOAD_ST_PACKAGE
			case 3
				cStart = "again "
				cStepStart = T_CT_LOAD_ST_LOAD + T_CT_LOAD_ST_AGAIN
		}
						
		NewStep(cStepStart + StyleData(cFile)   )  
			SetStepCode("load " + cStart + '"' + cFileInCode + '"')

		return True 

class LoadComponentView from ComponentViewParent
	 
		Title(T_CT_LOAD_IP_TITLE)	
		TextBoxValue(T_CT_LOAD_IP_FILE , :file, T_CT_LOAD_IP_FILE_VALUE)
		ListBox(T_CT_LOAD_IP_TYPE, :type , T_CT_LOAD_IP_TYPELIST) {
			setcurrentrow(1,QItemSelectionModel_Clear | QItemSelectionModel_Select)
		}	
		PageButtons()
