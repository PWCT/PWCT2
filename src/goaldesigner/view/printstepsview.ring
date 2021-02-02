/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step View Class
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class PrintStepsView from WindowsViewParent

	# Create the window and the Controls

		win = new qWidget()
		{
			setLayoutDirection(T_LAYOUTDIRECTION)
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
				InsertTab(0,oPageSteps,T_GD_PS_STEPSTREE)
				InsertTab(1,oPageCode,T_GD_PS_SOURCECODE)
			}

			layout1 = new qHBoxLayout() {
				btnPrintStepsTree = new qPushButton(win) {
					setText(T_GD_PS_PRINTSTEPSTREE)
					setClickEvent(Method(:PrintStepsTreeAction))
				}
				btnPrintSourceCode = new qPushButton(win) {
					setText(T_GD_PS_PRINTSOURCECODE)
					setClickEvent(Method(:PrintSourceCodeAction))
				}
				btnClose = new qPushButton(win) {
					setText(T_GD_PS_CLOSE)
					setClickEvent(Method(:CloseAction))
				}
				AddWidget(btnPrintStepsTree)
				AddWidget(btnPrintSourceCode)
				AddWidget(btnClose)		
			}

			layout2 = new qVBoxLayout()
			{					
				AddWidget(oTab)
				AddLayout(Layout1)
			}			

			SetLayout(Layout2)
			resize(600,500)
			setWindowTitle(T_GD_PS_PRINTSTEP)		
			setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 

			oWinFilter = new qallevents(win)
			oWinFilter.setKeyPressEvent(Method(:KeyPressAction))								
			installeventfilter(oWinFilter)

		}

