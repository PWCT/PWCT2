/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goto Line View Class
**	Date : 2021.06.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GotoLineView from WindowsViewParent

	# Line Number

		cLineNumber = "" 

	# Create the window and the Controls

		win = new qWidget()
		{
			setLayoutDirection(T_LAYOUTDIRECTION)
			oLblFindWhat = new qLabel(win)
			{
				setText(T_GD_GL_LINENUMBER)
			}
			oSearchValue = new qlineedit(win)
			{
				setText(cLineNumber)
				setReturnPressedEvent(Method(:GotoLineAction))
			}
			oLayout1 = new qHBoxLayout()
			{
				addWidget(oLblFindWhat)
				addWidget(oSearchValue)
			}		
			oBtnGo = new qPushButton(win)
			{
				setText(T_GD_GL_GO)
				setclickevent(Method(:GotoLineAction))
			}
			oBtnClose = new qPushButton(win)
			{
				setText(T_GD_GL_CLOSE)
				setclickevent(Method(:CloseAction))
			}
			oLayout2 = new qHBoxLayout()
			{
				addWidget(oBtnGo)
				addWidget(oBtnClose)
			}
			oLayout3 = new qVBoxLayout()
			{
				AddLayout(oLayout1)
				AddLayout(oLayout2)
			}

			setLayout(oLayout3)

			setWindowTitle(T_GD_GL_GOTOLINE)		
			setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 

			oSearchFilter = new qallevents(win)
			oSearchFilter.setKeyPressEvent(Method(:SearchKeyPressAction))								
			installeventfilter(oSearchFilter)

		}


