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
		if oGoalDesigner.CheckUsingAutoCompleteCache() {
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
				switch cClass {
					case "formdesigner_qpushbutton"
						aItems + (oObj[1]+".text()")	
						aItems + (oObj[1]+".settext")	
						aItems + ("oView."+oObj[1]+".text()")	
						aItems + ("oView."+oObj[1]+".settext")	
					case "formdesigner_qlineedit"
						aItems + (oObj[1]+".text()")	
						aItems + (oObj[1]+".settext")	
						aItems + ("oView."+oObj[1]+".text()")	
						aItems + ("oView."+oObj[1]+".settext")	
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
