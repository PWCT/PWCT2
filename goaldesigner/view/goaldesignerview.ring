/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer View Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerView

	win = new qWidget() {
		setLayoutDirection(T_LAYOUTDIRECTION)
		setWindowTitle(T_GD_GOALDESIGNER)
		oPageDesign = new qWidget() {
			oStepsTree = new StepsTreeView(oPageDesign)
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
			setText(T_GD_NEWSTEP)
			setClickEvent(Method(:AddStepAction))			
		}
		setBtnImage(btnAddStep,"images/new.png")
		btnEditStep = new qPushButton(win) {
			setText(T_GD_EDITSTEP)
			setClickEvent(Method(:EditStepAction))			
		}		
		setBtnImage(btnEditStep,"images/edit.png")
		btnDeleteStep = new qPushButton(win) {
			setText(T_GD_DELETESTEP)
			setClickEvent(Method(:DeleteStepAction))			
		}
		setBtnImage(btnDeleteStep,"images/delete.png")
		btnMoveStepUp = new qPushButton(win) {
			setText(T_GD_MOVEUP)
			setClickEvent(Method(:MoveStepUpAction))		
		}
		setBtnImage(btnMoveStepUp,"images/up.png")
		btnMoveStepDown = new qPushButton(win) {
			setText(T_GD_MOVEDOWN)
			setClickEvent(Method(:MoveStepDownAction))			
		}
		setBtnImage(btnMoveStepDown,"images/down.png")
		btnPrintSteps = new qPushButton(win) {
			setText(T_GD_PRINTSTEPS)
			setClickEvent(Method(:PrintStepsAction))			
		}
		setBtnImage(btnPrintSteps,"images/print.png")
		btnCutSteps = new qPushButton(win) {
			setText(T_GD_CUT)
			setClickEvent(Method(:CutStepsAction))			
		}
		setBtnImage(btnCutSteps,"images/cut.png")
		btnCopySteps = new qPushButton(win) {
			setText(T_GD_COPY)
			setClickEvent(Method(:CopyStepsAction))			
		}
		setBtnImage(btnCopySteps,"images/copy.png")
		btnPasteSteps = new qPushButton(win) {
			setText(T_GD_PASTE)
			setClickEvent(Method(:PasteStepsAction))			
		}
		setBtnImage(btnPasteSteps,"images/paste.png")
		btnIncreaseSize = new qPushButton(win) {
			setText(T_GD_INCERASESIZE)
			setClickEvent(Method(:IncreaseSizeAction))			
		}
		setBtnImage(btnIncreaseSize,"images/zoomin.png")
		btnDecreaseSize = new qPushButton(win) {
			setText(T_GD_DECREASESIZE)
			setClickEvent(Method(:DecreaseSizeAction))			
		}
		setBtnImage(btnDecreaseSize,"images/zoomout.png")
		btnSearch = new qPushButton(win) {
			setText(T_GD_SEARCH)
			setClickEvent(Method(:SearchAction))			
		}
		setBtnImage(btnSearch,"images/search.png")
		btnIgnore = new qPushButton(win) {
			setText(T_GD_COMMENTUNCOMMENT)
			setClickEvent(Method(:IgnoreStepAction))	
		}
		setBtnImage(btnIgnore,"images/comments.png")
		layoutBtns = new qHBoxLayout()
		{	
			AddWidget(btnAddStep)
			AddWidget(btnEditStep)
			AddWidget(btnDeleteStep)
			AddWidget(btnMoveStepUp)
			AddWidget(btnMoveStepDown)
			AddWidget(btnPrintSteps)
			AddWidget(btnCutSteps)
			AddWidget(btnCopySteps)
			AddWidget(btnPasteSteps)
			AddWidget(btnIncreaseSize)
			AddWidget(btnDecreaseSize)
			AddWidget(btnSearch)
			AddWidget(btnIgnore)
		}
		sliderTimeMachine = new TimeMachineView(win) {
			setValueChangedEvent(Method(:ChangeTimeMachinePointAction))
		}
		btnSaveFile = new qPushButton(win) {
			setText("Save File")
			setClickEvent(Method(:SaveFileAction))	
		}
		btnLoadFile = new qPushButton(win) {
			setText("Load File")
			setClickEvent(Method(:LoadFileAction))	
		}
		layoutTimeMachine = new qHBoxLayout()
		{	
			AddWidget(btnSaveFile)
			AddWidget(btnLoadFile)
			AddWidget(sliderTimeMachine)
		}
		layout1 = new qVBoxLayout()
		{	
			AddLayout(layoutBtns)
			AddLayout(layoutTimeMachine)
			AddWidget(oTab)
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

