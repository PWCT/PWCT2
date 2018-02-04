/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	: Goal Designer Controller Class
**	Date 		: 2016.11.20
**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerController from WindowsControllerParent

	oView = new GoalDesignerView
	oModel = new GoalDesignerModel
	oTMController = new TimeMachineController
	oVisualSourceFile = new VisualSourceFile
	oProgramController = new ProgramController

	cComponentsPath = "vpl/ringpwct/"
	cFont = "MS Shell Dlg 2,14,-1,5,50,0,0,0,0,0"

	lIsComponentsBrowserOpened = False 
	nComponentsBrowserWindowID 

	nInteractionPagesToModifyCount = 0

	lInteractionPagesInGoalDesigner = False
	if PWCTIsMobile(:ComponentsBrowser) {
		lComponentsBrowserInGoalDesigner = False
	else
		lComponentsBrowserInGoalDesigner = True
	}

	lCallInteract = True

	/*
		Purpose : Show the Window
		Parameters : None
		Output : None
	*/

	func Start
		oView.Show()


	/*
		Purpose 	: The window is active, Default Settings.
		Parameters 	: None
		Output	 	: None
	*/

	func Activate
		# Just Load the Components 
			if lCallInteract {
				LoadComponentsBrowserComponents()
			}
		# Open Components Browser

			if (lComponentsBrowserInGoalDesigner or PWCTIsMobile(:ComponentsBrowser) ) and lCallInteract {
				InteractAction()
				lCallInteract = False			
			}

		# Set Focus to Steps Tree
			oView.win.ActivateWindow()
			oView.oStepsTree.SetFocus(0)


	/*
		Purpose : Add Step
		Parameters : Step Name
		Output : Item Object
	*/

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

	/*
		Purpose : Add Generated Step Interaction
		Parameters : The component Name
		Output : Interaction ID
	*/

	func AddGeneratedInteraction cComponent
		return oModel.oInteractionModel.AddGeneratedInteraction(cComponent)

	/*
		Purpose : Save Variables Values
		Parameters : Interaction ID and Variables Values
		Output : None
	*/

	func SaveVariablesValues nIID,cVariablesValues
		oModel.oInteractionModel.SaveVariablesValues(nIID,cVariablesValues)

	/*
		Purpose : Add Generated Step
		Parameters : Step Name, Interaction ID, Step Number and Step Type
		Output : Item Object
	*/

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

	/*
		Purpose : Set Step Color
		Parameters : Step Type
		Output : None
	*/

	func SetStepColor nStepType
		oView.oStepsTree.SetStepColor(nStepType)

	/*
		Purpose : Select Step
		Parameters : Interaction ID and Step Number
		Output : List contains the Item Object and the Step ID
	*/

	func SelectStep nIID,nStepNumber
		nStepID = oModel.GetStepIDbyIID(nIID,nStepNumber)
		oItem = NULL
		if nStepID != NULL {
			oItem = oView.oStepsTree.GetObjByID(nStepID)
		}
		return [oItem,nStepID]

	/*
		Purpose : Use the Time Machine to go to Present
		Parameters : None
		Output : None
	*/

	func TimeMachineGotoPresent
		oTMController.TimeMachineGotoPresent(oView,oModel)

	/*
		Purpose : Update The Time Machine
		Parameters : None
		Output : None
	*/

	func UpdateTheTimeMachine
		nInteractionsCount = oModel.oInteractionModel.InteractionsCount()
		oView.sliderTimeMachine.setInteractionPoints(nInteractionsCount)

	/*
		Purpose : Get the Time Machine - Active Interaction ID
		Parameter : None 
		Output : Active Interaction ID
	*/
	func TimeMachineActiveInteractionID
		return oTMController.activeInteractionID(oView,oModel)

	/*
		Purpose : Add Step Action
		Parameters : None
		Output : None
	*/

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
			oView.fixDrawing()
		}
	
	/*
		Purpose : Edit Step Action
		Parameters : None
		Output : None
	*/

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

	/*
		Purpose : Delete Step Action
		Parameters : None
		Output : None
	*/

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

	/*
		Purpose : Move Step Up Action
		Parameters : None
		Output : None
	*/

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

	/*
		Purpose : Move Step Down Action
		Parameters : None
		Output : None
	*/

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

	/*
		Purpose : Print Steps Action
		Parameters : None
		Output : None
	*/

	func PrintStepsAction
		Open_Window(:PrintStepsController)
		Last_Window().setParentObject(self)
		Last_Window().ShowData()

	/*
		The next method cut a step from the Steps Tree
		Parameters : None
		Output : None
	*/
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
		# Update the Time Machine
			UpdateTheTimeMachine()

	/*
		Purpose : Copy Steps Action
		Parameters : None
		Output : None
	*/

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

	/*
		Purpose : Paste Steps Action
		Parameters : None
		Output : None
	*/

	func PasteStepsAction
		 if not AllowInteractButton() {
			# "Can't paste steps in this step!"
			ShowMessage(T_GD_BM_SORRY ,T_GD_BM_CANTPASTE)
			return
		}
		if oView.oStepsTree.isbuffernotempty() = false {
			return
		}
		# Time Machine - Present
			TimeMachineGotoPresent()
		# Check Rules before the Paste Operation 
			aPasteRoots = oModel.getpasteTopComponents()
			for cComponent in aPasteRoots {
				if not RulesAllow(cComponent) {
					return
				}
			}
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
		# Fix Drawing 
			oView.fixDrawing()
		# Expand Items 
			aSteps = oView.oStepsTree.StepsList(oParentItem)
			for oItem in aSteps {
				oItem.setexpanded(True)
			}

	/*
		Purpose : Increase Size Action
		Parameters : None
		Output : None
	*/

	func IncreaseSizeAction
		oView.oStepsTree.IncreaseFontSize()
		oView.oStepCode.IncreaseFontSize()
		# Set default font size for the Environment, To be used when we open another files
			parent().nFontSize = oView.oStepsTree.nFontSize

	/*
		Purpose : Decrease Size Action
		Parameters : None
		Output : None
	*/

	func DecreaseSizeAction
		oView.oStepsTree.DecreaseFontSize()
		oView.oStepCode.DecreaseFontSize()
		# Set default font size for the Environment, To be used when we open another files
			parent().nFontSize = oView.oStepsTree.nFontSize

	/*
		Purpose : Ignore Step Action
		Parameters : None
		Output : None
	*/

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

	/*
		Purpose : Step Changed Action
		Parameters : None
		Output : None
	*/

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

	/*
		Purpose : Step Code Changed Action
		Parameters : None
		Output : None
	*/

	func StepCodeChangedAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Avoid start point			
			return
		}	
		oModel.SaveStepCode(nStepID,oView.oStepCode.ToPlainText())

	/*
		Purpose : Search Action
		Parameters : None
		Output : None
	*/

	func SearchAction
		Open_Window(:FindStepController)
		Last_Window().setParentObject(self)

	/*
		Purpose : Change Time Machine Point Action
		Parameters : None
		Output : None
	*/

	func ChangeTimeMachinePointAction
		oTMController.ChangeTimeMachinePoint(oView,oModel)

	/*
		Purpose : Tree Key Press
		Parameters : None
		Output : None
	*/

	func TreeKeyPress
		nKey = oView.oTreeFilter.getkeycode()
		cText = oView.oTreeFilter.getkeytext()
		if oView.oTreeFilter.getmodifiers() = 0 {	# No CTRL Key is pressed
			# Keys from 'a' to 'z' and Arabic Keys
			if 	(( nKey >= 65   ) and (nKey <= 90   )) or  
 				(( nKey >= 1575 ) and (nKey <= 1610 ))	{ 
				if InteractAction() {
					ComponentsBrowserWindow().oView.oTextSearch.setText(Lower(cText))			
					ComponentsBrowserWindow().SearchAction()
				}
			}
		}
		oView.oTreeFilter.setEventOutput(False)

	/*
		Purpose : Key Press Action
		Parameters : None
		Output : None
	*/

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
				oItem  = oView.oStepsTree.currentItem()
				nStepID = oView.oStepsTree.GetIDByObj(oItem)
				nStepType = oModel.GetStepType(nStepID)
				if nStepType = C_STEPTYPE_COMMENT {
					EditStepAction()
				else	
					ModifyAction()
				}
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
			case 79		# CTRL+O
				MoveStepDownAction()
			case 84		# CTRL+T
				InteractAction()
			case 68		# CTRL+D
				DebugAction()
			case 82		# CTRL+R
				RunAction()
			case 16777268	# CTRL+F5
				RunGuiAction()
		}
		oView.oTreeFilter.setEventOutput(False)

	/*
		Purpose : New File Action
		Parameters : None
		Output : None
	*/  

	func NewFileAction
		# Set the file Name
			new qfiledialog(oView.win) {
				cFileName = getsavefilename(this.oView.win,"New File",currentdir(),T_GD_DM_FILETYPE)
			}
			if cFileName = NULL { return }
			oVisualSourceFile.cFileName = cFileName
		# Remove the current Steps From the Tree Control
			oView.oStepsTree.taketoplevelitem(0)	
			oView.oStepsTree.aTree = []
			oView.oStepsTree.AddStartPoint()
		# Create new Model (Steps Tree and Interactions)
			oModel = new GoalDesignerModel
		# Create the file
			SaveFileAction2()
		# Update the Time Machine
			UpdateTheTimeMachine()

	/*
		Purpose : Save Current File Action
		Parameters : None
		Output : None
	*/

	func SaveCurrentFileAction
		# Check file not saved before 
		if oVisualSourceFile.cFileName = C_VSF_NOFILENAME {
			SaveFileAction()
			return 
		}
		SaveFileAction2()

	/*
		Purpose : Save File Action
		Parameters : None
		Output : None
	*/

	func SaveFileAction
		# Set the file Name
			new qfiledialog(oView.win) {
				cFileName = getsavefilename(this.oView.win,T_GD_DM_SAVEFILE ,currentdir(),T_GD_DM_FILETYPE)
			}
			if cFileName = NULL { return }
			oVisualSourceFile.cFileName = cFileName
			SaveFileAction2()
		# Set the docable widget title
			oView.win.ParentWidget().setWindowTitle(cFileName)

	/*
		Purpose : Save File Action 2
		Parameters : None
		Output : None
	*/

	func SaveFileAction2
		oVisualSourceFile.RemoveFile()
		oVisualSourceFile.Open()
		oVisualSourceFile.SetStepsTreeTable(oModel.oStepsTreeModel.GetData())
		oVisualSourceFile.SetInteractionsTable(oModel.oInteractionModel.GetData())
		oVisualSourceFile.SetStepsID(oModel.oStepsTreeModel.GetID())
		oVisualSourceFile.SetInteractionsID(oModel.oInteractionModel.GetID())
		oVisualSourceFile.CreateTables()
		oVisualSourceFile.SaveTables()
		oVisualSourceFile.Close()

	/*
		Purpose : Open File Action
		Parameters : None
		Output : None
	*/

	func OpenFileAction
		oView.oStepsTree.DisableEvents()
		# Get the file Name
			new qfiledialog(oView.win) {
				cFileName = getopenfilename(this.oView.win,T_GD_DM_OPENFILE ,currentdir(),T_GD_DM_FILETYPE)
			}
			if cFileName = NULL { return }
			# Remove the file from the Active Files List 
				parent().RemoveFileFromActiveFilesList(oVisualSourceFile.cFileName)
			oVisualSourceFile.cFileName = cFileName
			OpenFileAction2()
		oView.oStepsTree.EnableEvents()
		# Set the docable widget title
			oView.win.ParentWidget().setWindowTitle(cFileName)


	/*
		Purpose : Open File Action 2
		Parameters : None
		Output : None
	*/

	func OpenFileAction2
		nClock = clock()
		# Get Data From the Visual Source File
			oVisualSourceFile.Open()
			oVisualSourceFile.LoadTables()
			aStepsTree    =  oVisualSourceFile.GetStepsTreeTable()
			aInteractions =  oVisualSourceFile.GetInteractionsTable()
			oVisualSourceFile.Close()
		# Update Objects
			oModel.oStepsTreeModel.SetData(aStepsTree)
			oModel.oInteractionModel.SetData(aInteractions)
			oModel.oStepsTreeModel.SetID(oVisualSourceFile.GetStepsID())
			oModel.oInteractionModel.SetID(oVisualSourceFile.GetInteractionsID())
		RefreshStepsTree2(aStepsTree)
		oView.oStepsTree.oFirstStep.SetExpanded(True)
		# Prepare the Components Browser 
			Activate()
		showmessageInStatusBar("Loading Time: " + ( (clock()-nClock) / Clockspersecond() ) )

	/*
		Purpose : Refresh Steps Tree
		Parameters : None
		Output : None
	*/

	func RefreshStepsTree
		aStepsTree = oModel.oStepsTreeModel.getdata()
		RefreshStepsTree2(aStepsTree)

	/*
		Purpose : Refresh Steps Tree
		Parameters : The Steps Tree List 
		Output : None
	*/

	func RefreshStepsTree2 aStepsTree
		oView.oStepsTree.setUpdatesEnabled(False)
		oView.oStepsTree.blockSignals(True)
		# Remove the current Steps From the Tree Control
			oView.oStepsTree.taketoplevelitem(0)	
			oView.oStepsTree.aTree = []
			oView.oStepsTree.AddStartPoint()
		# Add Steps to the Tree
			nMax = len(aStepsTree) 
			for x = 2 to nMax {
				nStepID		= aStepsTree[x][C_TREEMODEL_NODEID]
				nParentID	= aStepsTree[x][C_TREEMODEL_PARENTID]
				cStepName	= aStepsTree[x][C_TREEMODEL_CONTENT][:name]
				lIgnore		= not aStepsTree[x][C_TREEMODEL_CONTENT][:active]
				nStepType	= aStepsTree[x][C_TREEMODEL_CONTENT][:steptype]
				SetStepColor(nStepType)
				oItem		= oView.oStepsTree.SerialAdd(nParentID,nStepID,cStepName,lIgnore)					
			}
		# Update the Time Machine
			UpdateTheTimeMachine()
		oView.oStepsTree.setUpdatesEnabled(True)
		oView.oStepsTree.blockSignals(False)
		oView.oStepsTree.oFirstStep.SetExpanded(True)

	/*
		Purpose : Start New Interaction
		Parameters : None
		Output : None
	*/

	func InteractAction
		 if not AllowInteractButton() {
			# "Can't start new Interaction from this step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTINTERACT)
			return False
		}
		if parent().IsDockForComponentsBrowser() and parent().lDockForComponentsBrowserIsVisible = True {
			parent().oView.oDockComponentsBrowser.setWidget(ComponentsBrowserWindow().oView.win)
			ComponentsBrowserWindow().Start()
			parent().oView.oDockComponentsBrowser.show()
			parent().oView.oDockComponentsBrowser.Raise()
		elseif parent().IsDockForComponentsBrowser() and parent().lDockForComponentsBrowserIsVisible = False 
			ComponentsBrowserWindow().oView.win.show()
			parent().oView.oDockComponentsBrowser.show()
			parent().oView.oDockComponentsBrowser.Raise()
		else 
			if lComponentsBrowserInGoalDesigner {
				oView.layoutCB.AddWidget(ComponentsBrowserWindow().oView.win)
				ComponentsBrowserWindow().Start()
				oView.widgetCB.show()
			else
				ComponentsBrowserWindow().Start()
			}
		}

		return True

	/*
		Purpose 	: Load the Components Browser components 
		Parameters 	: None
		Output 		: None
	*/

	func LoadComponentsBrowserComponents
		if parent().isdockForComponentsBrowser() and parent().lDockForComponentsBrowserIsVisible = True {
			nComponentsBrowserWindowID = parent().nComponentsBrowserWindowID 
			ComponentsBrowserWindow().setParentObject(self)
			return 
		}
		if lIsComponentsBrowserOpened = False {
			lIsComponentsBrowserOpened = True
			Open_WindowNoShow(:ComponentsBrowserController)
			Last_Window().AddComponents()
			Last_Window().setParentObject(self)
			nComponentsBrowserWindowID = Last_WindowID()
		}
		parent() {
			if isdockForComponentsBrowser() and lDockForComponentsBrowserIsVisible = False {
				lDockForComponentsBrowserIsVisible = True
				nComponentsBrowserWindowID = Last_WindowID()
			}
		}

	/*
		Purpose : Get the Components Browser Window Object
		Parameters : None
		Output : Components Browser Object
	*/

	func ComponentsBrowserWindow
		return GetObjectByID(nComponentsBrowserWindowID)

	/*
		Purpose : Called when the componetns browser is closed
		Parameters : None
		Output : None
	*/

	func ComponentsBrowserClosed
		lIsComponentsBrowserOpened = False
		ComponentsBrowserHidden()

	func ComponentsBrowserHidden
		oView.widgetCB.Hide()
		if parent().isdockForComponentsBrowser() {
			parent().oView.oDockComponentsBrowser.Hide()
		}

	/*
		Purpose 	: Check loading the component file 
		Parameters 	: Component File Name
		Output		: None
	*/
	func CheckLoadingComponent cFilePath
		if fexists(cFilePath) {
			if find(aComponentsFilesList,cFilePath) = 0 { 
				aComponentsFilesList + cFilePath
				Eval("Load '" + cFilePath + "'")
			}
		}

	/*
		Purpose : Modify Action
		Parameters : None
		Output : None
	*/

	func ModifyAction
		# Check if it is a comment (Step Double Click) 		
			if IsComment() { 
				editstepaction() 
				return 
			}
		# Get the Selected Step
			oItem  = oView.oStepsTree.currentItem()
			nStepID = oView.oStepsTree.GetIDByObj(oItem)
		# Avoid the Start Point 
			if nStepID = 1 {
				return
			}
		# Check Step Type
			openComponent(nStepID)
		# Display the Window 
			if lInteractionPagesInGoalDesigner {
				oView.layoutVPages.InsertWidget(0,Last_Window().oView.win,0,0)
				Last_Window().Start()	# Show The Window
				oView.widgetVPages.Show()	# Show the Splitter Widget
			else
				Last_Window().Start()	# Show The Window
			}
			nInteractionPagesToModifyCount++
			Last_Window().AfterOpen()

	/*
		Purpose : Open component without displaying the Interaction window 
		Parameters : The Step ID
		Output	: None
	*/

	func OpenComponent nStepID
		# Check Step Type
			nIID = oModel.GetInteractionID(nStepID)
		# Get the Component File Name
			cFile = oModel.GetInteractionComponent(nIID)
		# Get the Interaction Variables Values
			cVariablesValues = oModel.GetInteractionVariablesValues(nIID)
		# Check the component File
			cFilePath = cComponentsPath + cFile + ".ring"
			CheckLoadingComponent(cFilePath)
			# Use the Component
				# We use Open_WindowNoShow() to avoid flickering
				Open_WindowNoShow(cFile+:ComponentController)
				Last_Window().setParentObject(self)
				Last_Window().cComponent = cFile
				Last_Window().cVariablesValues = cVariablesValues
				Last_Window().nInteractionMode = C_INTERACTIONMODE_MODIFY
				Last_Window().nIID = nIID
				Last_Window().SetVariablesValues()


	/*
		Purpose : Interaction page (modify) closed
		Parameters : None
		Output : None
	*/

	func InteractionPageToModifyClosed
		nInteractionPagesToModifyCount--
		if nInteractionPagesToModifyCount = 0 {
			oView.widgetVPages.Hide()
		}

	/*
		Purpose : Check Allow Interact Button
		Parameters : None
		Output : True/False
	*/

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

	/*
		Purpose : Check is comment or root
		Parameters : None
		Output : True/False
	*/

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

	/*
		Purpose : Check Is Comment
		Parameters : None
		Output : True/False
	*/

	func IsComment
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		# Edit Button Status
		if nStepType = C_STEPTYPE_COMMENT  {
			return True
		}
		return False

	/*
		Purpose : Check is Generated Step
		Parameters : None
		Output : None
	*/

	func IsGeneratedStep
		return not IsComment()

	/*
		Purpose : Check Is Move Up
		Parameters : None
		Output : True/False
	*/

	func IsMoveUp
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if oModel.oStepsTreeModel.SiblingUp(nStepID) {
			return True
		else
			return False
		}

	/*
		Purpose : Check Is Move Down
		Parameters : None
		Output : True/False
	*/

	func IsMoveDown
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if oModel.oStepsTreeModel.SiblingDown(nStepID) {
			return True
		else
			return False
		}

	/*
		Purpose : Tree Node Changed Action
		Parameters : None
		Output : None
	*/

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

	/*
		Purpose : Debug Action
		Parameters : None
		Output : None
	*/

	func DebugAction
		setProgramControllerFileName()
		oProgramController.Debug(self)

	/*
		Purpose : Run Action
		Parameters : None
		Output : None
	*/

	func RunAction
		setProgramControllerFileName()
		oProgramController.Run(self)

	/*
		Purpose : Run GUI Action
		Parameters : None
		Output : None
	*/

	func RunGUIAction
		setProgramControllerFileName()
		oProgramController.RunGUI(self)

	/*
		Purpose : Set Program Controller File Name 
			  Determine the Generated source code file
		Parameters : None
		Output : None
	*/

	func setProgramControllerFileName
		oProgramController.cFileName = substr(oVisualSourceFile.cFileName,".pwct",".ring")


	/*
		Purpose : Font Action
		Parameters : None
		Output : None
	*/

	func FontAction
		oFontDialog = new qfontdialog() {
			oFont = new qfont("",0,0,0)
			oFont.fromstring(this.cFont)
			SetCurrentFont(oFont)
			aFont = GetFont()
		}
		if aFont[1] != NULL {
			cFont = aFont[1]
			UpdateFont()
		}	


	/*
		Purpose : Update Font 
		Parameters : None
		Output : None
	*/

	func UpdateFont
		SetFontName()	# set the new font
		UpdateFontSize()

	/*
		Purpose : Update Font  Size
		Parameters : None
		Output : None
	*/

	func UpdateFontSize
		oView.oStepsTree.UpdateFontSize()

	/*
		Purpose : Colors Action
		Parameters : None
		Output : None
	*/

	func ColorsAction
		Open_Window(:StepsColorsController)
		Last_Window().setParentObject(self)
		Last_Window().Start()			# Show the Window

	/*
		Purpose : Set Font Name
		Parameters : None
		Output : None
	*/

	func SetFontName   
		oFont = new qfont("",0,0,0)
		oFont.FromString(cFont)
		oView.oStepsTree.SetFont(oFont)
		oView.oStepsTree.setFontObject(oFont)
		oView.oStepsTree.nFontSize  = oFont.PointSize()

	/*
		Purpose : Activate Window Action
		Parameters : None
		Output : None
	*/

	func ActivateWindowAction	
		if IsParent() {
			parent().setParentObject(self)		 
		}

	/*
		Purpose : Close File Action
		Parameters : None
		Output : None
	*/

	func CloseFileAction
		# Remove the file from the Active Files List 
			parent().RemoveFileFromActiveFilesList(oVisualSourceFile.cFileName)
		# Remove the current Steps From the Tree Control
			oView.oStepsTree.taketoplevelitem(0)	
			oView.oStepsTree.aTree = []
			oView.oStepsTree.AddStartPoint()
		# Create new Model (Steps Tree and Interactions)
			oModel = new GoalDesignerModel
		# Create the file
			oVisualSourceFile = new VisualSourceFile
		# Update the Time Machine
			UpdateTheTimeMachine()
		# Set the docable widget title
			oView.win.ParentWidget().setWindowTitle("Goal Designer")

	/*
		Purpose : IsFileOpened
		Parameters : None
		Output : None
	*/

	func IsFileOpened
		return oVisualSourceFile.IsFileOpened()

	/*
		Purpose : Is File Empty
		Parameters : None
		Output : None
	*/

	func IsFileEmpty
		return oModel.IsEmpty()

	/*
		Purpose : Get Parent Component Name and Step Number : Used for Rules
		Parameters : None
		Output : None
	*/

	func GetParentComponentDetails
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# start point
			return ["SP",1]
		}
		nStepType = oModel.GetStepType(nStepID)
		# Get parent component (Not Comment)
		while nStepType = C_STEPTYPE_COMMENT  {
			nStepID = oModel.getStepParent(nStepID)
			if nStepID = 1 {	# start point
				return ["SP",1]
			}
			nStepType = oModel.GetStepType(nStepID)
		}
		nIID = oModel.GetInteractionID(nStepID)
		cFile = oModel.GetInteractionComponent(nIID)
		nStepNumber = oModel.GetStepNumber(nStepID)
		return [cFile,nStepNumber]

	/*
		Purpose : Get Parent Name  - Used for Rules
		Parameters : None
		Output : None
	*/

	func GetParentComponentName
		return GetParentComponentDetails()[1]

	/*
		Purpose : Get Parent Step Number  - Used for Rules
		Parameters : None
		Output : None
	*/

	func GetParentStepNumber
		return GetParentComponentDetails()[2]

	/*
		Purpose : Get Component Object
		Parameters : None
		Output : None
	*/

	func GetComponentObject cComponentName
		cComponentsPath = C_CB_COMPONENTSPATH
		cFilePath = cComponentsPath + cComponentName + ".ring"
		CheckLoadingComponent(cFilePath)
		# Check the Component
			eval("oObject = new " + cComponentName+:ComponentController) 					
			return oObject


	/*
		Purpose : Check Rules
		Parameters : None
		Output : None
	*/

	func RulesAllow cChildComponentName
		# Prepare Variables 
			cParentComponentName = getparentComponentName()
			nStepNumber = getparentStepNumber()
			cComponentsPath = C_CB_COMPONENTSPATH
			cFilePath = cComponentsPath + cParentComponentName + ".ring"
		# Check that the current component support the parent component 
			oChild = GetComponentObject(cChildComponentName)
			lCheck = oChild.CheckAllowParent(cParentComponentName,nStepNumber)
			if not lCheck { return false } 
		# Check that the parent component accept the current component 
			if cParentComponentName = "SP" { return True }
			oParent = GetComponentObject(cParentComponentName)
			return oParent.CheckAllowChild(cChildComponentName,nStepNumber)


	/*
		Purpose : Check output from the application when we run PWCT on Mobile
		Parameters : None 
		Output : None 
	*/

	func CheckOutputOnMobile
		oProgramController.CheckOutputOnMobile(self)

	/*
		Purpose : Enable Check output from the application when we run PWCT on Mobile
		Parameters : None 
		Output : None 
	*/

	func EnableCheckOutputOnMobile
		oView.oCheckOutputOnMobileTimer.start()

	/*
		Purpose : Disable Check output from the application when we run PWCT on Mobile
		Parameters : None 
		Output : None 
	*/

	func DisableCheckOutputOnMobile
		oView.oCheckOutputOnMobileTimer.stop()


	/*
		Purpose	   : Delete Extra steps in the interaction after we 
			     Modify it and change the interaction options 
			     We will delete steps in the same interaction
			     where the step number > nStepsCount
		Parameters : The interaction ID, The Steps Count 
		Output 	   : None
	*/

	func DeleteExtraSteps nIID,nStepsCount
		aList = oModel.GetStepsInTimeRange(nIID-1,nIID,True)
		# Take in mind group of steps in the same interaction
			aList = Sort(aList,1)
			aList = Reverse(aList)
		for x = 1 to len(aList) {
			item = aList[x]
			nStepID 	= item[C_TREEMODEL_NODEID]
			nStepNumber 	= item[C_TREEMODEL_CONTENT][:stepnumber]
			if nStepNumber > nStepsCount {
				oItem = oView.oStepsTree.GetObjByID(nStepID) 
				oView.oStepsTree.DelByObj(oItem)
				oItem.parent().takechild(oItem.parent().indexofchild(oItem))
				# We don't call deletestep() to avoid deleting the interactaction
					oModel.oStepsTreeModel.DeleteNode(nStepID)
			}
		}

	/*
		Purpose 	: Display message in the status bar
		Parameters      : The message as string 
		Output		: None
	*/			
		
	func ShowMessageInStatusBar cMsg
		parent().showmessageInStatusBar(cMsg)


	/*
		Check using dockable window for the components browser 
	*/
	func isdockForComponentsBrowser
		return parent().isdockForComponentsBrowser()
