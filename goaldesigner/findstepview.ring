/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step View Class
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


class FindStepView

	win

	cSearchText = "" 
	cReplaceText = ""

	func show

		win = new qWidget()
		{
			oLblFindWhat = new qLabel(this.win)
			{
				setText("Find What : ")
			}
			oSearchValue = new qlineedit(this.win)
			{
				setText(this.cSearchText)
				setReturnPressedEvent("pFindValue()")
			}
			oLayout1 = new qHBoxLayout()
			{
			addWidget(oLblFindWhat)
				addWidget(oSearchValue)
			}		
			oLblReplaceWith = new qLabel(this.win)
			{
				setText("Replace with ")
			}
			oReplaceValue = new qlineedit(this.win)
			{
				setText(this.cReplaceText)
			}
	
			oLayout2 = new qHBoxLayout()
			{
				addWidget(oLblReplaceWith)
				addWidget(oReplaceValue)
			}
			oSearchCase = new qCheckbox(this.win)
			{
				setText("Case Sensitive")
			}
			oLayout3 = new qHBoxLayout()
			{
				addWidget(oSearchCase)			
			}
			oBtnFind = new qPushButton(this.win)
			{
				setText("Find/Find Next")
				setclickevent("pFindValue()")
			}
			oBtnReplace = new qPushButton(this.win)
			{
				setText("Replace")
				setclickevent("pReplace()")
			}
			oBtnReplaceAll = new qPushButton(this.win)
			{
				setText("Replace All")
				setclickevent("pReplaceAll()")
			}
			oBtnClose = new qPushButton(this.win)
			{
				setText("Close")
				setclickevent($objname+".CloseAction()")
			}
			oLayout4 = new qHBoxLayout()
			{
				addWidget(oBtnFind)
				addWidget(oBtnReplace)
				addWidget(oBtnReplaceAll)
				addWidget(oBtnClose)
			}
			oLayout5 = new qVBoxLayout()
			{
				AddLayout(oLayout1)
				AddLayout(oLayout2)
				AddLayout(oLayout3)
				AddLayout(oLayout4)
			}

			setLayout(oLayout5)

			setwinicon(this.win,"images/search.png")
			setWindowTitle("Find/Replace")		
			setStyleSheet("background-color:white;")
			setFixedsize(550,160)
			setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 

			oSearchFilter = new qallevents(this.win)
			oSearchFilter.setKeyPressEvent("pSearchKeyPress()")								
			installeventfilter(oSearchFilter)

			show()
		}

	func Close
		win.close()
