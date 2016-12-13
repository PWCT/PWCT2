/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class PrintStepsController from GoalDesignerSubWindowsParent

	oView = new PrintStepsView

	func ShowData
		oView.oStepsTree.setText(Parent().oModel.StepsTreeText())
		oView.oStepsCode.setText(Parent().oModel.StepsTreeCode())

	func PrintStepsTreeAction
		printer1 = new qPrinter(0) {
			setoutputformat(1)	# 1 = pdf
			setoutputfilename("StepsTree.pdf")
		}	
		oView.oStepsTree.print(printer1)		
		system("start StepsTree.pdf")

	func PrintSourceCodeAction
		printer1 = new qPrinter(0) {
			setoutputformat(1)	# 1 = pdf
			setoutputfilename("StepsCode.pdf")
		}
		oView.oStepsCode.print(printer1)
		system("start StepsCode.pdf")
