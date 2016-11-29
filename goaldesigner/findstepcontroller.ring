/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class FindStepController from WindowsBase

	oView = new FindStepView

	func Start
		oView.win.Show()

	func FindValueAction

	func ReplaceAction

	func ReplaceAllAction

	func SearchKeyPressAction

	func CloseAction
		oView.Close()
		Super.Close()
