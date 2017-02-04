/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer Controller Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerController from WindowsControllerParent

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
				:visible = True , 
				:stepnumber = 1 ,
				:steptype = C_STEPTYPE_COMMENT 
			]
		)
		SetStepColor(C_STEPTYPE_COMMENT)
		oItem = oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
		UpdateTheTimeMachine()
		return oItem

	func AddGeneratedInteraction cComponent
		return oModel.oInteractionModel.AddGeneratedInteraction(cComponent)

	func SaveVariablesValues nIID,cVariablesValues
		oModel.oInteractionModel.SaveVariablesValues(nIID,cVariablesValues)

	func AddGeneratedStep cStepName,nIID,nStepNumber,nStepType
		oItem  = oView.oStepsTree.currentItem()
		nParentID = oView.oStepsTree.GetIDByObj(oItem)
 		nStepID = oModel.AddStep(nParentID,[
				:name = cStepName,
				:active = True , 
				:code = "" , 
			 	:interactionid = nIID ,
				:visible = True , 
				:stepnumber = nStepNumber ,
				:steptype = nStepType 
			]
		)
		SetStepColor(nStepType)
		oItem = oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
		UpdateTheTimeMachine()
		return oItem

	func SetStepColor nStepType
		oView.oStepsTree.SetStepColor(nStepType)

	func SelectStep nIID,nStepNumber
		nStepID = oModel.GetStepIDbyIID(nIID,nStepNumber)
		oItem = oView.oStepsTree.GetObjByID(nStepID)
		return [oItem,nStepID]

	func TimeMachineGotoPresent
		oTMController.TimeMachineGotoPresent(oView,oModel)

	func UpdateTheTimeMachine
		nInteractionsCount = oModel.oInteractionModel.InteractionsCount()
		oView.sliderTimeMachine.setInteractionPoints(nInteractionsCount)

	func AddStepAction
		if not AllowInteractButton() {
			# "Can't Add New Step in this location!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTADD)
			return
		}
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
		 if not IsComment() {
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTEDIT)
			return
		}
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
			nStepType = oModel.GetStepType(nStepID)
			SetStepColor(nStepType)
			oView.oStepsTree.editstep(oItem,cText,this.oModel.GetStepIgnoreStatus(nStepID))
			oModel.EditStepName(nStepID,cText)
		}		

	func DeleteStepAction
		if not IsCommentOrRoot() {
			# "Can't Delete Sub Step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTDELETE)
			return
		}
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
		if nStepID = 1 {	# Delete All Steps
			# Remove the current Steps From the Tree Control
				oView.oStepsTree.taketoplevelitem(0)	
				oView.oStepsTree.aTree = []
				oView.oStepsTree.AddStartPoint()
			oModel = new GoalDesignerModel
		else
			oView.oStepsTree.DelByObj(oItem)	# Remove it from the [oItem|ID] List
			oItem.parent().takechild(oItem.parent().indexofchild(oItem))
			oModel.DeleteStep(nStepID)
		}
		# Update the Time Machine
			UpdateTheTimeMachine()

	func MoveStepUpAction
		if not IsCommentOrRoot() {
			# "Can't Move Sub Step Up!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTMOVEUP)
			return
		}
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
		if not IsCommentOrRoot() {
			# "Can't Move Sub Step Down!"
			ShowMessage(T_GD_BM_SORRY ,T_GD_BM_CANTMOVEDOWN)
			return
		}
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
		if not IsCommentOrRoot() {
			# "Can't Cut Sub Step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTCUT)
			return
		}
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oModel.CutStep(nStepID)
		oView.oStepsTree.SaveStep(oItem)
		oItem.parent().takechild(oItem.parent().indexofchild(oItem))

	func CopyStepsAction
		if not IsCommentOrRoot() {
			# "Can't Copy Sub Step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTCOPY)
			return
		}
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point
			return
		}
		oModel.CopyStep(nStepID)
		oView.oStepsTree.SaveStep(oItem)

	func PasteStepsAction
		 if not AllowInteractButton() {
			# "Can't paste steps in this step!"
			ShowMessage(T_GD_BM_SORRY ,T_GD_BM_CANTPAST)
			return
		}
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
		# Activate the same step (parent)
			oView.oStepsTree.SetCurrentItem(oParentItem,0)	

	func IncreaseSizeAction
		oView.oStepsTree.IncreaseFontSize()
		oView.oStepCode.IncreaseFontSize()

	func DecreaseSizeAction
		oView.oStepsTree.DecreaseFontSize()
		oView.oStepCode.DecreaseFontSize()

	func IgnoreStepAction	
		if not IsCommentOrRoot() {
			# "Can't Comment/Uncomment Sub Step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTCOMMENT)
			return
		}	
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nIgnore = oModel.IgnoreStep(nStepID)
		oView.oStepsTree.IgnoreStep(oItem,nIgnore)

	func StepChangedAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		# Avoid Start point
			if nStepID = 1 {	
				# Set the step code
					oView.oStepCode.setText("")
					oView.oStepCode.setEnabled(False)
				return
			}
		#  Avoid generated steps (Not Comment)
			if nStepType != C_STEPTYPE_COMMENT  {
				oView.oStepCode.setText(oModel.GetStepCode(nStepID))
				oView.oStepCode.setEnabled(False)			
				return
			}
		# Change the Step Code Value
			oView.oStepCode.setText(oModel.GetStepCode(nStepID))
			oView.oStepCode.setEnabled(True)

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

	func TreeKeyPress
		nKey = oView.oTreeFilter.getkeycode()
		if oView.oTreeFilter.getmodifiers() = 0 {	# No CTRL Key is pressed
			if ( nKey >= 65 ) and (nKey <= 90 )  { # Keys from 'a' to 'z' 
				if InteractAction() {
					Last_Window().oView.oTextSearch.setText(Lower(Char(nKey)))			
					Last_Window().SearchAction()
				}
			}
		}
		oView.oTreeFilter.setEventOutput(False)

	func KeyPress
		nKey = oView.oFilter.getkeycode()
		if oView.oTreeFilter.getmodifiers() = 0 {	# No CTRL Key is pressed
			if not (nKey=16777223) { 	# DEL
				return
			}
		}
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
			case 84		# CTRL+T
				InteractAction()
		}
		oView.oTreeFilter.setEventOutput(False)

	func SaveFileAction
		# Set the file Name
			new qfiledialog(oView.win) {
				cFileName = getsavefilename(this.oView.win,"open file",currentdir(),"source files(*.pwct)")
			}
			if cFileName = NULL { return }
			oVisualSourceFile.cFileName = cFileName
		oVisualSourceFile.RemoveFile()
		oVisualSourceFile.Open()
		oVisualSourceFile.SetStepsTreeTable(oModel.oStepsTreeModel.GetData())
		oVisualSourceFile.SetInteractionsTable(oModel.oInteractionModel.GetData())
		oVisualSourceFile.SetStepsID(oModel.oStepsTreeModel.GetID())
		oVisualSourceFile.SetInteractionsID(oModel.oInteractionModel.GetID())
		oVisualSourceFile.CreateTables()
		oVisualSourceFile.SaveTables()
		oVisualSourceFile.Close()

	func OpenFileAction
		oView.oStepsTree.DisableEvents()
		# Get the file Name
			new qfiledialog(oView.win) {
				cFileName = getopenfilename(this.oView.win,"open file",currentdir(),"source files(*.pwct)")
			}
			if cFileName = NULL { return }
			oVisualSourceFile.cFileName = cFileName
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
				nStepType = aStepsTree[x][3][:steptype]
				SetStepColor(nStepType)
				oItem = oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)					
				oView.oStepsTree.IgnoreStep(oItem,lIgnore)
			}
		# Update the Time Machine
			UpdateTheTimeMachine()
		oView.oStepsTree.EnableEvents()

	func InteractAction
		 if not AllowInteractButton() {
			# "Can't start new Interaction from this step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTINTERACT)
			return False
		}
		Open_Window(:ComponentsBrowserController)
		Last_Window().setParentObject(self)
		Last_Window().AddComponents()
		return True

	func ModifyAction
		# Get the Selected Step
			oItem  = oView.oStepsTree.currentItem()
			nStepID = oView.oStepsTree.GetIDByObj(oItem)
		# Check Step Type
			nIID = oModel.GetInteractionID(nStepID)
		# Get the Component File Name
			cFile = oModel.GetInteractionComponent(nIID)
		# Get the Interaction Variables Values
			cVariablesValues = oModel.GetInteractionVariablesValues(nIID)
		# Check the component File
			cFilePath = "vpl/english/" + cFile + ".ring"
			if fexists(cFilePath) {
				if find(aComponentsFilesList,cFilePath) = 0 { 
					aComponentsFilesList + cFilePath
					Eval("Load '" + cFilePath + "'")
				}
				# Use the Component
					Open_Window(cFile+:ComponentController)
					Last_Window().setParentObject(self)
					Last_Window().cComponent = cFile
					Last_Window().cVariablesValues = cVariablesValues
					Last_Window().nInteractionMode = C_INTERACTIONMODE_MODIFY
					Last_Window().nIID = nIID
					Last_Window().SetVariablesValues()
			}

	func AllowInteractButton
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		# Interact Button Status
		if nStepType = C_STEPTYPE_COMMENT  or
		   nStepType = C_STEPTYPE_ALLOWINTERACTION 	{
			return True
		}
		return False

	func IsCommentOrRoot
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		# Delete|Move|Cut|Copy Buttons Status
		if nStepType = C_STEPTYPE_COMMENT  or
		   nStepType = C_STEPTYPE_ROOT 	{
			return True
		}
		return False

	func IsComment
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		# Edit Button Status
		if nStepType = C_STEPTYPE_COMMENT  {
			return True
		}
		return False

	func IsGeneratedStep
		return not IsComment()

	func IsMoveUp
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if oModel.oStepsTreeModel.SiblingUp(nStepID) {
			return True
		else
			return False
		}

	func IsMoveDown
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if oModel.oStepsTreeModel.SiblingDown(nStepID) {
			return True
		else
			return False
		}

	func TreeNodeChangedAction
		oView.BtnInteract.setEnabled(AllowInteractButton())
		oView.BtnEditStep.setEnabled(IsComment())
		oView.BtnAddStep.setEnabled(AllowInteractButton())
		oView.BtnDeleteStep.setEnabled(IsCommentOrRoot())
		if IsMoveUp() {
			oView.BtnMoveStepUp.setEnabled(IsCommentOrRoot())
		else
			oView.BtnMoveStepUp.setEnabled(False)
		}
		if IsMoveDown() {
			oView.BtnMoveStepDown.setEnabled(IsCommentOrRoot())
		else
			oView.BtnMoveStepDown.setEnabled(False)
		}
		oView.BtnCutSteps.setEnabled(IsCommentOrRoot())
		oView.BtnCopySteps.setEnabled(IsCommentOrRoot())
		oView.BtnPasteSteps.setEnabled(AllowInteractButton())
		oView.BtnIgnore.setEnabled(IsCommentOrRoot())
		oView.BtnModify.setEnabled(IsGeneratedStep())
