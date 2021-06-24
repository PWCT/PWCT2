/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Auto-complete
**	Date : 2019.10.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class AutoComplete

	lAddCommonStrings	= True
	lAddGUIItems 		= True
	lAddRingFunctions 	= True

	oList = new qStringList()

	AddDefaultItems()

	nSize = oList.count()

	lSupportAutoComplete = True 

	if PWCTIsMobile(:AutoComplete) {
		lSupportAutoComplete = False 
	}

	func AddDefaultItems
		# Add Common Strings 
			if lAddCommonStrings {
				AddCommonStrings()
			}

		# Add GUI Items
			if lAddGUIItems {
				AddGUIItems()
			}

		# Add Ring Functions 
			if lAddRingFunctions {
				AddFunctions()
			}

	func AddCommonStrings
		AddItems([
			"Hello, World!",
			"Welcome",
			"Enter",
			"your",
			"name",
			"What",
			"is",
			"age",
			"one","two","three","four","five",
			"six","seven","eight","nine","ten",
			"exit"
			])		

	func AddGUIItems
		AddItems([
			"oView"
			])
	
	func AddItems aList
		for cItem in aList {
			oList.append(cItem)	
		}

	func DeleteExtraItems
		nMax = oList.count()
		for t=nSize+1 to nMax {
			oList.removelast()
		}

	func loadExtraItems oGoalDesigner
		if CheckUsingAutoCompleteCache(oGoalDesigner) {
			return 
		}
		# Delete Extra (Dynamic) Items 
			DeleteExtraItems()
		# Add the Dynamic Items 
			AddItems(getAutoCompleteItems(oGoalDesigner))
		# Remove Duplication
			oList.removeDuplicates()

	func supportControl oGoalDesigner,oGUIControl
		return supportControlImplementation(oGoalDesigner,oGUIControl,True)

	func supportControlWithoutSettingItAsParent oGoalDesigner,oGUIControl
		return supportControlImplementation(oGoalDesigner,oGUIControl,False)

	func supportControlImplementation oGoalDesigner,oGUIControl,lSetParent
		if not lSupportAutoComplete { return }
		loadExtraItems(oGoalDesigner)
		# Create the Completer Object 
			if lSetParent {
				oCompleter = new qCompleter4(oList,oGUIControl)
			else 
				oCompleter = new qCompleter4(oList,NULL)
			}
			oCompleter.setCaseSensitivity(Qt_CaseInsensitive)
		# Use the Completer Object 
			oGUIControl.setCompleter(oCompleter)

	func AddFunctions
		AddItems(cfunctions())

	/*
		Get Autocomplete Items
	*/
	func getAutoCompleteItems oGoalDesigner
		aItems = []
		# Add objects from the Form Designer 
			aObjects = oGoalDesigner.parent().formdesigner().oModel.getObjects()
			nAutoCompleteFormObjectsCache = len(aObjects)
			for oObj in aObjects {
				if oObj[1] = "Window" { oObj[1] = "win" }
				if not find(aItems,oObj[1]) {
					aItems + oObj[1]
				}
				if not find(aItems,"oView."+oObj[1]) {
					aItems + ("oView."+oObj[1])
				}
				cClass = classname(oObj[2])
				lKnown = True
				switch cClass {
					case "formdesigner_qwidget"
						oMyObj = new qwidget 
					case "formdesigner_qlabel"
						oMyObj = new qlabel
					case "formdesigner_qpushbutton"
						oMyObj = new qpushbutton  
					case "formdesigner_qlineedit"
						oMyObj = new qlineedit 
					case "formdesigner_qtextedit"
						oMyObj = new qtextedit 
					case "formdesigner_qlistwidget"
						oMyObj = new qlistwidget 
					case "formdesigner_qcheckbox"
						oMyObj = new qcheckbox
					case "formdesigner_qimage"
						oMyObj = new qlabel
					case "formdesigner_qslider"
						oMyObj = new qslider
					case "formdesigner_qprogressbar"
						oMyObj = new qprogressbar
					case "formdesigner_qspinbox"
						oMyObj = new qspinbox
					case "formdesigner_qcombobox"
						oMyObj = new qcombobox
					case "formdesigner_qdatetimeedit"
						oMyObj = new qdatetimeedit
					case "formdesigner_qtablewidget"
						oMyObj = new qtablewidget
					case "formdesigner_qtreewidget"
						oMyObj = new qtreewidget
					case "formdesigner_qradiobutton"
						oMyObj = new qradiobutton
					case "formdesigner_qwebview"
						oMyObj = new qwebview
					case "formdesigner_qdial"
						oMyObj = new qdial
					case "formdesigner_qvideowidget"
						oMyObj = new qvideowidget
					case "formdesigner_qframe"
						oMyObj = new qframe
					case "formdesigner_qlcdnumber"
						oMyObj = new qlcdnumber
					case "formdesigner_qhyperlink"
						oMyObj = new qlabel
					case "formdesigner_qtimer"
						oMyObj = new qtimer
					case "formdesigner_qallevents"
						oMyObj = new qallevents
					case "formdesigner_qlayout"
						oMyObj = new qvboxlayout
					case "formdesigner_qtabwidget"
						oMyObj = new qtabwidget
					case "formdesigner_qstatusbar"
						oMyObj = new qstatusbar
					case "formdesigner_qtoolbar"
						oMyObj = new qtoolbar
					other 
						lKnown = False
				}
				if lKnown {
					aMethodsList = methods(oMyObj)
					for cMethod in aMethodsList {
						aItems + (oObj[1]+"."+cMethod)	
						aItems + ("oView."+oObj[1]+"."+cMethod)	
					}
				}
			}
		# Get Steps Tree Data
			aTree = oGoalDesigner.oModel.oStepsTreeModel.GetData()
			nAutoCompleteStepsTreeCache = len(aTree)
		# Add words from Steps Tree 
			cCode = ""
			for item in aTree {
				aContent = item[C_TREEMODEL_CONTENT]
				cCode += aContent[:code] + nl				
			}
			aWords = sort(split(cCode," "))
		# Remove Duplication
			cLast = ""
			for word in aWords {
				if word != cLast {
					aItems + word
					cLast = word
				}
			}
		return aItems

	func CheckUsingAutoCompleteCache oGoalDesigner
		return (len(oGoalDesigner.oModel.oStepsTreeModel.aList) = oGoalDesigner.nAutoCompleteStepsTreeCache) and 
			( len(oGoalDesigner.parent().formdesigner().oModel.getObjects()) = oGoalDesigner.nAutoCompleteFormObjectsCache)
