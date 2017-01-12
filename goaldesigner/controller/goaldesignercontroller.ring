/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer Controller Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerController from WindowsBase

	oView = new GoalDesignerView
	oModel = new GoalDesignerModel
	oTMController = new TimeMachineController
	oVisualSourceFile = new VisualSourceFile

	func Start
		oView.Show()

	func AddStep cStepName
		oItem  = oView.oStepsTree.currentItem()
		nParentID = oView.oStepsTree.GetIDByObj(oItem)
 		nStepID = oModel.AddStep(nParentID,[
				:name = cStepName,
				:active = True , 
				:code = "" , 
			 	:interactionid = oModel.oInteractionModel.AddUserInteraction() ,
				:visible = True
			]
		)
		oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
		UpdateTheTimeMachine()

	func TimeMachineGotoPresent
		oTMController.TimeMachineGotoPresent(oView,oModel)

	func UpdateTheTimeMachine
		nInteractionsCount = oModel.oInteractionModel.InteractionsCount()
		oView.sliderTimeMachine.setInteractionPoints(nInteractionsCount)

	func AddStepAction
		TimeMachineGotoPresent()
		oInput = New QInputDialog(oView.win)
		{
			setwindowtitle(T_GD_NEWSTEP_ENTERSTEPNAME) # "Enter the step name?"
			setgeometry(100,100,400,50)
			setlabeltext(T_GD_NEWSTEP_STEPNAME)  # "Step Name"
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
			setwindowtitle(T_GD_NEWSTEP_ENTERSTEPNAME)
			setgeometry(100,100,400,50)
			setlabeltext(T_GD_NEWSTEP_STEPNAME)
			settextvalue(this.oModel.GetStepName(nStepID))
			lcheck = exec()
		}
		if lCheck  {
			cText = oInput.textvalue()
			oView.oStepsTree.editstep(oItem,cText,this.oModel.GetStepIgnoreStatus(nStepID))
			oModel.EditStepName(nStepID,cText)
		}		

	func DeleteStepAction
		new qmessagebox(oView.win)
		{
                		setwindowtitle(T_GD_DELETESTEP_DELETESTEP) #  "Delete Step"
                		settext(T_GD_DELETESTEP_AREYOUSURE) # "Are you sure?"
                		setInformativeText(T_GD_DELETESTEP_DOYOUWANT) # "Do you want to delete the step?"
                		setstandardbuttons(QMessageBox_Yes | QMessageBox_No)
                		result = exec()
		          this.oView.win {
                        		if result = QMessageBox_No {
					return 
                        		}
                		}
		}
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oView.oStepsTree.DelByObj(oItem)	# Remove it from the [oItem|ID] List
		oItem.parent().takechild(oItem.parent().indexofchild(oItem))
		oModel.DeleteStep(nStepID)
		# Update the Time Machine
			UpdateTheTimeMachine()

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
			oView.oStepsTree.SetCurrentItem(oItem,0)	
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
			oView.oStepsTree.SetCurrentItem(oItem,0)	
		}

	func PrintStepsAction
		Open_Window(:PrintStepsController)
		Last_Window().setParentObject(self)
		Last_Window().ShowData()

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
		# Time Machine - Present
			TimeMachineGotoPresent()
		oParentItem  = oView.oStepsTree.currentItem()
		nParentStepID = oView.oStepsTree.GetIDByObj(oParentItem)
		oModel.PasteStep(nParentStepID)
		oNewParentItem = oView.oStepsTree.PasteStep(oParentItem)
		# Update the [Object,StepID] List
			aStepsObjectsList = oView.oStepsTree.StepsList(oNewParentItem)
			aStepsDataList = oModel.GetBuffer()
			oView.oStepsTree.AddNodesFromBuffer(aStepsObjectsList,aStepsDataList)
		# Update the Time Machine
			UpdateTheTimeMachine()

	func IncreaseSizeAction
		oView.oStepsTree.IncreaseFontSize()
		oView.oStepCode.IncreaseFontSize()

	func DecreaseSizeAction
		oView.oStepsTree.DecreaseFontSize()
		oView.oStepCode.DecreaseFontSize()

	func IgnoreStepAction		
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nIgnore = oModel.IgnoreStep(nStepID)
		oView.oStepsTree.IgnoreStep(oItem,nIgnore)

	func StepChangedAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		# Check if it's the start point
			if nStepID = 1 {	# Avoid start point
				# Set the step code
					oView.oStepCode.setText("")
					oView.oStepCode.setEnabled(False)
				return
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

	func SearchAction
		Open_Window(:FindStepController)
		Last_Window().setParentObject(self)

	func ChangeTimeMachinePointAction
		oTMController.ChangeTimeMachinePoint(oView,oModel)

	func KeyPress
		#Puts( oView.oFilter.getkeycode() )
		nKey = oView.oFilter.getkeycode()
		switch nKey {
			case 61		# CTRL + +
				IncreaseSizeAction()
			case 45		# CTRL + -
				DecreaseSizeAction()
			case 70		# CTRL+F
				SearchAction()
			case 78		# CTRL+N
				AddStepAction()
			case 80		# CTRL+P
				PrintStepsAction()		
			case 16777223  	# DEL
				DeleteStepAction()
			case 69		# CTRL+E
				EditStepAction()
			case 67		# CTRL+C
				CopyStepsAction()
			case 73		# CTRL+I
				IgnoreStepAction()
			case 86		# CTRL+V
				PasteStepsAction()
			case 88		# CTRL+X
				CutStepsAction()
			case 85		# CTRL+U
				MoveStepUpAction()
			case 68		# CTRL+D
				MoveStepDownAction()

		}

	func SaveFileAction
		oVisualSourceFile.RemoveFile()
		oVisualSourceFile.Open()
		oVisualSourceFile.SetStepsTreeTable(oModel.oStepsTreeModel.GetData())
		oVisualSourceFile.SetInteractionsTable(oModel.oInteractionModel.GetData())
		oVisualSourceFile.SetStepsID(oModel.oStepsTreeModel.GetID())
		oVisualSourceFile.SetInteractionsID(oModel.oInteractionModel.GetID())
		oVisualSourceFile.CreateTables()
		oVisualSourceFile.SaveTables()
		oVisualSourceFile.Close()

	func LoadFileAction
		# Get Data From the Visual Source File
			oVisualSourceFile.Open()
			oVisualSourceFile.LoadTables()
			aStepsTree   =  oVisualSourceFile.GetStepsTreeTable()
			aInteractions =  oVisualSourceFile.GetInteractionsTable()
			oVisualSourceFile.Close()
		# Update Objects
			oModel.oStepsTreeModel.SetData(aStepsTree)
			oModel.oInteractionModel.SetData(aInteractions)
			oModel.oStepsTreeModel.SetID(oVisualSourceFile.GetStepsID())
			oModel.oInteractionModel.SetID(oVisualSourceFile.GetInteractionsID())
		# Remove the current Steps From the Tree Control
			oView.oStepsTree.taketoplevelitem(0)	
			oView.oStepsTree.aTree = []
			oView.oStepsTree.AddStartPoint()
		# Add Steps to the Tree
			for x = 2 to len(aStepsTree) {
				nStepID      = aStepsTree[x][1]
				nParentID   = aStepsTree[x][2]
				cStepName  = aStepsTree[x][3][:name]
				lIgnore = not aStepsTree[x][3][:active]
				oItem = oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)					
				oView.oStepsTree.IgnoreStep(oItem,lIgnore)
			}
		# Update the Time Machine
			UpdateTheTimeMachine()
