/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Windows Controller Class Parent
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class WindowsControllerParent from WindowsControllerBase

	nParentID		# Goal Designer Object ID 

	func Start		
		oView.win.Show()

	func setParentObject oParent
		nParentID = oParent.ObjectID()

	func Parent
		return GetObjectByID(nParentID)

	func CloseAction
		oView.Close()
		Super.Close()
