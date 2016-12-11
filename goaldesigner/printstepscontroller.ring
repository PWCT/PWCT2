/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class PrintStepsController from WindowsBase

	oView = new PrintStepsView

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
