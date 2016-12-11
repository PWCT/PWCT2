/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class PrintStepsController from GoalDesignerSubWindowsParent

	oView = new PrintStepsView

	func ShowData
		oView.oStepsTree.setText(GD().oModel.StepsTreeText())
		oView.oStepsCode.setText(GD().oModel.StepsTreeCode())
