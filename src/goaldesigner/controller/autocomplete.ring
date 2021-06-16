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

	oCompleter = new qCompleter3(oList,NULL)
	oCompleter.setCaseSensitivity(Qt_CaseInsensitive)

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

	func supportControl oGoalDesigner,oGUIControl
		if not lSupportAutoComplete { return }
		# Delete Extra (Dynamic) Items 
			nMax = oList.count()
			for t=nSize+1 to nMax {
				oList.removelast()
			}
		# Add the Dynamic Items 
			AddItems(["Test"])
		# Update the Completer Object 
			oCompleter.delete()
			oCompleter = new qCompleter3(oList,NULL)
			oCompleter.setCaseSensitivity(Qt_CaseInsensitive)
		# Set the GUI Object completer 
			oGUIControl.setCompleter(oCompleter)
		

	func AddFunctions
		AddItems(cfunctions())
