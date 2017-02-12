/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2017.02.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class StepsColorsController from WindowsControllerParent

	oView = new StepsColorsView

	/*
		Purpose : Color Action
		Parameters : the Button Number 
		Output : None
	*/

	func colorAction nBtnNumber

		new qcolordialog() { 
			r = exec()		
			if r = 0 return ok
			oColor = currentcolor()
			r = hex( oColor.red() )
			g = hex( oColor.green() )
			b = hex( oColor.blue() )
		}	

		if len(r) < 2  { r = "0" + r }
		if len(g) < 2  { g = "0" + r }
		if len(b) < 2  { b = "0" + r }

		cColor = r + g + b

		switch nBtnNumber {
			case 1
			case 2
			case 3
			case 4
			case 5
			case 6
			case 7
			case 8
			case 9
			case 10
		}
