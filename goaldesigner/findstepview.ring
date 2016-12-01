/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step View Class
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class FindStepView

	# The Search and Replace Text

		cSearchText = "" 
		cReplaceText = ""

	# Create the window and the Controls

		win = new qWidget()
		{
			oLblFindWhat = new qLabel(win)
			{
				setText("Find What : ")
			}
			oSearchValue = new qlineedit(win)
			{
				setText(cSearchText)
				setReturnPressedEvent(Method("FindValueAction()"))
			}
			oLayout1 = new qHBoxLayout()
			{
			addWidget(oLblFindWhat)
				addWidget(oSearchValue)
			}		
			oLblReplaceWith = new qLabel(win)
			{
				setText("Replace with ")
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
				setText("Case Sensitive")
			}
			oLayout3 = new qHBoxLayout()
			{
				addWidget(oSearchCase)			
			}

			oLblResults = new qLabel(win)
			{
				setText("Results")
			}
			oListResult = new qlistwidget(win)
			oLayout4 = new qHBoxLayout()
			{
				addWidget(oLblResults)
				addWidget(oListResult)
			}

			oBtnFind = new qPushButton(win)
			{
				setText("Find/Find Next")
				setclickevent(Method("FindValueAction()"))
			}
			oBtnReplace = new qPushButton(win)
			{
				setText("Replace")
				setclickevent(Method("ReplaceAction()"))
			}
			oBtnReplaceAll = new qPushButton(win)
			{
				setText("Replace All")
				setclickevent(Method("ReplaceAllAction()"))
			}
			oBtnClose = new qPushButton(win)
			{
				setText("Close")
				setclickevent(Method("CloseAction()"))
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

			setwinicon(win,"images/search.png")
			setWindowTitle("Find/Replace")		
			setStyleSheet("background-color:white;")
			setFixedsize(550,160)
			setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 

			oSearchFilter = new qallevents(win)
			oSearchFilter.setKeyPressEvent(Method("SearchKeyPressAction()"))								
			installeventfilter(oSearchFilter)

		}

	func Close
		win.close()
