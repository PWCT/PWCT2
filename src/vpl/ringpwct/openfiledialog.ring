/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  openfiledialog Component
**	Date : 2018.03.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class openfiledialogComponentController from ComponentControllerParent 

	oView = new openfiledialogComponentView

	func GenerateAction 

		NewStep( StepData(:Value5) + " = "  +  T_CT_OPENFILEDIALOG_ST_VALUE  )
		SetStepCode( "new qfiledialog("+ Variable(:Value ) +") {" + nl +
		Variable(:Value5) + " = getopenfilename("  + Variable(:Value ) + ","  + Variable(:Value2) + ","  + Variable(:Value3) + ","  + Variable(:Value4) + ")" + nl +
		"}" )

		return True 

class openfiledialogComponentView from ComponentViewParent
	 
		Title( T_CT_OPENFILEDIALOG_IP_TITLE )	
		TextBox( T_CT_OPENFILEDIALOG_IP_VALUE , :value)
		TextBox( T_CT_OPENFILEDIALOG_IP_VALUE2 , :value2)
		TextBox( T_CT_OPENFILEDIALOG_IP_VALUE3 , :value3)
		TextBox( T_CT_OPENFILEDIALOG_IP_VALUE4 , :value4)
		TextBox( T_CT_OPENFILEDIALOG_IP_VALUE5 , :value5)
		PageButtons()
