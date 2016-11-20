/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer Window
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"
load "guilib.ring"
load "globals.ring"
load "translation/english.ring"

load "goaldesigner/treemodel.ring"
load "goaldesigner/goaldesignermodel.ring"
load "goaldesigner/treecontrol.ring"
load "goaldesigner/stepstreeview.ring"
load "goaldesigner/htmlstyles.ring"
load "goaldesigner/stepcodeview.ring"

if filename()  = sysargv[2] {
	Test_GoalDesigner()
}

func Test_GoalDesigner

	new qApp {
		$objname = "$GoalDesigner"
		$GoalDesigner = new GoalDesignerController
		$GoalDesigner.Start()
		exec()
	}

class GoalDesignerController

	oView = new GoalDesignerView
	oModel = new GoalDesignerModel

	func Start
		oView.Show()

	func AddStep cStepName
		oItem  = oView.oStepsTree.currentItem()
		nParentID = oView.oStepsTree.GetIDByObj(oItem)
 		nStepID = oModel.AddStep(nParentID,[
				:name = cStepName,
				:active = True , 
				:code = "" , 
			 	:date = date() ,
				:time = time()
			]
		)
		oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)

	func AddStepAction
		oInput = New QInputDialog(oView.win)
		{
			setwindowtitle("Enter the step name?")
			setgeometry(100,100,400,50)
			setlabeltext("Step Name")
			settextvalue("")
			lcheck = exec()
		}
		if lCheck  {
			AddStep(oInput.textvalue())
		}
	
	func EditStepAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oInput = New QInputDialog(oView.win)
		{
			setwindowtitle("Enter the step name?")
			setgeometry(100,100,400,50)
			setlabeltext("Step Name")
			settextvalue(this.oModel.GetStepName(nStepID))
			lcheck = exec()
		}
		if lCheck  {
			cText = oInput.textvalue()
			oView.oStepsTree.editstep(oItem,cText,this.oModel.GetStepIgnoreStatus(nStepID))
			oModel.EditStepName(nStepID,cText)
		}		

	func DeleteStepAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oItem.parent().takechild(oItem.parent().indexofchild(oItem))
		oModel.DeleteStep(nStepID)

	func MoveStepUpAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oParent = oItem.Parent()
		nIndex = oParent.IndexofChild(oItem)
		if nIndex > 0 {	# Not The First Item
			oView.oStepsTree.SaveLabels(oItem)
			oParent.TakeChild(nIndex)
			oParent.InsertChild(nIndex-1,oItem)
			oView.oStepsTree.RestoreLabels(oItem,True)
			oParent.SetExpanded(True)
			oItem.SetExpanded(True)
			oModel.MoveStepUp(nStepID)	
		}

	func MoveStepDownAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oParent = oItem.Parent()
		nIndex = oParent.IndexofChild(oItem)
		if nIndex < oParent.ChildCount() - 1 { # Not the Last Item
			oView.oStepsTree.SaveLabels(oItem)
			oParent.TakeChild(nIndex)
			oParent.InsertChild(nIndex+1,oItem)
			oView.oStepsTree.RestoreLabels(oItem,True)
			oParent.SetExpanded(True)
			oItem.SetExpanded(True)	
			oModel.MoveStepDown(nStepID)	
		}

	func PrintStepsAction
		oModel.PrintSteps()

	func CutStepsAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oModel.CutStep(nStepID)
		oView.oStepsTree.SaveStep(oItem)
		oItem.parent().takechild(oItem.parent().indexofchild(oItem))

	func CopyStepsAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oModel.CopyStep(nStepID)
		oView.oStepsTree.SaveStep(oItem)

	func PasteStepsAction
		if oView.oStepsTree.isbuffernotempty() = false {
			return
		}
		oParentItem  = oView.oStepsTree.currentItem()
		nParentStepID = oView.oStepsTree.GetIDByObj(oParentItem)
		oModel.PasteStep(nParentStepID)
		oNewParentItem = oView.oStepsTree.PasteStep(oParentItem)
		# Update the Object|StepID List
			aStepsObjectsList = oView.oStepsTree.StepsList(oNewParentItem)
			aStepsDataList = oModel.GetBuffer()
			oView.oStepsTree.AddNodesFromBuffer(aStepsObjectsList,aStepsDataList)

	func IncreaseSizeAction
		oView.oStepsTree.IncreaseFontSize()
		oView.oStepCode.IncreaseFontSize()

	func DecreaseSizeAction
		oView.oStepsTree.DecreaseFontSize()
		oView.oStepCode.DecreaseFontSize()

	func IgnoreStepAction		
		# We uses if statement because CheckState() output = 2 when True
		if oView.checkIgnore.checkstate() { 
			nIgnore = True
		else
			nIgnore = False
		}
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		oModel.IgnoreStep(nStepID,nIgnore)
		oView.oStepsTree.IgnoreStep(oItem,nIgnore)

	func StepChangedAction
		if not oView.oStepsTree.isEnabled() {
			return
		}
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		# Check if it's the start point
			if nStepID = 1 {	# Avoid start point
				# Set Ignore Checkbox status
					oView.checkIgnore.setCheckstate(0)
				# Set the step code
					oView.oStepCode.setText("")
					oView.oStepCode.setEnabled(False)
				return
			}
		# Change the Ignore CheckBox Status
			if oModel.GetStepIgnoreStatus(nStepID) {
				oView.checkIgnore.setCheckstate(2)
			else
				oView.checkIgnore.setCheckstate(0)
			}	
		# Change the Step Code Value
			oView.oStepCode.setEnabled(True)
			oView.oStepCode.setText(oModel.GetStepCode(nStepID))

	func StepCodeChangedAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point			
			return
		}	
		oModel.SaveStepCode(nStepID,oView.oStepCode.ToPlainText())

class GoalDesignerView

	win = new qWidget() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
		oPageDesign = new qWidget() {
			oStepsTree = new StepsTreeView(oPageDesign) {
				setCurrentItemChangedEvent($objname+".StepChangedAction()") 			
			}
			oPageDesignLayout = new qVBoxLayout() {
				AddWidget(oStepsTree)
			}
			SetLayout(oPageDesignLayout)
		}
		oPageCode = new qWidget() {
			oStepCode = new StepCodeView(oPageCode)  {
				setTextChangedEvent($objname+".StepCodeChangedAction()")
			}
			oPageCodeLayout= new qVBoxLayout() {
				AddWidget(oStepCode)
			}
			SetLayout(oPageCodeLayout)
		}		
		oTab = new qtabwidget(win) {
			InsertTab(0,oPageDesign,"Steps Tree")
			InsertTab(1,oPageCode,"Step Code")
		}
		btnAddStep = new qPushButton(win) {
			setText("New Step")
			setClickEvent($objname+".AddStepAction()")			
		}
		setBtnImage(btnAddStep,"images/new.png")
		btnEditStep = new qPushButton(win) {
			setText("Edit Step")
			setClickEvent($objname+".EditStepAction()")			
		}		
		setBtnImage(btnEditStep,"images/edit.png")
		btnDeleteStep = new qPushButton(win) {
			setText("Delete Step")
			setClickEvent($objname+".DeleteStepAction()")			
		}
		setBtnImage(btnDeleteStep,"images/delete.png")
		btnMoveStepUp = new qPushButton(win) {
			setText("Move Up")
			setClickEvent($objname+".MoveStepUpAction()")			
		}
		setBtnImage(btnMoveStepUp,"images/up.png")
		btnMoveStepDown = new qPushButton(win) {
			setText("Move Down")
			setClickEvent($objname+".MoveStepDownAction()")			
		}
		setBtnImage(btnMoveStepDown,"images/down.png")
		btnPrintSteps = new qPushButton(win) {
			setText("Print Steps")
			setClickEvent($objname+".PrintStepsAction()")			
		}
		setBtnImage(btnPrintSteps,"images/print.png")
		btnCutSteps = new qPushButton(win) {
			setText("Cut")
			setClickEvent($objname+".CutStepsAction()")			
		}
		setBtnImage(btnCutSteps,"images/cut.png")
		btnCopySteps = new qPushButton(win) {
			setText("Copy")
			setClickEvent($objname+".CopyStepsAction()")			
		}
		setBtnImage(btnCopySteps,"images/copy.png")
		btnPasteSteps = new qPushButton(win) {
			setText("Paste")
			setClickEvent($objname+".PasteStepsAction()")			
		}
		setBtnImage(btnPasteSteps,"images/paste.png")
		btnIncreaseSize = new qPushButton(win) {
			setText("Increase Size")
			setClickEvent($objname+".IncreaseSizeAction()")			
		}
		setBtnImage(btnIncreaseSize,"images/zoomin.png")
		btnDecreaseSize = new qPushButton(win) {
			setText("Decrease Size")
			setClickEvent($objname+".DecreaseSizeAction()")			
		}
		setBtnImage(btnDecreaseSize,"images/zoomout.png")
		checkIgnore = new qCheckBox(win) {
			setText("x")
			setstateChangedEvent($objname+".IgnoreStepAction()")		
		}
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
			AddWidget(checkIgnore)
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

