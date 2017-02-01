/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Components Browser Controller Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentsBrowserController from WindowsControllerParent

	oView = new ComponentsBrowserView

	func KeyPressAction
		if oView.oWinFilter.getKeyCode() = Qt_Key_Escape {	
			CloseAction()		
		}
