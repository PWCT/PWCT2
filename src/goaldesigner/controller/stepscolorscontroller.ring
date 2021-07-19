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

		switch nBtnNumber {
			case 1
				cColor = C_STEPCOLOR_COMMENT_TEXT 
			case 2
				cColor = C_STEPCOLOR_COMMENT_BACKCOLOR 
			case 3
				cColor = C_STEPCOLOR_ROOT_TEXT 
			case 4
				cColor = C_STEPCOLOR_ROOT_BACKCOLOR 
			case 5
				cColor = C_STEPCOLOR_ALLOWINTERACTION_TEXT 
			case 6
				cColor = C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR 
			case 7
				cColor = C_STEPCOLOR_INFO_TEXT
			case 8
				cColor = C_STEPCOLOR_INFO_BACKCOLOR 
			case 9
				cColor = C_STEPCOLOR_DATA_TEXT 
			case 10
				cColor = C_STEPCOLOR_DATA_BACKCOLOR 
			case 11
				cColor = C_STEPSTREE_BACKCOLOR
		}

		if len(cColor) != 7 {
			cColor = "#000000"
		}

		oColor = new QColor() {
			setred(dec(substr(cColor,2,2)))
			setGreen(dec(substr(cColor,4,2)))
			setBlue(dec(substr(cColor,6,2)))
		}
		
		new qcolordialog() { 
			setCurrentColor(oColor)
			setwindowflags(Qt_WindowStaysOnTopHint) 
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
				C_STEPCOLOR_INFO_TEXT = cColor
			case 8
				oView.btnLeafBackColor.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_INFO_BACKCOLOR = cColor
			case 9
				oView.btnDataText.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_DATA_TEXT = cColor
			case 10
				oView.btnDataBackColor.setstylesheet("background-color: "+cColor)
				C_STEPCOLOR_DATA_BACKCOLOR = cColor
			case 11
				oView.btnStepsTreeBackColor.setstylesheet("background-color: "+cColor)
				C_STEPSTREE_BACKCOLOR = cColor
		}
		parent().refreshStepsTree()

	func StepsTreeLines 
		C_STEPSTREE_SHOWLINES = oView.checkStepsTreeLines.checkState()
		parent().refreshStepsTree()

	func SetIndentation 
		nValue = number(oView.txtIndentation.text())
		if nValue >= 10 and nValue < 100 {
			oView.txtIndentation.setStyleSheet("background-color:white;")
			C_STEPSTREE_INDENTATION = nValue 
			parent().refreshStepsTree()
		else 
			oView.txtIndentation.setStyleSheet("background-color:red;")
		}

	func AutoRun 
		C_STEPSTREE_AUTORUN = oView.checkAutoRun.checkState()
		parent().lAutoRun = C_STEPSTREE_AUTORUN

	func OpenFilesInNewTabs
		C_STEPSTREE_OPENFILESINNEWTABS = oView.checkOpenFilesInNewTabs.checkState()
		parent().parent() {	# GoalDesigner.Environment
			lOpenFilesInNewTabs = C_STEPSTREE_OPENFILESINNEWTABS
			CloseTabsExceptTheFirstOne()
		}

	func OpenInteractionsInNewWindows
		C_STEPSTREE_OPENINTERACTIONSINNEWWINDOWS = oView.checkOpenInteractionsInNewWindows.checkState()
		parent().lInteractionPagesInGoalDesigner = ! C_STEPSTREE_OPENINTERACTIONSINNEWWINDOWS
		parent().ComponentsBrowserWindow().lInteractionPagesInGoalDesigner = ! C_STEPSTREE_OPENINTERACTIONSINNEWWINDOWS

	func ShowTimeMachine
		C_STEPSTREE_SHOWTIMEMACHINE = oView.checkShowTimeMachine.checkState()
		parent().showTimeMachine(C_STEPSTREE_SHOWTIMEMACHINE)

	func AvoidComponentsBrowser
		C_STEPSTREE_AVOIDCOMPONENTSBROWSER = oView.checkAvoidComponentsBrowser.checkState()
		parent().lAvoidComponentsBrowser = C_STEPSTREE_AVOIDCOMPONENTSBROWSER

	func AvoidComponentsBrowserAC
		C_STEPSTREE_AVOIDCOMPONENTSBROWSERAUTOCOMPLETE = oView.checkAvoidComponentsBrowserAutoComplete.checkState()
		parent().lAvoidComponentsBrowserAutoComplete = C_STEPSTREE_AVOIDCOMPONENTSBROWSERAUTOCOMPLETE

	func ComponentsBrowserAShowSW
		C_STEPSTREE_COMPONENTSBROWSERALWAYSSHOWSEARCHWINDOW = oView.checkComponentsBrowserAlwaysShowSearchWindow.checkState()
		parent().lComponentsBrowserAlwaysShowSearchWindow = C_STEPSTREE_COMPONENTSBROWSERALWAYSSHOWSEARCHWINDOW

	func LightTreeLines
		C_STEPSTREE_LIGHTTREELINES = oView.checkLightTreeLines.checkState()
		parent().refreshStepsTree()
