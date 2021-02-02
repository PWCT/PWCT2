/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  savefiledialog Component
**	Date : 2018.03.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class savefiledialogComponentController from ComponentControllerParent 

	oView = new savefiledialogComponentView

	func GenerateAction 

		NewStep( StepData(:Value5) + " = "  +  T_CT_SAVEFILEDIALOG_ST_VALUE  )
		SetStepCode( "new qfiledialog("+ Variable(:Value ) +") {" + nl +
		Variable(:Value5) + " = getsavefilename("  + Variable(:Value ) + ","  + Variable(:Value2) + ","  + Variable(:Value3) + ","  + Variable(:Value4) + ")" + nl +
		"}" )

		return True 

class savefiledialogComponentView from ComponentViewParent
	 
		Title( T_CT_SAVEFILEDIALOG_IP_TITLE )	
		TextBox( T_CT_SAVEFILEDIALOG_IP_VALUE , :value)
		TextBox( T_CT_SAVEFILEDIALOG_IP_VALUE2 , :value2)
		TextBox( T_CT_SAVEFILEDIALOG_IP_VALUE3 , :value3)
		TextBox( T_CT_SAVEFILEDIALOG_IP_VALUE4 , :value4)
		TextBox( T_CT_SAVEFILEDIALOG_IP_VALUE5 , :value5)
		PageButtons()
