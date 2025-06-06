/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	: Components Browser View Class
**	Date 		: 2017.02.01
**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentsBrowserView from WindowsViewParent

	# Create the window and the Controls

		win = new qWidget()
		{
			setLayoutDirection(T_LAYOUTDIRECTION)
			olabelSearch = new qLabel(win) {
				SetText(T_CB_SEARCH) 	# "Search"
			}
			oTextSearch = new qLineEdit(win) {
				setTextEditedEvent( Method( :SearchAction ) )
				oTextFilter = new qallevents(oTextSearch)
				oTextFilter.setKeyPressEvent(Method(:EnterPressAction))								
				installeventfilter(oTextFilter)
			}
			olayoutSearch = new qHBoxLayout() {
				AddWidget(olabelSearch)
				AddWidget(oTextSearch)
			}

			oComponentsTree = new ComponentsTreeView(win) {
				setdoubleClickedEvent(Method(:OpenSelected))
				oTreeFilter = new qAllEvents(oStepsTree)
				oTreeFilter.setKeyPressEvent(Method(:TreeKeyPress))
				installeventfilter(oTreeFilter)
			}

			oBtnSelect = new qPushButton(win)
			{
				setText(T_CB_SELECT)
				setclickevent(Method(:OpenSelected))
			}
			oBtnClose = new qPushButton(win)
			{
				setText(T_CB_CLOSE)
				setclickevent(Method(:CloseAction))
			}
			if not T_LAYOUTDIRECTION {
				setBtnImage(oBtnSelect,AppFile("images/ipok.png"))
				setBtnImage(oBtnClose,AppFile("images/ipclose.png"))
			}
			oLayoutButtons = new qHBoxLayout()
			{
				addWidget(oBtnSelect)
				addWidget(oBtnClose)
			}
			olayoutAll = new qVBoxLayout() {
				AddLayout(oLayoutSearch)
				AddWidget(oComponentsTree)
				AddLayout(oLayoutButtons)
			}
			SetLayout(oLayoutAll)
			setWindowTitle(T_CB_COMPONENTSBROWSER)		
			setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 

			oWinFilter = new qallevents(win)
			oWinFilter.setKeyPressEvent(Method(:KeyPressAction))								
			installeventfilter(oWinFilter)

			if ! PWCTIsMobile(:ComponentsBrowserOkCancel) {
				oBtnSelect.hide()
				oBtnClose.hide()
			}

		}

