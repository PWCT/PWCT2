/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Components Browser View Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentsBrowserView from WindowsViewParent

	# Create the window and the Controls

		win = new qWidget()
		{
			setLayoutDirection(T_LAYOUTDIRECTION)

			resize(600,500)
			setWindowTitle(T_CB_COMPONENTSBROWSER)		
			setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 

			oWinFilter = new qallevents(win)
			oWinFilter.setKeyPressEvent(Method(:KeyPressAction))								
			installeventfilter(oWinFilter)

		}

