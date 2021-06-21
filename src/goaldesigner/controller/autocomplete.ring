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
			"win",
			"oView.win"
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
			AddItems(oGoalDesigner.getAutoCompleteItems())
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
				oCompleter = new qCompleter3(oList,oGUIControl)
			else 
				oCompleter = new qCompleter3(oList,NULL)
			}
			oCompleter.setCaseSensitivity(Qt_CaseInsensitive)
		# Use the Completer Object 
			oGUIControl.setCompleter(oCompleter)



	func AddFunctions
		AddItems(cfunctions())
