/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step View Class
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class FindStepView from WindowsViewParent

	# The Search and Replace Text

		cSearchText = "" 
		cReplaceText = ""

	# Create the window and the Controls

		win = new qWidget()
		{
			setLayoutDirection(T_LAYOUTDIRECTION)
			oLblFindWhat = new qLabel(win)
			{
				setText(T_GD_FS_FINDWHAT)
			}
			oSearchValue = new qlineedit(win)
			{
				setText(cSearchText)
				setReturnPressedEvent(Method(:FindValueAction))
			}
			oLayout1 = new qHBoxLayout()
			{
			addWidget(oLblFindWhat)
				addWidget(oSearchValue)
			}		
			oLblReplaceWith = new qLabel(win)
			{
				setText(T_GD_FS_REPLACEWITH)
			}
			oReplaceValue = new qlineedit(win)
			{
				setText(cReplaceText)
			}
			oLayout2 = new qHBoxLayout()
			{
				addWidget(oLblReplaceWith)
				addWidget(oReplaceValue)
			}

			oSearchCase = new qCheckbox(win)
			{
				setText(T_GD_FS_CASESENSITIVE)
			}
			oLayout3 = new qHBoxLayout()
			{
				addWidget(oSearchCase)			
			}

			oLblResults = new qLabel(win)
			{
				setText(T_GD_FS_RESULTS)
			}
			oListResult = new qListWidget(win) {
				setCurrentItemChangedEvent( Method(:ItemSelectedAction) )
			}
			oLayout4 = new qHBoxLayout()
			{
				addWidget(oLblResults)
				addWidget(oListResult)
			}

			oBtnFind = new qPushButton(win)
			{
				setText(T_GD_FS_SEARCH)
				setclickevent(Method(:FindValueAction))
			}
			oBtnReplace = new qPushButton(win)
			{
				setText(T_GD_FS_REPLACE)
				setclickevent(Method(:ReplaceAction))
			}
			oBtnReplaceAll = new qPushButton(win)
			{
				setText(T_GD_FS_REPLACEALL)
				setclickevent(Method(:ReplaceAllAction))
			}
			oBtnClose = new qPushButton(win)
			{
				setText(T_GD_FS_CLOSE)
				setclickevent(Method(:CloseAction))
			}
			oLayout5 = new qHBoxLayout()
			{
				addWidget(oBtnFind)
				addWidget(oBtnReplace)
				addWidget(oBtnReplaceAll)
				addWidget(oBtnClose)
			}
			oLayout6 = new qVBoxLayout()
			{
				AddLayout(oLayout1)
				AddLayout(oLayout2)
				AddLayout(oLayout3)
				AddLayout(oLayout4)
				AddLayout(oLayout5)
			}

			setLayout(oLayout6)

			setWindowTitle(T_GD_FS_FINDREPLACE)		
			setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 

			oSearchFilter = new qallevents(win)
			oSearchFilter.setKeyPressEvent(Method(:SearchKeyPressAction))								
			installeventfilter(oSearchFilter)

		}


