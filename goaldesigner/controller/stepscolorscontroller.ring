/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2017.02.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class StepsColorsController from WindowsControllerParent

	oView = new StepsColorsView

	/*
		Purpose : Color Action
		Parameters : the Button Number 
		Output : None
	*/

	func colorAction nBtnNumber

		new qcolordialog() { 
			r = exec()		
			if r = 0 return ok
			oColor = currentcolor()
			r = hex( oColor.red() )
			g = hex( oColor.green() )
			b = hex( oColor.blue() )
		}	

		if len(r) < 2  { r = "0" + r }
		if len(g) < 2  { g = "0" + g }
		if len(b) < 2  { b = "0" + b }

		cColor = "#" + r + g + b

		switch nBtnNumber {
			case 1
				oView.btnCommentText.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_COMMENT_TEXT = cColor
			case 2
				oView.btnCommentBackColor.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_COMMENT_BACKCOLOR = cColor
			case 3
				oView.btnRootText.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_ROOT_TEXT = cColor
			case 4
				oView.btnRootBackColor.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_ROOT_BACKCOLOR = cColor
			case 5
				oView.btnAllowInteractionText.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_ALLOWINTERACTION_TEXT = cColor
			case 6
				oView.btnAllowInteractionBackColor.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR = cColor
			case 7
				oView.btnLeafText.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_LEAF_TEXT = cColor
			case 8
				oView.btnLeafBackColor.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_LEAF_BACKCOLOR = cColor
			case 9
				oView.btnDataText.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_DATA_TEXT = cColor
			case 10
				oView.btnDataBackColor.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_DATA_BACKCOLOR = cColor
		}
