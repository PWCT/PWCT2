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
	oPlayAsMovie = new PlayAsMovieController
	oAutoComplete = new AutoComplete
	oUndo = new UndoController

	cComponentsPath = "vpl/ringpwct/"
	cFont = "MS Shell Dlg 2,14,-1,5,50,0,0,0,0,0"

	lIsComponentsBrowserOpened = False 
	nComponentsBrowserWindowID 

	nInteractionPagesToModifyCount = 0

	if PWCTIsMobile(:InteractionPagesInGoalDesigner) {
		lInteractionPagesInGoalDesigner = False
	else 
		lInteractionPagesInGoalDesigner = ! C_STEPSTREE_OPENINTERACTIONSINNEWWINDOWS
	}


	if PWCTIsMobile(:ComponentsBrowser) {
		lComponentsBrowserInGoalDesigner = False
		lCallInteract = False
	else
		lComponentsBrowserInGoalDesigner = True
		lCallInteract = True
	}

	lLoadComponents = True

	# Increase performance when adding many steps 
		lUseSuperSerialAdd 			= True
		# Creating new steps tree conflict with storing steps tree object in Environment Object to switch between dockable windows of goal designers
			lCreateNewStepsTree		= False
		# Max Steps that uses Colors 
			nMaxStepsCount 			= 2000
			lUseMaxStepsCount		= True
		# Show loading progress 
			lShowLoadingProgress		= True
		# Expand Steps when opening files 
			lSuperSerialAddExpandSteps 	= True
			nMaxStepsCountForExpandSteps    = 1200
			nMinStepsToExpand		= 50
		# Steps Color - Old Style (PWCT 1.9)
			lStepColorOldStyle		= False

	oHTMLFunctions = new HTMLFunctions

	# Full Screen 
		lFullScreen = False 
		oDockGoalDesigner = NULL

	# List of opened interaction pages windows IDs
		aInteractionPagesWindows = []

	# Save Flag (To display a message : Save changes?)
		lSaveFlag = False

	# For coping the buffer used for cut/copy/paste steps 
		aBackupBuffer 		= []
		aBackupInteraction 	= []

	# Font Dialog
		oFontDialog 

	# Don't display File Dialog when creating new files 
		lNoFileDialogWhenCreatingNewFiles = True 

	# Auto Run the Program after any update 
		lAutoRun = C_STEPSTREE_AUTORUN  

	# Don't support Eval for loading new components 
		lNoDynamicComponents = True 

	# Don't display the step code 
		lHideStepCodeTab = C_STEPSTREE_HIDESTEPCODETAB

	# Show/Hide the Time Machine Options 
		lShowTimeMachine = C_STEPSTREE_SHOWTIMEMACHINE

	# Avoid the Components Browser 
		lAvoidComponentsBrowser	= C_STEPSTREE_AVOIDCOMPONENTSBROWSER

	# Avoid the Components Browser Auto Complete
		lAvoidComponentsBrowserAutoComplete = C_STEPSTREE_AVOIDCOMPONENTSBROWSERAUTOCOMPLETE

	# Components Browser - Always Show The Seach Window
		lComponentsBrowserAlwaysShowSearchWindow = C_STEPSTREE_COMPONENTSBROWSERALWAYSSHOWSEARCHWINDOW

	# Enable/Disable saving History (For Undo operations)
		lHistory = True

	# AutoComplete Cache 
		nAutoCompleteStepsTreeCache   = 0  # Steps Tree (Nodes Count)
		nAutoCompleteFormObjectsCache = 0  # Form Designer (Objects Count)

	/*
		Purpose : Show the Window
		Parameters : None
		Output : None
	*/

	func Start
		if lHideStepCodeTab {
			oView.oTab.tabbar().hide()
		}
		ShowTimeMachine(lShowTimeMachine)
		oView.Show()



	/*
		Purpose 	: The window is active, Default Settings.
		Parameters 	: None
		Output	 	: None
	*/

	func Activate
		# Just Load the Components 
			if lLoadComponents {
				oSystemLog.addMessage("Start - load components browser components")
				LoadComponentsBrowserComponents()
				oSystemLog.addMessage("End - load components browser components")
			}
		# Open Components Browser

			if (lComponentsBrowserInGoalDesigner or PWCTIsMobile(:ComponentsBrowser) ) and lCallInteract {
				InteractAction()
				lCallInteract = False			
			}

	func SetFocusToStepsTree
		oView.win.ActivateWindow()
		oView.oStepsTree.SetFocus(0)


	/*
		Purpose : Add Step
		Parameters : Step Name
		Output : Item Object
	*/

	func AddStep cStepName
		# Save the History for undo operations 
			saveHistory()
		cPlainStepName = oHTMLFunctions.PlainText(cStepName)
		oItem  = oView.oStepsTree.currentItem()
		nParentID = oView.oStepsTree.GetIDByObj(oItem)

		nParentID_2 = nParentID
		nInsertIndex = -1
		if not AllowInteractButton() {
			nInsertIndex = oItem.parent().indexofchild(oItem) + 1
			nParentID = oModel.getStepParent(nParentID)
		}

 		nStepID = oModel.AddStepAfterStep(nParentID,[
				:name = cStepName,
				:active = True , 
				:code = "" , 
			 	:interactionid = oModel.oInteractionModel.AddUserInteraction() ,
				:visible = True , 
				:stepnumber = 1 ,
				:steptype = C_STEPTYPE_COMMENT,
				:plainname = cPlainStepName
			],
			nParentID_2
		)
		SetStepColor(C_STEPTYPE_COMMENT)

		if nInsertIndex = -1 {
			oItem = oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
		else 
			oItem = oView.oStepsTree.InsertStep(nParentID,nStepID,cStepName,nInsertIndex)
		}
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
		cPlainStepName = oHTMLFunctions.PlainText(cStepName)
		oItem  = oView.oStepsTree.currentItem()
		nParentID = oView.oStepsTree.GetIDByObj(oItem)

		nParentID_2 = nParentID
		nInsertIndex = -1
		if nStepNumber = 1 {
			if not AllowInteractButton() {
				oItem = oView.oStepsTree.GetObjByID(nParentID)
				nInsertIndex = oItem.parent().indexofchild(oItem) + 1
				nParentID = oModel.getStepParent(nParentID)
			}
		}


 		nStepID = oModel.AddStepAfterStep(nParentID,[
				:name = cStepName,
				:active = True , 
				:code = "" , 
			 	:interactionid = nIID ,
				:visible = True , 
				:stepnumber = nStepNumber ,
				:steptype = nStepType,
				:plainname = cPlainStepName 
			],
			nParentID_2
		)
		SetStepColor(nStepType)

		cStepName = ProcessStepName(cStepName)

		if nInsertIndex = -1 {
			oItem = oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
		else 
			oItem = oView.oStepsTree.InsertStep(nParentID,nStepID,cStepName,nInsertIndex)
		}
		UpdateTheTimeMachine()
		return oItem

	func ProcessStepName cStepName 
		cCurrentFileDir = JustFilePath(oVisualSourceFile.cFileName)
		cStepName = substr(cStepName,"#{PWCT_CURRENT_PATH}",cCurrentFileDir)
		return cStepName

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
		if nStepID != -1 {
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
		//if not AllowInteractButton() {
			# "Can't Add New Step in this location!"
		//	ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTADD)
		//	return
		//}
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
			lSaveFlag = True
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
			cPlainStepName = oHTMLFunctions.PlainText(cText)
			nStepType = oModel.GetStepType(nStepID)
			SetStepColor(nStepType)
			oView.oStepsTree.editstep(oItem,cText,this.oModel.GetStepIgnoreStatus(nStepID))
			oModel.EditStepName(nStepID,cText,cPlainStepName)
			lSaveFlag = True
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
		if ! isWebAssembly() {
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
		}
		# Save the History for undo operations 
			saveHistory()
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# Delete All Steps
			# Remove the current Steps From the Tree Control
				oView.oStepsTree.clear()
				oView.oStepsTree.aTree = []
				oView.oStepsTree.AddStartPoint()
			SaveBuffer()
			oModel = new GoalDesignerModel
			RestoreBuffer()
		else
			oView.oStepsTree.DelByObj(oItem)	# Remove it from the [oItem|ID] List
			oItem.parent().takechild(oItem.parent().indexofchild(oItem))
			oModel.DeleteStep(nStepID)
		}
		# Update the Time Machine
			UpdateTheTimeMachine()
		lSaveFlag = True
		AutoRun()

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
		# Save the History for undo operations 
			saveHistory()
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
		lSaveFlag = True
		AutoRun()

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
		# Save the History for undo operations 
			saveHistory()
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
		lSaveFlag = True
		AutoRun()

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
		# Save the History for undo operations 
			saveHistory()
		oModel.CutStep(nStepID)
		oView.oStepsTree.SaveStep(oItem)
		oItem.parent().takechild(oItem.parent().indexofchild(oItem))
		# Update the Time Machine
			UpdateTheTimeMachine()
		lSaveFlag = True
		AutoRun()

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

		if oView.oStepsTree.isbuffernotempty() = false {
			return
		}
		# Time Machine - Present
			TimeMachineGotoPresent()
		# Save the History for undo operations 
			saveHistory()
		# Check Rules before the Paste Operation 
		# We commented this to avoid low performance problem
		/*
			aPasteRoots = oModel.getpasteTopComponents()
			for cComponent in aPasteRoots {
				if not RulesAllow(cComponent) {
					return
				}
			}
		*/
		oParentItem  = oView.oStepsTree.currentItem()
		nParentStepID = oView.oStepsTree.GetIDByObj(oParentItem)

		# When we paste in a location (Not Start Here)
		# We paste after the selected step 
			nParentStepID_2 = nParentStepID
			nInsertIndex = -1
			if not AllowInteractButton() {
				nParentStepID = oModel.getStepParent(nParentStepID)
				nInsertIndex = oParentItem.parent().indexofchild(oParentItem) + 1		
				oParentItem = oView.oStepsTree.GetObjByID(nParentStepID)
			}

		oModel.PasteStepAfterStep(nParentStepID,nParentStepID_2)
		oNewParentItem = oView.oStepsTree.PasteStepAfterStep(oParentItem,nInsertIndex)
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
		lSaveFlag = True
		AutoRun()


	/*
		Purpose : Increase Size Action
		Parameters : None
		Output : None
	*/

	func IncreaseSizeAction
		oView.oStepsTree.IncreaseFontSize()
		oView.oStepCode.IncreaseFontSize()
		ReflectChangeInFontSize()

	/*
		Purpose : Decrease Size Action
		Parameters : None
		Output : None
	*/

	func DecreaseSizeAction
		oView.oStepsTree.DecreaseFontSize()
		oView.oStepCode.DecreaseFontSize()
		ReflectChangeInFontSize()

	/*
		Purpose : Reflect changes in font in the environment
	*/
	func ReflectChangeInFontSize
		if ! C_PROPERTIES_REFLECTCHANGEINFONTSIZE {
			return
		}
		# Set default font size for the Environment, To be used when we open another files
			parent() {
				nFontSize = this.oView.oStepsTree.nFontSize
				ComponentsBrowserFont()
				OutputWindowFont()
				ComponentsFont()
				FilesTreeFont()
			}


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
		# Save the History for undo operations 
			saveHistory()	
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nIgnore = oModel.IgnoreStep(nStepID)
		oView.oStepsTree.IgnoreStep(oItem,nIgnore)
		lSaveFlag = True
		AutoRun()

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
		CloseAllInteractionPages()
		oView.win.setUpdatesEnabled(False)
		oTMController.ChangeTimeMachinePoint(oView,oModel)
		oView.win.setUpdatesEnabled(True)
		AutoRun()

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
				UpdateSearchField(cText)
			}
		elseif nKey = 63	# writing ? operator 
				UpdateSearchField(cText)
		}
		oView.oTreeFilter.setEventOutput(False)

	func UpdateSearchField cText 
		if lFullScreen or lAvoidComponentsBrowser {
			oView.oTextSearch.setText(Lower(cText))			
			oView.oTextSearch.setfocus(0)
			SpecialSearch()
		else 
			if InteractAction() {
				ComponentsBrowserWindow().oView.oTextSearch.setText(Lower(cText))			
				ComponentsBrowserWindow().SearchAction()
			}
		}

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
				if oView.lUseNewCommentButton {
					AddStepAction()
				}
			case 80		# CTRL+P
				PrintStepsAction()		
			case 16777223  	# DEL
				DeleteStepAction()
			case 69		# CTRL+E
				oItem  = oView.oStepsTree.currentItem()
				nStepID = oView.oStepsTree.GetIDByObj(oItem)
				nStepType = oModel.GetStepType(nStepID)
				if ( nStepType = C_STEPTYPE_COMMENT ) and 
					oView.lUseNewCommentButton {
						EditStepAction()
				else	
					ModifyAction()
				}
			case 67		# CTRL+C
				CopyStepsAction()
			case 73		# CTRL+I
				IgnoreStepAction()
			case 76 
				EditAllStepsAction()
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
			if (! isWebAssembly()) and  ! lNoFileDialogWhenCreatingNewFiles  {
				new qfiledialog(oView.win) {
					cFileName = getsavefilename(this.oView.win,"New File",currentdir(),T_GD_DM_FILETYPE)
				}
				if cFileName = NULL { return }
			else 
				cFileName = "noname.pwct"
			}
			# Remove the file from the Active Files List 
				parent().RemoveFileFromActiveFilesList(lower(oVisualSourceFile.cFileName))
			oVisualSourceFile.cFileName = cFileName
		# Clear the History 
			clearHistory()
		# Remove the current Steps From the Tree Control
			oView.oStepsTree.clear()
			oView.oStepsTree.aTree = []
			oView.oStepsTree.AddStartPoint()
		# Create new Model (Steps Tree and Interactions)
			SaveBuffer()
			oModel = new GoalDesignerModel
			RestoreBuffer()
		# Create the file
			SaveFileAction2()
		# Update the Time Machine
			UpdateTheTimeMachine()
		# Set the docable widget title
			oView.win.ParentWidget().setWindowTitle(cFileName)


	/*
		Purpose : Save Current File Action
		Parameters : None
		Output : None
	*/

	func SaveCurrentFileAction
		lSaveFlag = False
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

	func SaveBuffer
		aBackupBuffer = oModel.oStepsTreeModel.aBuffer 
		aBackupInteraction = oModel.oInteractionModelBuffer 

	func RestoreBuffer
		oModel.oStepsTreeModel.aBuffer  = aBackupBuffer
		oModel.oInteractionModelBuffer  = aBackupInteraction

	func OpenFileAction2
		CloseAllInteractionPages()
		# Clear the History 
			clearHistory()
		nClock = clock()
		# Get Data From the Visual Source File
			oSystemLog.addMessage("Start - Get data from visual source file")
			oVisualSourceFile.Open()
			# The next call consumes 40 MB on file with 5000 steps ! very bad!
				oVisualSourceFile.LoadTables()
			aStepsTree    =  oVisualSourceFile.GetStepsTreeTable()
			aInteractions =  oVisualSourceFile.GetInteractionsTable()
			nStepsIDCounter = oVisualSourceFile.GetStepsID()
			nInteractionsIDCounter = oVisualSourceFile.GetInteractionsID()
			oVisualSourceFile.Close()
			oSystemLog.addMessage("End - Get data from visual source file")
		# Update Objects
			oSystemLog.addMessage("Start - Update Objects")
			SaveBuffer()
			oModel.oStepsTreeModel = new TreeModel 
			oModel.oInteractionModel = new InteractionModel
			RestoreBuffer()
			oModel.oStepsTreeModel.SetData(aStepsTree)
			oModel.oInteractionModel.SetData(aInteractions)
			oModel.oStepsTreeModel.SetID(nStepsIDCounter)
			oModel.oInteractionModel.SetID(nInteractionsIDCounter)
			oSystemLog.addMessage("End - Update Objects")
		# Refresh Steps Tree
			oSystemLog.addMessage("Start - Refresh Steps Tree")
			RefreshStepsTree2(aStepsTree)
			oSystemLog.addMessage("End - Refresh Steps Tree")
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
		# Borders around steps
			oView.oStepsTree.lLabelStyle = C_PROPERTIES_BORDERSAROUNDSTEPS
		# Indentation 
			oView.oStepsTree.setIndentation(C_STEPSTREE_INDENTATION)
		# Set the font
			oView.oStepsTree.PrepareFont()
		# Remove the current Steps From the Tree Control
			oView.oStepsTree.clear()
			oView.oStepsTree.aTree = []
			oView.oStepsTree.AddStartPoint()
		# Add Steps to the Tree
			if lUseSuperSerialAdd {
				SuperSerialAdd(aStepsTree)
			else
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
			}

		# Update the Time Machine
			UpdateTheTimeMachine()
		oView.oStepsTree.setUpdatesEnabled(True)
		oView.oStepsTree.blockSignals(False)
		# Using setExpanded() takes a lot of time with qTreeWidget when using Labels in QTreeWidgetItem
			oView.oStepsTree.oFirstStep.SetExpanded(True)
		
	/*
		Purpose : Quickly add many steps to the Steps Tree 
			  This function increase the performance 	
		Parameters : The steps Tree
		Output : None
	*/

	func SuperSerialAdd aStepsTree
		oSystemLog.addMessage("Start - super serial add for tree nodes")
		if lCreateNewStepsTree {
			oView.oStepsTree.close()
			oView.oStepsTree.delete()
			oView.CreateStepsTree(self)
		}
		// Using parent().goaldesignerFont() is slow 
		// parent().goaldesignerFont()
		nMax = len(aStepsTree) 
		lSuperSerialAddExpandSteps = ! (nMax > nMaxStepsCountForExpandSteps)
		if nMax > this.nMaxStepsCount and lUseMaxStepsCount {
			oView.oStepsTree {
				lUseLabels = False
				setStyleSheet(this.oView.StepsTreeWhiteAndBlackStyle(nFontSize))
			}
		else 
			oView.oStepsTree {
				lUseLabels = True
				setstylesheet(this.oView.StepsTreeStyle())
			}
		}
		oView.oStepsTree.preparetempfont()
		oTempFont = oView.oStepsTree.oTempFont
		# A flag to know if we are starting from a step (Not Start Here)
			lUpdateParent = not AllowInteractButton()
		# How many Root steps, for example using (x=10 y=20 z=30) 
		# will lead to three roots 
		# if we don't use (nRootsCount) we could get steps in wrong order 
		# like (z=30 y=20 z=10) when we insert them 
			nRootsCount = 0
		for x = 2 to nMax {
			aStep = aStepsTree[x]
			nID		= aStep[C_TREEMODEL_NODEID]
			nParentID	= aStep[C_TREEMODEL_PARENTID]
			cText		= aStep[C_TREEMODEL_CONTENT][:name]
			cPlainText	= aStep[C_TREEMODEL_CONTENT][:plainname]
			lIgnore		= not aStep[C_TREEMODEL_CONTENT][:active]
			nStepType	= aStep[C_TREEMODEL_CONTENT][:steptype]
			nInsertIndex = -1
			# Process Step Name (To support displaying images)
				cText = processStepName(cText)
			# When we add step in location that doesn't support children (Not Start Here)
				if lUpdateParent and aStep[C_TREEMODEL_PARENTID] = aStepsTree[2][C_TREEMODEL_PARENTID] {
					oItem = oView.oStepsTree.GetObjByID(nParentID)
					nInsertIndex = oItem.parent().indexofchild(oItem) + nRootsCount + 1
					nParentID = oModel.getStepParent(nParentID)
					nRootsCount++
				}
			oView.oStepsTree {
				if nMax <= this.nMaxStepsCount or not this.lUseMaxStepsCount {
					SetStepColor(nStepType)
				}
				# GetObjByID() consumes 0.08 second per 100 steps 
					oParent = GetObjByID(nParentID)
				if lIgnore {
					cImage = C_LABELIMAGE_IGNORESTEP
				else
					cImage = C_LABELIMAGE_NODEICON
				}
				oItem = new qtreewidgetitem() 
				if nMax < this.nMaxStepsCount or not this.lUseMaxStepsCount {
					oLabel = new qLabel(self) 
					# Changing label Size have a notable effect on performance!
						oLabel.resize(0,0)
					oLabel.setFont(oTempFont)
					if this.lStepColorOldStyle {
						oLabel.setMaximumWidth(12*len(cPlainText))
						oLabel.setStyleSheet("color:"+cColor+";background-color:"+cBackColor+";")
						oLabel.setText(cPlainText)
					else 
						cText = substr(substr(cText,"C_STEPCOLOR_DATA_TEXT",C_STEPCOLOR_DATA_TEXT),
							"C_STEPCOLOR_DATA_BACKCOLOR",C_STEPCOLOR_DATA_BACKCOLOR)
						cImageCode = ""
						if C_STEPSTREE_NODEICON {
							cImageCode = "<img src='"+cImage+"'> "
						else 
							if lIgnore {
								cImageCode = C_COMMENTMARK
							}
						}
						oLabel.settext(cImageCode+
							`<span style="background-color:`+cBackColor+
							`"><font color="`+cColor+`">`+cText+
							`</font></span>`)					
						NewLabelStyle(oLabel,[:StepType=nStepType])
					}
					if nInsertIndex = -1 {
						oParent.addchild(oItem)
					else 
						oParent.insertchild(nInsertIndex,oItem)
					}
					setItemWidget(oItem,0,oLabel)
				else 
					if lIgnore {
						cPlainText = C_COMMENTMARK + cPlainText
					}
					oItem.setText(0,cPlainText)
					if nInsertIndex = -1 {
						oParent.addchild(oItem)
					else 
						oParent.insertchild(nInsertIndex,oItem)
					}
				}
				AddToTree(nID,oItem)
				if this.lSuperSerialAddExpandSteps or x < this.nMinStepsToExpand {
					oItem.setExpanded(True)
				else 
					oItem.setExpanded(False)
				}
			}
			if lShowLoadingProgress {
				if x % 100 = 0 {
					showmessageInStatusBar("Loading : " + floor((x/nMax)*100) + "%")
					oView.oStepsTree.setUpdatesEnabled(True)
					oView.oStepsTree.blockSignals(False)
					PWCT_APP.processevents()
					oView.oStepsTree.setUpdatesEnabled(False)
					oView.oStepsTree.blockSignals(True)
				}
			}
		}
		oSystemLog.addMessage("End - super serial add for tree nodes")

	/*
		Purpose : Start New Interaction
		Parameters : None
		Output : None
	*/

	func InteractAction
		 if not AllowInteractButton() {
			# "Can't start new Interaction from this step!"
			// ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTINTERACT)
			// return False
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
		if lNoDynamicComponents {
			return 
		}
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
			if oView.lUseNewCommentButton and	
				IsComment() { 
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
			ModifyAction2(nStepID)

	func ModifyAction2 nStepID
		# Check Step Type
			openComponent(nStepID)
		# Display the Window 
			if lInteractionPagesInGoalDesigner {
				oView.layoutVPages.InsertWidget(0,Last_Window().oView.win,0,0)
				Last_Window().Start()		# Show The Window
				oView.widgetVPages.Show()	# Show the Splitter Widget
				oView.oVPagesScroll.Show()
			else
				Last_Window().Start()		# Show The Window
			}
			RegisterInteractionPage()
			nInteractionPagesToModifyCount++
			Last_Window().InternalAfterOpen()
			Last_Window().AfterOpen()

	func RegisterInteractionPage
		# Add the window ID to the interaction pages list
			aInteractionPagesWindows + Last_Window().ObjectID()

	func CloseAllInteractionPages
		for nWindowID in aInteractionPagesWindows {
			nPos = Get_Window_Pos(nWindowID)
			if nPos != 0 {
				GetObjectByID(nWindowID).closeAction()
			}
		}
		aInteractionPagesWindows = []
		oView.widgetVPages.Hide()
		oView.oVPagesScroll.Hide()
		nInteractionPagesToModifyCount = 0

	func RefreshInteractionPagesColors
		for nWindowID in aInteractionPagesWindows {
			nPos = Get_Window_Pos(nWindowID)
			if nPos != 0 {
				GetObjectByID(nWindowID).oView.setTitleColors()
			}
		}


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
			oView.oVPagesScroll.Hide()
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
		Run web application 
	*/

	func RunInBrowser
		setProgramControllerFileName()
		oProgramController.RunInBrowser(self)

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
			setFontSelectedEvent(this.Method(:FontAction2))
			if isWebAssembly() {
				ShowFullScreen()
			else 
				show()
			}
		}

	func FontAction2
		cFont = oFontDialog.selectedfont().tostring()
		UpdateFont()


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
		# Close All Interaction Pages 
			CloseAllInteractionPages()
		# Remove the file from the Active Files List 
			parent().RemoveFileFromActiveFilesList(oVisualSourceFile.cFileName)
		# Remove the current Steps From the Tree Control
			oView.oStepsTree.clear()
			oView.oStepsTree.aTree = []
			oView.oStepsTree.AddStartPoint()
		# Create new Model (Steps Tree and Interactions)
			SaveBuffer()
			oModel = new GoalDesignerModel
			RestoreBuffer()
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
		Purpose : Get Parents List from the Current Step to the Start Point
		Parameters : None
		Output : List contains the component name of each parent
	*/

	func GetParentsList 
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 {	# start point
			return ["SP"]
		}
		aParents = []
		while nStepID != 1  {
			nIID = oModel.GetInteractionID(nStepID)
			cFile = oModel.GetInteractionComponent(nIID)
			aParents + cFile
			nStepID = oModel.getStepParent(nStepID)
		}
		aParents + "SP"
		return aParents 

	func GetChildrenOneLevel
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		aList = oModel.oStepsTreeModel.ChildrenoneLevel(nStepID)
		aComponents = []
		for nStepID in aList { 
			nIID = oModel.GetInteractionID(nStepID)
			cFile = oModel.GetInteractionComponent(nIID)
			aComponents + cFile
		}
		return aComponents 
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
			oChild.setParentObject(self)
			lCheck = oChild.CheckAllowParent(cParentComponentName,nStepNumber)
			if not lCheck { return false } 
		# Check that the parent component accept the current component 
			if cParentComponentName = "SP" { return True }
			oParent = GetComponentObject(cParentComponentName)
			oParent.setParentObject(self)
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


	/*
		Used to prepare the step name before adding it to the steps tree 
		small visual source file --> no change 
		large visual source file --> remove HTML 
	*/
	func prepareStepName cStep
		return oView.oStepsTree.prepareStepName(cStep)


	/*
		Check if we have active visual source file
	*/
	func IsActiveFile
		if oVisualSourceFile.cFileName = "noname.pwct" {
			return False 
		} 
		return True
	/*
		Get the Active visual File Name (*.pwct) from the visual source file object 
	*/

	func GetActiveFile 
		return oVisualSourceFile.cFileName

	/*
		Get the Active source file name (*.ring) 
	*/

	func GetActiveSourceFile 
		cActiveFileName = GetActiveFile()
		cActiveFileName = substr(cActiveFileName,".pwct",".ring")
		return cActiveFileName

	/*
		Switch goal designer window to full screen or switch full screen to window 
	*/

	func FullScreen
		if lFullScreen = False {
			lFullScreen = True 
			oView.win.setparent(NULL)
			oView.win.showFullScreen()
			oDockGoalDesigner.hide()
			oView.oStepsTree.setFocus(0)
		else 
			lFullScreen = False 
			oDockGoalDesigner.setWidget(oView.win)
			oDockGoalDesigner.show()
			oDockGoalDesigner.raise()
		}


	/*
		Time Machine - Play As Movie 
	*/
	func PlayMovie 
		oPlayAsMovie.PlayMovie(self)

	/*
		The Play Movie Timer 
	*/
	func PlayMovieTimer
		oPlayAsMovie.PlayMovieTimer(self)

	/*
		Set the Save Flag (For Save Changes? message)
	*/
	func SetSaveFlag
		lSaveFlag = True

	/*
		Display Messagebox (Yes/No) to save the changes to the current file
	*/
	func CheckSavingTheFile
		if isWebAssembly() {
			return 
		}
		if lSaveFlag {
			lSaveFlag = False
			new qmessagebox(oView.win)
			{
                		setwindowtitle(T_ENV_SAVE)  # "Save"
                		settext(T_ENV_SAVECHANGES)  # "Save Changes?"
                		setstandardbuttons(QMessageBox_Yes | QMessageBox_No)
                		result = exec()
		          	this.oView.win {
                        		if result = QMessageBox_No {
						return 
                        		}
                		}
			}
			SaveCurrentFileAction()
		}

	func AutoRun
		if lAutoRun {
			RunGUIAction()
		}


	func EditAllStepsAction
		oItem  = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		aChildren = oModel.oStepsTreeModel.ChildrenIDs(nStepID)
		insert(aChildren,0, nStepID)
		aSteps = []
		for nStep in aChildren {
			if oModel.GetStepType(nStep) = C_STEPTYPE_ROOT {
				aSteps + nStep
			}
		}
		aSteps = reverse(aSteps)
		for nStep in aSteps {
			ModifyAction2(nStep) 
			PWCT_APP.processevents()
		}

	func showTimeMachine nStatus 
		if nStatus {
			oView.sliderTimeMachine.show()
			oView.btnPlay.show()
			if not PWCTIsMobile(:TimeMachineLabel) {
				oView.labelTM.show()
			}
		else 
			oView.sliderTimeMachine.hide()
			oView.btnPlay.hide()
			if not PWCTIsMobile(:TimeMachineLabel) {
				oView.labelTM.hide()
			}
		}

	func SpecialSearch
		cFind = oView.oTextSearch.text()
		if trim(cFind) = "" {
			ComponentsBrowserWindow().QuickMsg().hide()
			oView.oStepsTree.setFocus(0)
			return 
		}
		cFind = ComponentsBrowserWindow().isSearchFindComponent(cFind)[2]
		ComponentsBrowserWindow().QuickMsg().setText(cFind)
		ComponentsBrowserWindow().QuickMsg().centerTheWindow()
		ComponentsBrowserWindow().QuickMsg().show()
		# The next code is a workaround in a bug in Qt for WebAssembly 
		# Because the LineEdit lost the focus for the QuickMsg window 
		# And we want to keep it 
		ComponentsBrowserWindow().QuickMsg().oView.win.activatewindow()
		oView.oTextSearch.activatewindow()
		oView.oTextSearch.setFocus(7)

	func SpecialSearchEnterPressAction
		oView.oTextFilter.setEventOutput(False)
		if oView.oTextFilter.getKeyCode() = 16777220 {	
			ComponentsBrowserWindow().QuickMsg().hide()
			cFind = oView.oTextSearch.text()
			if ! ComponentsBrowserWindow().FindAndSelectComponent(cFind) {
				ComponentsBrowserWindow().TextualCodeToVisualCode(cFind)
				oView.oStepsTree.setFocus(0)
			}
		}

	/*
		Methods for the Undo operation 
	*/

	func saveHistory 
		if lHistory {
			oUndo.AddToHistory(self)
		}

	func undo 
		oUndo.undo(self)

	func enableHistory 
		lHistory = True

	func disableHistory 
		lHistory = False

	func clearHistory
		oUndo.clearHistory()

	/*
		Goto Line
	*/

	func GotoLine 
		Open_Window(:GotoLineController)
		Last_Window().setParentObject(self)

	/*
		Select step using the Step Name
	*/
	func SelectStepByName cName
		aTree = oModel.oStepsTreeModel.GetData()
		for item in aTree {
			aContent = item[C_TREEMODEL_CONTENT]
			cStepName = aContent[:name]
			cStepName = trim(oModel.RemoveTags(cStepName))
			if cStepName = cName {
				oItem = oView.oStepsTree.GetObjByID(item[C_TREEMODEL_NODEID])
				oView.oStepsTree.SetCurrentItem(oItem,0)				
				exit
			}
		}	

	/*
		Create Event Methods Automatically 
		After adding the event in the form designer 
	*/

	func NewEventName cFunctionName
		cFunctionName = trim(cFunctionName)
		# Be sure that we have saved form file 
			if parent().FormDesigner().ActiveFileName() = "" { return }
		# Be sure that the Controller class source code is opened
			cFileNameInFormDesigner = substr(parent().FormDesigner().ActiveFileName(),".rform","Controller.pwct")
			if trim(lower(oVisualSourceFile.cFileName)) != trim(lower(cFileNameInFormDesigner)) {
				return 
			}
		# Be sure that the event code doesn't contains (, ', ", ` and spaces
			if substr(cFunctionName," ") or 			
			   substr(cFunctionName,"'") or 
			   substr(cFunctionName,'"') or 
			   substr(cFunctionName,"`") or 
			   substr(cFunctionName,"(") {
				return 
			}
		# Select the Step (Methods) as parent 
			 SelectStepByName("Methods")
		# Create the Event Code
			cStr = WindowsNL() + 
				Tab + "func " + cFunctionName + WindowsNL() +
				Tab + Tab + "oView {" + WindowsNL() +
				Tab + Tab + Tab + WindowsNL() + 
					Tab + Tab + "}" + WindowsNL()
		ComponentsBrowserWindow().TextualCodeToVisualCode(cStr)
