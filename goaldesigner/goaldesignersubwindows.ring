/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Goal Designer Sub Windows Controller Class Parent
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerSubWindowsParent from WindowsBase

	oGDID		# Goal Designer Object ID 

	func Start
		oView.win.Show()

	func setGoalDesignerObject oGD
		oGDID = oGD.ObjectID()

	func GD
		return GetObjectByID(oGDID)

	func CloseAction
		oView.Close()
		Super.Close()
