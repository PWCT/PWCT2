/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Goal Designer Sub Windows Controller Class Parent
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class SubWindowsParent from WindowsBase

	oParentID		# Goal Designer Object ID 

	func Start
		oView.win.Show()

	func setParentObject oGD
		oParentID = oGD.ObjectID()

	func Parent
		return GetObjectByID(oParentID)

	func CloseAction
		oView.Close()
		Super.Close()
