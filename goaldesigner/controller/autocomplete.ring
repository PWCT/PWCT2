/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Auto-complete
**	Date : 2019.10.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class AutoComplete

	oList = new qStringList()

	AddDefaultItems()

	oCompleter = new qCompleter3(oList,NULL)
	oCompleter.setCaseSensitivity(Qt_CaseInsensitive)

	func AddDefaultItems
		AddItems([
			"win",
			"oView.win"
		])

	func AddItems aList
		for cItem in aList {
			oList.append(cItem)	
		}

	func supportControl oGUIControl
		oGUIControl.setCompleter(oCompleter)
