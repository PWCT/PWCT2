/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer View Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerView from WindowsViewParent

	# Create the window and the Controls

	win = new qWidget() {
		setLayoutDirection(T_LAYOUTDIRECTION)
		setWindowTitle(T_GD_GOALDESIGNER)
		oPageDesign = new qWidget() {
			oStepsTree = new StepsTreeView(oPageDesign) {
				setExpandsOnDoubleClick(False)
				setDoubleClickedEvent(Method(:ModifyAction))
				//setCurrentItemChangedEvent(Method(:TreeNodeChangedAction))
				setFocusPolicy(2)	# Support Keyboard keys like 'a' and 'z'
				oTreeFilter = new qAllEvents(oStepsTree)
				oTreeFilter.setKeyPressEvent(Method(:TreeKeyPress))
				# We are adding this here (not in the window win)
				# Because In window while inside dockable windows, doesn't work
				oTreeFilter.setFocusInEvent(Method(:ActivateWindowAction))
				installeventfilter(oTreeFilter)
				setstylesheet("selection-color:black; selection-background-color:cyan;")
			}
			oPageDesignLayout = new qVBoxLayout() {
				AddWidget(oStepsTree)
			}
			SetLayout(oPageDesignLayout)
		}
		oPageCode = new qWidget() {
			oStepCode = new StepCodeView(oPageCode)  {
				setTextChangedEvent(Method(:StepCodeChangedAction))
			}
			oPageCodeLayout= new qVBoxLayout() {
				AddWidget(oStepCode)
			}
			SetLayout(oPageCodeLayout)
		}		
		oTab = new qtabwidget(win) {
			InsertTab(0,oPageDesign,T_GD_DESIGN)
			InsertTab(1,oPageCode,T_GD_STEPCODE)
			setCurrentChangedEvent(Method(:StepChangedAction)) 			
		}
		btnAddStep = new qPushButton(win) {
			setToolTip(T_GD_NEWSTEP)
			setClickEvent(Method(:AddStepAction))
			self.MobileButtonSize(btnAddStep)
		}
		setBtnImage(btnAddStep,AppFile("images/new.png"))
		btnEditStep = new qPushButton(win) {
			setToolTip(T_GD_EDITSTEP)
			setClickEvent(Method(:EditStepAction))			
			self.MobileButtonSize(btnEditStep)
		}		
		setBtnImage(btnEditStep,AppFile("images/edit.png"))
		btnDeleteStep = new qPushButton(win) {
			setToolTip(T_GD_DELETESTEP)
			setClickEvent(Method(:DeleteStepAction))			
			self.mobileButtonSize(btnDeleteStep)
		}
		setBtnImage(btnDeleteStep,AppFile("images/delete.png"))
		btnMoveStepUp = new qPushButton(win) {
			setToolTip(T_GD_MOVEUP)
			setClickEvent(Method(:MoveStepUpAction))	
			self.mobileButtonSize(btnMoveStepUp)	
		}
		setBtnImage(btnMoveStepUp,AppFile("images/up.png"))
		btnMoveStepDown = new qPushButton(win) {
			setToolTip(T_GD_MOVEDOWN)
			setClickEvent(Method(:MoveStepDownAction))	
			self.mobileButtonSize(btnMoveStepDown)		
		}
		setBtnImage(btnMoveStepDown,AppFile("images/down.png"))
		btnPrintSteps = new qPushButton(win) {
			setToolTip(T_GD_PRINTSTEPS)
			setClickEvent(Method(:PrintStepsAction))	
			self.mobileButtonSize(btnPrintSteps)		
		}
		setBtnImage(btnPrintSteps,AppFile("images/print.png"))
		btnCutSteps = new qPushButton(win) {
			setToolTip(T_GD_CUT)
			setClickEvent(Method(:CutStepsAction))	
			self.mobileButtonSize(btnCutSteps)		
		}
		setBtnImage(btnCutSteps,AppFile("images/cut.png"))
		btnCopySteps = new qPushButton(win) {
			setToolTip(T_GD_COPY)
			setClickEvent(Method(:CopyStepsAction))	
			self.mobileButtonSize(btnCopySteps)		
		}
		setBtnImage(btnCopySteps,AppFile("images/copy.png"))
		btnPasteSteps = new qPushButton(win) {
			setToolTip(T_GD_PASTE)
			setClickEvent(Method(:PasteStepsAction))	
			self.mobileButtonSize(btnPasteSteps)		
		}
		setBtnImage(btnPasteSteps,AppFile("images/paste.png"))
		btnIncreaseSize = new qPushButton(win) {
			setToolTip(T_GD_INCERASESIZE)
			setClickEvent(Method(:IncreaseSizeAction))
			self.mobileButtonSize(btnIncreaseSize)			
		}
		setBtnImage(btnIncreaseSize,AppFile("images/zoomin.png"))
		btnDecreaseSize = new qPushButton(win) {
			setToolTip(T_GD_DECREASESIZE)
			setClickEvent(Method(:DecreaseSizeAction))
			self.mobileButtonSize(btnDecreaseSize)			
		}
		setBtnImage(btnDecreaseSize,AppFile("images/zoomout.png"))
		btnSearch = new qPushButton(win) {
			setToolTip(T_GD_SEARCH)
			setClickEvent(Method(:SearchAction))			
			self.mobileButtonSize(btnSearch)
		}
		setBtnImage(btnSearch,AppFile("images/search.png"))
		btnIgnore = new qPushButton(win) {
			setToolTip(T_GD_COMMENTUNCOMMENT)
			setClickEvent(Method(:IgnoreStepAction))
			self.mobileButtonSize(btnIgnore)	
		}
		setBtnImage(btnIgnore,AppFile("images/comments.png"))
		sliderTimeMachine = new TimeMachineView(win) {
			setValueChangedEvent(Method(:ChangeTimeMachinePointAction))
		}
		btnInteract = new qPushButton(win) {
			setToolTip(T_GD_INTERACT) 	# "Interact"
			setClickEvent(Method(:InteractAction))	
			self.mobileButtonSize(btnInteract)
		}
		setBtnImage(btnInteract,AppFile("images/interact.png"))
		btnModify = new qPushButton(win) {
			setToolTip(T_GD_MODIFY) 	# "Modify"
			setClickEvent(Method(:ModifyAction))	
			self.mobileButtonSize(btnModify)
		}		
		setBtnImage(btnModify,AppFile("images/modify.png"))	
		labelTM = new qLabel(win) { setText(T_GD_THETIMEMACHINE) } # "The Time Machine"
		layoutTimeMachine = new qHBoxLayout()
		{	
			AddWidget(LabelTM)
			AddWidget(sliderTimeMachine)
		}
		layoutVPages = new qVBoxLayout()
		layoutCB = new qVBoxLayout()
		widgetCB = new qWidget() {
			setLayout(layoutCB)
			hide()
		}
		widgetVPages = new qWidget() {
			setLayout(layoutVPages)
			hide()
		}
		oSplitter = new qSplitter(win) {
			AddWidget(oTab)
			AddWidget(widgetCB)
			AddWidget(widgetVPages)
		}		

 		if PWCTIsMobile(:GoalDesignerButtons) {

			layoutHBtns = new qHBoxLayout()
			{	
				AddWidget(btnAddStep)
				AddWidget(btnEditStep)
				AddWidget(btnDeleteStep)
				AddWidget(btnMoveStepUp)
				AddWidget(btnMoveStepDown)
				AddWidget(btnInteract)		
				AddWidget(btnModify)		
				AddWidget(btnIgnore)
				insertStretch( -1, 1 )
			}
			layoutHBtns2 = new qHBoxLayout()
			{	
				AddWidget(btnCutSteps)
				AddWidget(btnCopySteps)
				AddWidget(btnPasteSteps)
				AddWidget(btnIncreaseSize)
				AddWidget(btnDecreaseSize)
				AddWidget(btnSearch)
				AddWidget(btnPrintSteps)		
				insertStretch( -1, 1 )
			}
			layoutRegion = new qVBoxLayout() {
				AddLayout(layoutHBtns)
				AddLayout(layoutHBtns2)
				AddWidget(oSplitter)
			}
			layout1 = new qVBoxLayout()
			{	
				AddLayout(layoutTimeMachine)
				AddLayout(layoutRegion)
			}

		else
			layoutVBtns = new qVBoxLayout()
			{	
				AddWidget(btnAddStep)
				AddWidget(btnEditStep)
				AddWidget(btnDeleteStep)
				AddWidget(btnMoveStepUp)
				AddWidget(btnMoveStepDown)
				AddWidget(btnInteract)		
				AddWidget(btnModify)		
				AddWidget(btnIgnore)
				AddWidget(btnCutSteps)
				AddWidget(btnCopySteps)
				AddWidget(btnPasteSteps)
				AddWidget(btnIncreaseSize)
				AddWidget(btnDecreaseSize)
				AddWidget(btnSearch)
				AddWidget(btnPrintSteps)		
				insertStretch( -1, 1 )
			}
			layoutRegion = new qHBoxLayout() {
				AddLayout(layoutVBtns)
				AddWidget(oSplitter)
			}
			layout1 = new qVBoxLayout()
			{	
				AddLayout(layoutTimeMachine)
				AddLayout(layoutRegion)
			}

		}
		
		SetLayout(Layout1)
		/*
			We set the focus on the steps tree to enable setting the current item
			This is important after creating the Tabs
		*/
		oStepsTree.SetFocus(0)

		# KeyPress Event
			oFilter = new qAllEvents(win)
			oFilter.setKeyPressEvent(Method(:KeyPress))
			installeventfilter(oFilter)	

		# Timer to check output (For Mobile)
  		oCheckOutputOnMobileTimer = new qtimer(win) {
                        setinterval(1000)
                        settimeoutevent(Method(:CheckOutputOnMobile))
                        stop()
                }

	}

	

	func MobileButtonSize oButton
		oButton {
			if PWCTIsMobile(:GoalDesignerButtonsSize) {
				setMinimumwidth(100)	
				setMinimumHeight(100)
			}
		}


	/*
		The next method display the window and Maximize it
		Parameters : None
		Output : None
	*/

	func Show
		win { showMaximized() }


	/*
		Purpose : Fix drawing of items (Avoid Qt Bug)
	*/

	func FixDrawing 		
		oItem = oStepsTree.currentItem() 
		oStepsTree.collapseitem(oItem)
		oStepsTree.expanditem(oItem)
