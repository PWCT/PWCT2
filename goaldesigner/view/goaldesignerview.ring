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
				setstylesheet(this.StepsTreeStyle())
				if not PWCTIsMobile(:StepsTreeIndentation) {
					setindentation(C_STEPSTREE_INDENTATION)
				}
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
		/*
		if not PWCTIsMobile(:DisplayPrintButton) {
			btnPrintSteps = new qPushButton(win) {
				setToolTip(T_GD_PRINTSTEPS)
				setClickEvent(Method(:PrintStepsAction))	
				self.mobileButtonSize(btnPrintSteps)		
			}
			setBtnImage(btnPrintSteps,AppFile("images/print.png"))
		}
		*/
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
		setBtnImage(btnModify,AppFile("images/edit.png"))
		if not PWCTIsMobile(:TimeMachineLabel) {
			labelTM = new qLabel(win) { setText(T_GD_THETIMEMACHINE) } # "The Time Machine"
		}
		btnPlay = new qPushButton(win) { # "Play As Movie"
			self.mobileButtonSize(btnPlay)
			if PWCTIsMobile(:PlayAsMovieWidth) {
				setMinimumwidth(200)	
			}
			setClickEvent(Method(:PlayMovie))
		}
		timerTM = new qTimer(win) {
			setinterval(2000)
			settimeoutevent(Method(:PlayMovieTimer))
			stop()
		}
		setBtnImage(btnPlay,AppFile("images/playmovie.png"))	
		layoutTimeMachine = new qHBoxLayout()
		{	
			if not PWCTIsMobile(:TimeMachineLabel) {
				AddWidget(LabelTM)
			}
			AddWidget(btnPlay)
			AddWidget(sliderTimeMachine)
			if PWCTIsMobile(:GoalDesignerFullScreen) {
				btnMax = new qPushButton(win) {
					setClickEvent(Method(:FullScreen))
				}
				setBtnImage(btnMax,AppFile("images/fullscreen.png"))
				AddWidget(btnMax)
			}
		}
		layoutVPages = new qVBoxLayout()
		if C_PROPERTIES_REMOVEVERTICALSPACESBETWEENINTERACTIONPAGES {
			layoutVPages.insertStretch( -1, 1 )
		}
		layoutCB = new qVBoxLayout()
		widgetCB = new qWidget() {
			setLayout(layoutCB)
			hide()
		}
		widgetVPages = new qWidget() {
			setLayout(layoutVPages)
			hide()
		}
		oVPagesScroll = new qScrollArea(null) {
			setWidget(widgetVPages)
			setwidgetresizable(True)
			setminimumwidth(300)
			Hide()
		}

		oSplitter = new qSplitter(win) {
			AddWidget(oTab)
			AddWidget(widgetCB)
			//AddWidget(widgetVPages)
			AddWidget(oVPagesScroll)
		}		

		layoutVBtns = new qVBoxLayout()
		{	
			if not PWCTIsMobile(:GoalDesignerButtons) {
				AddWidget(btnAddStep)
				AddWidget(btnInteract)		
				AddWidget(btnModify)		
				AddWidget(btnDeleteStep)
				AddWidget(btnMoveStepUp)
				AddWidget(btnMoveStepDown)
				AddWidget(btnIncreaseSize)
				AddWidget(btnDecreaseSize)
				AddWidget(btnIgnore)
				AddWidget(btnCutSteps)
				AddWidget(btnCopySteps)
				AddWidget(btnPasteSteps)
				AddWidget(btnSearch)
			else 
				AddWidget(btnAddStep)
				AddWidget(btnInteract)		
				AddWidget(btnModify)		
				AddWidget(btnDeleteStep)
				AddWidget(btnMoveStepUp)
				AddWidget(btnMoveStepDown)
				AddWidget(btnIgnore)
			}
			/*
			if not PWCTIsMobile(:DisplayPrintButton) {
				AddWidget(btnPrintSteps)		
			}
			*/
			insertStretch( -1, 1 )
			setContentsMargins(0,0,0,0)
		}
		oButtonsScrollWidget = new qWidget() {
			setLayout(layoutVBtns)
		}
		oButtonsScroll = new qScrollArea(null) {
			setFrameShape(QFrame_NoFrame)
			if PWCTIsMobile(:GoalDesignerButtonsSize) {
				setMaximumwidth(145)
			else
				setMaximumwidth(40)
			}
			setWidget(oButtonsScrollWidget)
			setwidgetresizable(True)
			setHorizontalScrollBarPolicy(Qt_ScrollBarAlwaysOff)
		}

		layoutRegion = new qHBoxLayout() {
			AddWidget(oButtonsScroll)
			AddWidget(oSplitter)
		}
		layout1 = new qVBoxLayout()
		{	
			AddLayout(layoutTimeMachine)
			AddLayout(layoutRegion)
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

	func StepsTreeStyle
		cStepsTreeStyle =	"QTreeWidget { selection-color:"+
			C_STEPSTREE_SELECTIONCOLOR+
				"; selection-background-color:"+
				C_STEPSTREE_SELECTIONBACKGROUND+
				"; background-color: " + 
				C_STEPSTREE_BACKCOLOR+
				"; }" 
		if C_STEPSTREE_SHOWLINES { 
			if PWCTIsMobile(:GoalDesignerStepsTreeLines) {
				cStepsTreeStyle += "
				QTreeWidget::branch:has-siblings:!adjoins-item {
				    border-image: url(:/images/stylesheet-vline.png) 0 ;
				}
				QTreeWidget::branch:has-siblings:adjoins-item {
				    border-image: url(:/images/stylesheet-branch-more.png) 0 ;
				}
				QTreeWidget::branch:!has-children:!has-siblings:adjoins-item {
				    border-image: url(:/images/stylesheet-branch-end.png) 0;
				}
				QTreeWidget::branch:has-children:!has-siblings:closed,
				QTreeWidget::branch:closed:has-children:has-siblings {
				        border-image: none;
				        image: url(:/images/stylesheet-branch-closed.png);
				}
				QTreeWidget::branch:open:has-children:!has-siblings,
				QTreeWidget::branch:open:has-children:has-siblings  {
				        border-image: none;
				        image: url(:/images/stylesheet-branch-open.png);
				}
				"
			else	
				cStepsTreeStyle += "
				QTreeWidget::branch:has-siblings:!adjoins-item {
				    border-image: url(images/stylesheet-vline.png) 0 ;
				}
				QTreeWidget::branch:has-siblings:adjoins-item {
				    border-image: url(images/stylesheet-branch-more.png) 0 ;
				}
				QTreeWidget::branch:!has-children:!has-siblings:adjoins-item {
				    border-image: url(images/stylesheet-branch-end.png) 0;
				}
				QTreeWidget::branch:has-children:!has-siblings:closed,
				QTreeWidget::branch:closed:has-children:has-siblings {
				        border-image: none;
				        image: url(images/stylesheet-branch-closed.png);
				}
				QTreeWidget::branch:open:has-children:!has-siblings,
				QTreeWidget::branch:open:has-children:has-siblings  {
				        border-image: none;
				        image: url(images/stylesheet-branch-open.png);
				}
				"
			}
		}
		return cStepsTreeStyle


	func StepsTreeWhiteAndBlackStyle nFontSize
		return	'QTreeWidget { color: black; font-size: '+nFontSize+'pt  } '+
						'QTreeWidget::!active { selection-background-color:rgba(0,65,255,255) ; selection-color:white; } ; ' 

	func CreateStepsTree oController
		oStepsTree = new StepsTreeView(oPageDesign) {
			setExpandsOnDoubleClick(False)
			setDoubleClickedEvent(oController.Method(:ModifyAction))
			setFocusPolicy(2)	# Support Keyboard keys like 'a' and 'z'
			//oTreeFilter = new qAllEvents(this.oStepsTree)
			//oTreeFilter.setKeyPressEvent(oController.Method(:TreeKeyPress))
			//oTreeFilter.setFocusInEvent(oController.Method(:ActivateWindowAction))
			installeventfilter(this.oTreeFilter)
			setstylesheet(this.StepsTreeStyle())
			setindentation(C_STEPSTREE_INDENTATION)
		}
		oPageDesignLayout.AddWidget(oStepsTree)
		oStepsTree.SetFocus(0)

	func MobileButtonSize oButton
		oButton {
			if PWCTIsMobile(:GoalDesignerButtonsSize) {
				setMinimumwidth(100)	
				setMinimumHeight(200)
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

	func PlayMovieIcon 
		setBtnImage(btnPlay,AppFile("images/playmovie.png"))	

	func StopMovieIcon
		setBtnImage(btnPlay,AppFile("images/stopmovie.png"))	

	
