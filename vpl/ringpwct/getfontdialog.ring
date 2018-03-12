/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  getfontdialog Component
**	Date : 2018.03.13
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class getfontdialogComponentController from ComponentControllerParent 

	oView = new getfontdialogComponentView

	func GenerateAction 

		cCurrentFontValue = ""
		if Variable(:value) != NULL {
		cCurrentFontValue = "setcurrentfont(" + Variable(:Value) + ")" + nl
		}
		NewStep( StepData(:Value2) + " = "  +  T_CT_GETFONTDIALOG_ST_VALUE  )
		SetStepCode( "new qfontdialog() {" + nl + cCurrentFontValue +
		Variable(:Value2) + " = getfont()" + nl +
		"}" )

		return True 

class getfontdialogComponentView from ComponentViewParent
	 
		Title( T_CT_GETFONTDIALOG_IP_TITLE )	
		TextBox( T_CT_GETFONTDIALOG_IP_VALUE , :value)
		TextBox( T_CT_GETFONTDIALOG_IP_VALUE2 , :value2)
		PageButtons()
