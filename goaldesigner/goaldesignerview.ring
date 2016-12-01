/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer View Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerView

	win = new qWidget() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
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
			InsertTab(0,oPageDesign,"Design")
			InsertTab(1,oPageCode,"Step Code")
			setCurrentChangedEvent(Method(:StepChangedAction)) 			
		}
		btnAddStep = new qPushButton(win) {
			setText("New Step")
			setClickEvent(Method(:AddStepAction))			
		}
		setBtnImage(btnAddStep,"images/new.png")
		btnEditStep = new qPushButton(win) {
			setText("Edit Step")
			setClickEvent(Method(:EditStepAction))			
		}		
		setBtnImage(btnEditStep,"images/edit.png")
		btnDeleteStep = new qPushButton(win) {
			setText("Delete Step")
			setClickEvent(Method(:DeleteStepAction))			
		}
		setBtnImage(btnDeleteStep,"images/delete.png")
		btnMoveStepUp = new qPushButton(win) {
			setText("Move Up")
			setClickEvent(Method(:MoveStepUpAction))		
		}
		setBtnImage(btnMoveStepUp,"images/up.png")
		btnMoveStepDown = new qPushButton(win) {
			setText("Move Down")
			setClickEvent(Method(:MoveStepDownAction))			
		}
		setBtnImage(btnMoveStepDown,"images/down.png")
		btnPrintSteps = new qPushButton(win) {
			setText("Print Steps")
			setClickEvent(Method(:PrintStepsAction))			
		}
		setBtnImage(btnPrintSteps,"images/print.png")
		btnCutSteps = new qPushButton(win) {
			setText("Cut")
			setClickEvent(Method(:CutStepsAction))			
		}
		setBtnImage(btnCutSteps,"images/cut.png")
		btnCopySteps = new qPushButton(win) {
			setText("Copy")
			setClickEvent(Method(:CopyStepsAction))			
		}
		setBtnImage(btnCopySteps,"images/copy.png")
		btnPasteSteps = new qPushButton(win) {
			setText("Paste")
			setClickEvent(Method(:PasteStepsAction))			
		}
		setBtnImage(btnPasteSteps,"images/paste.png")
		btnIncreaseSize = new qPushButton(win) {
			setText("Increase Size")
			setClickEvent(Method(:IncreaseSizeAction))			
		}
		setBtnImage(btnIncreaseSize,"images/zoomin.png")
		btnDecreaseSize = new qPushButton(win) {
			setText("Decrease Size")
			setClickEvent(Method(:DecreaseSizeAction))			
		}
		setBtnImage(btnDecreaseSize,"images/zoomout.png")
		btnSearch = new qPushButton(win) {
			setText("Search")
			setClickEvent(Method(:SearchAction))			
		}
		setBtnImage(btnSearch,"images/search.png")
		btnIgnore = new qPushButton(win) {
			setText("Comment/UnComment")
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
		layout1 = new qVBoxLayout()
		{	
			AddLayout(layoutBtns)
			AddWidget(oTab)
		}		
		SetLayout(Layout1)
		/*
			We set the focus on the steps tree to enable setting the current item
			This is important after creating the Tabs
		*/
		oStepsTree.SetFocus(0)
	}

	func Show
		win { showMaximized() }

