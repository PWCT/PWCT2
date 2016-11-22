/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

$FindStep = NULL

class FindStepController

	oView = new FindStepView

	func Start
		oView.Show()

	func CloseAction
		oView.Close()
