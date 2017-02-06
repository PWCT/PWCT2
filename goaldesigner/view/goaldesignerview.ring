/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer View Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerView from WindowsViewParent

	win = new qWidget() {
		setLayoutDirection(T_LAYOUTDIRECTION)
		setWindowTitle(T_GD_GOALDESIGNER)
		oPageDesign = new qWidget() {
			oStepsTree = new StepsTreeView(oPageDesign) {
				setDoubleClickedEvent(Method(:ModifyAction))
				setCurrentItemChangedEvent(Method(:TreeNodeChangedAction))
				setFocusPolicy(2)	# Support Keyboard keys like 'a' and 'z'
				oTreeFilter = new qAllEvents(oStepsTree)
				oTreeFilter.setKeyPressEvent(Method(:TreeKeyPress))
				installeventfilter(oTreeFilter)
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
		}
		setBtnImage(btnAddStep,"images/new.png")
		btnEditStep = new qPushButton(win) {
			setToolTip(T_GD_EDITSTEP)
			setClickEvent(Method(:EditStepAction))			
		}		
		setBtnImage(btnEditStep,"images/edit.png")
		btnDeleteStep = new qPushButton(win) {
			setToolTip(T_GD_DELETESTEP)
			setClickEvent(Method(:DeleteStepAction))			
		}
		setBtnImage(btnDeleteStep,"images/delete.png")
		btnMoveStepUp = new qPushButton(win) {
			setToolTip(T_GD_MOVEUP)
			setClickEvent(Method(:MoveStepUpAction))		
		}
		setBtnImage(btnMoveStepUp,"images/up.png")
		btnMoveStepDown = new qPushButton(win) {
			setToolTip(T_GD_MOVEDOWN)
			setClickEvent(Method(:MoveStepDownAction))			
		}
		setBtnImage(btnMoveStepDown,"images/down.png")
		btnPrintSteps = new qPushButton(win) {
			setToolTip(T_GD_PRINTSTEPS)
			setClickEvent(Method(:PrintStepsAction))			
		}
		setBtnImage(btnPrintSteps,"images/print.png")
		btnCutSteps = new qPushButton(win) {
			setToolTip(T_GD_CUT)
			setClickEvent(Method(:CutStepsAction))			
		}
		setBtnImage(btnCutSteps,"images/cut.png")
		btnCopySteps = new qPushButton(win) {
			setToolTip(T_GD_COPY)
			setClickEvent(Method(:CopyStepsAction))			
		}
		setBtnImage(btnCopySteps,"images/copy.png")
		btnPasteSteps = new qPushButton(win) {
			setToolTip(T_GD_PASTE)
			setClickEvent(Method(:PasteStepsAction))			
		}
		setBtnImage(btnPasteSteps,"images/paste.png")
		btnIncreaseSize = new qPushButton(win) {
			setToolTip(T_GD_INCERASESIZE)
			setClickEvent(Method(:IncreaseSizeAction))			
		}
		setBtnImage(btnIncreaseSize,"images/zoomin.png")
		btnDecreaseSize = new qPushButton(win) {
			setToolTip(T_GD_DECREASESIZE)
			setClickEvent(Method(:DecreaseSizeAction))			
		}
		setBtnImage(btnDecreaseSize,"images/zoomout.png")
		btnSearch = new qPushButton(win) {
			setToolTip(T_GD_SEARCH)
			setClickEvent(Method(:SearchAction))			
		}
		setBtnImage(btnSearch,"images/search.png")
		btnIgnore = new qPushButton(win) {
			setToolTip(T_GD_COMMENTUNCOMMENT)
			setClickEvent(Method(:IgnoreStepAction))	
		}
		setBtnImage(btnIgnore,"images/comments.png")
		sliderTimeMachine = new TimeMachineView(win) {
			setValueChangedEvent(Method(:ChangeTimeMachinePointAction))
		}
		btnInteract = new qPushButton(win) {
			setToolTip(T_GD_INTERACT) 	# "Interact"
			setClickEvent(Method(:InteractAction))	
		}
		setBtnImage(btnInteract,"images/interact.png")
		btnModify = new qPushButton(win) {
			setToolTip(T_GD_MODIFY) 	# "Modify"
			setClickEvent(Method(:ModifyAction))	
		}		
		setBtnImage(btnModify,"images/modify.png")		
		labelTM = new qLabel(win) { setText("The Time Machine") }
		layoutTimeMachine = new qHBoxLayout()
		{	
			AddWidget(LabelTM)
			AddWidget(sliderTimeMachine)
		}
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
			AddWidget(oTab)
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
	}

	func Show
		win { showMaximized() }

