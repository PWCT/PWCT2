/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  PWCT Desktop Class Class
**	Date : 2023.09.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class PWCTDesktop

	oDW = new QDesktopWidget()

	func width 
		switch oDW.width()
			on 1920
				return 950
			on 1680
				return 900
			other 
				return 800
		off

	func height 
		return 600
