/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step View Class
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class PrintStepsView

	# Create the window and the Controls

		win = new qWidget()
		{

			oPageSteps = new qWidget() {
				oStepsTree = new qTextEdit(oPageSteps)
				oPageDesignLayout = new qVBoxLayout() {
					AddWidget(oStepsTree)
				}
				SetLayout(oPageDesignLayout)
			}
			oPageCode = new qWidget() {
				oStepsCode = new qTextEdit(oPageCode)  
				oPageCodeLayout= new qVBoxLayout() {
					AddWidget(oStepsCode)
				}
				SetLayout(oPageCodeLayout)
			}		

			oTab = new qtabwidget(win) {
				InsertTab(0,oPageSteps,"Steps Tree")
				InsertTab(1,oPageCode,"Source Code")
			}

			layout1 = new qHBoxLayout() {
				btnClose = new qPushButton(win) {
					setText("Close")
					setClickEvent(Method(:CloseAction))
				}
				AddWidget(btnClose)
			}

			layout2 = new qVBoxLayout()
			{					
				AddWidget(oTab)
				AddLayout(Layout1)
			}			

			SetLayout(Layout2)
			resize(600,500)
			setWindowTitle("Print Steps")		
			setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 

		}

	func Close
		win.close()
