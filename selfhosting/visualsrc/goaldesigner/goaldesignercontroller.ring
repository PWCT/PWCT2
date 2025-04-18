#/*
#**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose 	: Goal Designer Controller Class
#**	Date 		: 2016.11.20
#**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
#*/
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
			lInteractionPagesInGoalDesigner = !C_STEPSTREE_OPENINTERACTIONSINNEWWINDOWS
	} 
	if PWCTIsMobile(:ComponentsBrowser) { 
		lComponentsBrowserInGoalDesigner = False
		lCallInteract = False
		else
			lComponentsBrowserInGoalDesigner = True
			lCallInteract = True
	} 
	lLoadComponents = True
	#Increase performance when adding many steps
	lUseSuperSerialAdd = True
	#Creating new steps tree conflict with storing steps tree object in Environment Object to switch between dockable windows of goal designers
	lCreateNewStepsTree = False
	#Max Steps that uses Colors
	nMaxStepsCount = 3000
	lUseMaxStepsCount = True
	#Show loading progress
	lShowLoadingProgress = True
	#Expand Steps when opening files
	lSuperSerialAddExpandSteps = True
	nMaxStepsCountForExpandSteps = 1200
	nMinStepsToExpand = 50
	#Steps Color - Old Style (PWCT 1.9)
	lStepColorOldStyle = False
	#Full Screen
	oHTMLFunctions = new HTMLFunctions
	lFullScreen = False
	oDockGoalDesigner = NULL
	#List of opened interaction pages windows IDs
	aInteractionPagesWindows = []
	#Save Flag (To display a message : Save changes?)
	lSaveFlag = False
	#For coping the buffer used for cut/copy/paste steps
	aBackupBuffer = []
	aBackupInteraction = []
	#Font Dialog
	oFontDialog
	#Don't display File Dialog when creating new files
	lNoFileDialogWhenCreatingNewFiles = True
	#Auto Run the Program after any update
	lAutoRun = C_STEPSTREE_AUTORUN
	#Don't support Eval for loading new components
	lNoDynamicComponents = True
	#Don't display the step code
	lHideStepCodeTab = C_STEPSTREE_HIDESTEPCODETAB
	#Show/Hide the Time Machine Options
	lShowTimeMachine = C_STEPSTREE_SHOWTIMEMACHINE
	#Avoid the Components Browser
	lAvoidComponentsBrowser = C_STEPSTREE_AVOIDCOMPONENTSBROWSER
	#Avoid the Components Browser Auto Complete
	lAvoidComponentsBrowserAutoComplete = C_STEPSTREE_AVOIDCOMPONENTSBROWSERAUTOCOMPLETE
	#Components Browser - Always Show The Seach Window
	lComponentsBrowserAlwaysShowSearchWindow = C_STEPSTREE_COMPONENTSBROWSERALWAYSSHOWSEARCHWINDOW
	#Enable/Disable saving History (For Undo operations)
	lHistory = True
	#AutoComplete Cache
	nAutoCompleteStepsTreeCache = 0
	#Steps Tree (Nodes Count)
	nAutoCompleteFormObjectsCache = 0
	#Form Designer (Objects Count)
	#/*
	#		Purpose : Show the Window
	#		Parameters : None
	#		Output : None
	#	*/
	func Start  { 
		if lHideStepCodeTab { 
			oView.oTab.tabbar().hide()
		} 
		ShowTimeMachine(lShowTimeMachine)
		oView.oStepsTree.nGoalDesignerWindowID = ObjectID()
		#/*
		#		Purpose 	: The window is active, Default Settings.
		#		Parameters 	: None
		#		Output	 	: None
		#	*/
		oView.Show()
	} 
	func Activate  { 
		#Just Load the Components
		if lLoadComponents { 
			oSystemLog.addMessage("Start - load components browser components")
			LoadComponentsBrowserComponents()
			oSystemLog.addMessage("End - load components browser components")
		} 
		#Open Components Browser
		if (lComponentsBrowserInGoalDesigner OR PWCTIsMobile(:ComponentsBrowser)) AND lCallInteract { 
			InteractAction()
			lCallInteract = False
		} 
	} 
	func SetFocusToStepsTree  { 
		oView.win.ActivateWindow()
		oView.oStepsTree.SetFocus(0)
		#/*
		#		Purpose : Add Step
		#		Parameters : Step Name
		#		Output : Item Object
		#	*/
	} 
	func AddStep cStepName { 
		#Save the History for undo operations
		saveHistory()
		cPlainStepName = oHTMLFunctions.PlainText(cStepName)
		oItem = oView.oStepsTree.currentItem()
		nParentID = oView.oStepsTree.GetIDByObj(oItem)
		nParentID_2 = nParentID
		nInsertIndex = -1
		if  NOT AllowInteractButton() { 
			nInsertIndex = oItem.parent().indexofchild(oItem)+1
			nParentID = oModel.getStepParent(nParentID)
		} 
		nStepID = oModel.AddStepAfterStep(nParentID,[:name = cStepName,:active = True,:code = "",:interactionid = oModel.oInteractionModel.AddUserInteraction(),:visible = True,:stepnumber = 1,:steptype = C_STEPTYPE_COMMENT,:plainname = cPlainStepName],nParentID_2)
		SetStepColor(C_STEPTYPE_COMMENT)
		if nInsertIndex = -1 { 
			oItem = oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
			else
				oItem = oView.oStepsTree.InsertStep(nParentID,nStepID,cStepName,nInsertIndex)
		} 
		UpdateTheTimeMachine()
		return oItem
		#/*
		#		Purpose : Add Generated Step Interaction
		#		Parameters : The component Name
		#		Output : Interaction ID
		#	*/
	} 
	func AddGeneratedInteraction cComponent { 
		return oModel. oInteractionModel. AddGeneratedInteraction( cComponent ) 
		#/*
		#		Purpose : Save Variables Values
		#		Parameters : Interaction ID and Variables Values
		#		Output : None
		#	*/
	} 
	func SaveVariablesValues nIID,cVariablesValues { 
		oModel.oInteractionModel.SaveVariablesValues(nIID,cVariablesValues)
		#/*
		#		Purpose : Add Generated Step
		#		Parameters : Step Name, Interaction ID, Step Number and Step Type
		#		Output : Item Object
		#	*/
	} 
	func AddGeneratedStep cStepName,nIID,nStepNumber,nStepType { 
		cPlainStepName = oHTMLFunctions.PlainText(cStepName)
		oItem = oView.oStepsTree.currentItem()
		nParentID = oView.oStepsTree.GetIDByObj(oItem)
		nParentID_2 = nParentID
		nInsertIndex = -1
		if nStepNumber = 1 { 
			if  NOT AllowInteractButton() { 
				oItem = oView.oStepsTree.GetObjByID(nParentID)
				nInsertIndex = oItem.parent().indexofchild(oItem)+1
				nParentID = oModel.getStepParent(nParentID)
			} 
		} 
		nStepID = oModel.AddStepAfterStep(nParentID,[:name = cStepName,:active = True,:code = "",:interactionid = nIID,:visible = True,:stepnumber = nStepNumber,:steptype = nStepType,:plainname = cPlainStepName],nParentID_2)
		SetStepColor(nStepType)
		cStepName = ProcessStepName(cStepName)
		if nInsertIndex = -1 { 
			oItem = oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
			else
				oItem = oView.oStepsTree.InsertStep(nParentID,nStepID,cStepName,nInsertIndex)
		} 
		UpdateTheTimeMachine()
		return oItem
	} 
	func ProcessStepName cStepName { 
		cCurrentFileDir = JustFilePath(oVisualSourceFile.cFileName)
		cStepName = substr(cStepName,"#{PWCT_CURRENT_PATH}",cCurrentFileDir)
		return cStepName
		#/*
		#		Purpose : Set Step Color
		#		Parameters : Step Type
		#		Output : None
		#	*/
	} 
	func SetStepColor nStepType { 
		oView.oStepsTree.SetStepColor(nStepType)
		#/*
		#		Purpose : Select Step
		#		Parameters : Interaction ID and Step Number
		#		Output : List contains the Item Object and the Step ID
		#	*/
	} 
	func SelectStep nIID,nStepNumber { 
		nStepID = oModel.GetStepIDbyIID(nIID,nStepNumber)
		oItem = NULL
		if nStepID! = -1 { 
			oItem = oView.oStepsTree.GetObjByID(nStepID)
		} 
		return [oItem, nStepID]
		#/*
		#		Purpose : Use the Time Machine to go to Present
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func TimeMachineGotoPresent  { 
		oTMController.TimeMachineGotoPresent(oView,oModel)
		#/*
		#		Purpose : Update The Time Machine
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func UpdateTheTimeMachine  { 
		nInteractionsCount = oModel.oInteractionModel.InteractionsCount()
		oView.sliderTimeMachine.setInteractionPoints(nInteractionsCount)
		#/*
		#		Purpose : Get the Time Machine - Active Interaction ID
		#		Parameter : None
		#		Output : Active Interaction ID
		#	*/
	} 
	func TimeMachineActiveInteractionID  { 
		return oTMController. activeInteractionID( oView, oModel ) 
		#/*
		#		Purpose : Add Step Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func AddStepAction  { 
		#if not AllowInteractButton() {
		#"Can't Add New Step in this location!"
		#	ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTADD)
		#	return
		#}
		TimeMachineGotoPresent()
		oInput = new QInputDialog(oView.win)
		{
			setwindowtitle(T_GD_NEWSTEP_ENTERSTEPNAME)
			#"Enter the step name?"
			setgeometry(100,100,400,50)
			setlabeltext(T_GD_NEWSTEP_STEPNAME)
			#"Step Name"
			settextvalue("")
			lcheck = exec()
		}
		if lCheck { 
			AddStep(oInput.textvalue())
			oView.fixDrawing()
			lSaveFlag = True
		} 
		#/*
		#		Purpose : Edit Step Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func EditStepAction  { 
		if  NOT IsComment() { 
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTEDIT)
			return 
		} 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 { 
			#Avoid start point
			return 
		} 
		oInput = new QInputDialog(oView.win)
		{
			setwindowtitle(T_GD_NEWSTEP_ENTERSTEPNAME)
			setgeometry(100,100,400,50)
			setlabeltext(T_GD_NEWSTEP_STEPNAME)
			settextvalue(this.oModel.GetStepName(nStepID))
			lcheck = exec()
		}
		if lCheck { 
			cText = oInput.textvalue()
			cPlainStepName = oHTMLFunctions.PlainText(cText)
			nStepType = oModel.GetStepType(nStepID)
			SetStepColor(nStepType)
			oView.oStepsTree.editstep(nStepID,oItem,cText,this.oModel.GetStepIgnoreStatus(nStepID))
			oModel.EditStepName(nStepID,cText,cPlainStepName)
			lSaveFlag = True
		} 
		#/*
		#		Purpose : Delete Step Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func DeleteStepAction  { 
		if  NOT IsCommentOrRoot() { 
			#"Can't Delete Sub Step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTDELETE)
			return 
		} 
		if !isWebAssembly() { 
			 new qmessagebox(oView.win)
			{
				setwindowtitle(T_GD_DELETESTEP_DELETESTEP)
				#"Delete Step"
				settext(T_GD_DELETESTEP_AREYOUSURE)
				#"Are you sure?"
				setInformativeText(T_GD_DELETESTEP_DOYOUWANT)
				#"Do you want to delete the step?"
				setstandardbuttons(QMessageBox_Yes|QMessageBox_No)
				result = exec()
				this.oView.win {
					if result = QMessageBox_No { 
						return 
					} 
				}
			}
		} 
		#Save the History for undo operations
		saveHistory()
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 { 
			#Delete All Steps
			#Remove the current Steps From the Tree Control
			oView.oStepsTree.clear()
			oView.oStepsTree.clearData()
			oView.oStepsTree.AddStartPoint()
			SaveBuffer()
			oModel = new GoalDesignerModel
			RestoreBuffer()
			else
				oView.oStepsTree.DelByObj(oItem)
				#Remove it from the [oItem|ID] List
				oItem.parent().takechild(oItem.parent().indexofchild(oItem))
				oModel.DeleteStep(nStepID)
		} 
		#Update the Time Machine
		UpdateTheTimeMachine()
		lSaveFlag = True
		#/*
		#		Purpose : Move Step Up Action
		#		Parameters : None
		#		Output : None
		#	*/
		AutoRun()
	} 
	func MoveStepUpAction  { 
		if  NOT IsCommentOrRoot() { 
			#"Can't Move Sub Step Up!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTMOVEUP)
			return 
		} 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 { 
			#Avoid start point
			return 
		} 
		#Save the History for undo operations
		saveHistory()
		oParent = oItem.Parent()
		nIndex = oParent.IndexofChild(oItem)
		if nIndex > 0 { 
			#Not The First Item
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
		#/*
		#		Purpose : Move Step Down Action
		#		Parameters : None
		#		Output : None
		#	*/
		AutoRun()
	} 
	func MoveStepDownAction  { 
		if  NOT IsCommentOrRoot() { 
			#"Can't Move Sub Step Down!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTMOVEDOWN)
			return 
		} 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 { 
			#Avoid start point
			return 
		} 
		#Save the History for undo operations
		saveHistory()
		oParent = oItem.Parent()
		nIndex = oParent.IndexofChild(oItem)
		if nIndex < oParent.ChildCount()-1 { 
			#Not the Last Item
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
		#/*
		#		Purpose : Print Steps Action
		#		Parameters : None
		#		Output : None
		#	*/
		AutoRun()
	} 
	func PrintStepsAction  { 
		Open_Window(:PrintStepsController)
		Last_Window().setParentObject(self)
		#/*
		#		The next method cut a step from the Steps Tree
		#		Parameters : None
		#		Output : None
		#	*/
		Last_Window().ShowData()
	} 
	func CutStepsAction  { 
		if  NOT IsCommentOrRoot() { 
			#"Can't Cut Sub Step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTCUT)
			return False
		} 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 { 
			#Avoid start point
			return False
		} 
		#Save the History for undo operations
		saveHistory()
		oView.oStepsTree.SaveStep(oItem)
		oItem.parent().takechild(oItem.parent().indexofchild(oItem))
		#We update the Model *after* the StepsTree View
		#Because SaveStep need the StepType from the Model
		oModel.CutStep(nStepID)
		#Update the Time Machine
		UpdateTheTimeMachine()
		lSaveFlag = True
		AutoRun()
		return True
		#/*
		#		Purpose : Copy Steps Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func CopyStepsAction  { 
		if  NOT IsCommentOrRoot() { 
			#"Can't Copy Sub Step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTCOPY)
			return 
		} 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 { 
			#Avoid start point
			return 
		} 
		oModel.CopyStep(nStepID)
		oView.oStepsTree.SaveStep(oItem)
		#/*
		#		Purpose : Paste Steps Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func PasteStepsAction  { 
		if oView.oStepsTree.isbuffernotempty() = false { 
			return False
		} 
		#Time Machine - Present
		#Save the History for undo operations
		TimeMachineGotoPresent()
		#Check Rules before the Paste Operation
		saveHistory()
		aPasteRoots = oModel.getpasteTopComponents()
		for cComponent in aPasteRoots step 1 { 
			if  NOT RulesAllow(cComponent) { 
				msginfo(T_CB_SORRY,T_CB_CANTUSECOMPONENT)
				return 
			} 
		} 
		oParentItem = oView.oStepsTree.currentItem()
		nParentStepID = oView.oStepsTree.GetIDByObj(oParentItem)
		oParentItemAtStart = oParentItem
		#When we paste in a location (Not Start Here)
		#We paste after the selected step
		nParentStepID_2 = nParentStepID
		nInsertIndex = -1
		if  NOT AllowInteractButton() { 
			nParentStepID = oModel.getStepParent(nParentStepID)
			nInsertIndex = oParentItem.parent().indexofchild(oParentItem)+1
			oParentItem = oView.oStepsTree.GetObjByID(nParentStepID)
		} 
		oModel.PasteStepAfterStep(nParentStepID,nParentStepID_2)
		oNewParentItem = oView.oStepsTree.PasteStepAfterStep(oParentItem,nInsertIndex)
		#Update the [Object,StepID] List
		aStepsObjectsList = oView.oStepsTree.StepsList(oNewParentItem)
		aStepsDataList = oModel.GetBuffer()
		oView.oStepsTree.AddNodesFromBuffer(aStepsObjectsList,aStepsDataList)
		#Update the Time Machine
		#Activate the same step (parent)
		UpdateTheTimeMachine()
		oView.oStepsTree.SetCurrentItem(oParentItem,0)
		#Fix Drawing
		#Select the original parent
		oView.fixDrawing()
		oView.oStepsTree.SetCurrentItem(oParentItemAtStart,0)
		lSaveFlag = True
		AutoRun()
		return True
		#/*
		#		Purpose : Increase Size Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func IncreaseSizeAction  { 
		oView.oStepsTree.IncreaseFontSize()
		oView.oStepCode.IncreaseFontSize()
		#/*
		#		Purpose : Decrease Size Action
		#		Parameters : None
		#		Output : None
		#	*/
		ReflectChangeInFontSize()
	} 
	func DecreaseSizeAction  { 
		oView.oStepsTree.DecreaseFontSize()
		oView.oStepCode.DecreaseFontSize()
		#/*
		#		Purpose : Reflect changes in font in the environment
		#	*/
		ReflectChangeInFontSize()
	} 
	func ReflectChangeInFontSize  { 
		if !C_PROPERTIES_REFLECTCHANGEINFONTSIZE { 
			return 
		} 
		#Set default font size for the Environment, To be used when we open another files
		parent() {
			nFontSize = this.oView.oStepsTree.nFontSize
			ComponentsBrowserFont()
			OutputWindowFont()
			ComponentsFont()
			FilesTreeFont()
		}
		#/*
		#		Purpose : Ignore Step Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func IgnoreStepAction  { 
		if  NOT IsRoot() { 
			#"Can't Comment/Uncomment Sub Step!"
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTCOMMENT)
			return 
		} 
		#Save the History for undo operations
		saveHistory()
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nIgnore = oModel.IgnoreStep(nStepID)
		oView.oStepsTree.IgnoreStep(oItem,nIgnore)
		lSaveFlag = True
		#/*
		#		Purpose : Step Changed Action
		#		Parameters : None
		#		Output : None
		#	*/
		AutoRun()
	} 
	func StepChangedAction  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		#Avoid Start point
		if nStepID = 1 { 
			#Set the step code
			oView.oStepCode.setText("")
			oView.oStepCode.setEnabled(False)
			return 
		} 
		#Avoid generated steps (Not Comment)
		if nStepType! = C_STEPTYPE_COMMENT { 
			oView.oStepCode.setText(oModel.GetStepCode(nStepID))
			oView.oStepCode.setEnabled(False)
			return 
		} 
		#Change the Step Code Value
		oView.oStepCode.setText(oModel.GetStepCode(nStepID))
		oView.oStepCode.setEnabled(True)
		#/*
		#		Purpose : Step Code Changed Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func StepCodeChangedAction  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 { 
			#Avoid start point			
			return 
		} 
		oModel.SaveStepCode(nStepID,oView.oStepCode.ToPlainText())
		#/*
		#		Purpose : Search Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func SearchAction  { 
		Open_Window(:FindStepController)
		Last_Window().setParentObject(self)
		#/*
		#		Purpose : Change Time Machine Point Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func ChangeTimeMachinePointAction  { 
		CloseAllInteractionPages()
		oView.win.setUpdatesEnabled(False)
		oTMController.ChangeTimeMachinePoint(oView,oModel)
		oView.win.setUpdatesEnabled(True)
		#/*
		#		Purpose : Tree Key Press
		#		Parameters : None
		#		Output : None
		#	*/
		AutoRun()
	} 
	func TreeKeyPress  { 
		nKey = oView.oTreeFilter.getkeycode()
		cText = oView.oTreeFilter.getkeytext()
		if oView.oTreeFilter.getmodifiers() = 0 { 
			#No CTRL Key is pressed
			#Keys from 'a' to 'z' and Arabic Keys
			if ((nKey >= 65) AND (nKey <= 90)) OR ((nKey >= 1575) AND (nKey <= 1610)) { 
				UpdateSearchField(cText)
			} 
			elseif nKey = 63
				#writing ? operator
				UpdateSearchField(cText)
		} 
		oView.oTreeFilter.setEventOutput(False)
	} 
	func UpdateSearchField cText { 
		if lFullScreen OR lAvoidComponentsBrowser { 
			oView.oTextSearch.setText(Lower(cText))
			oView.oTextSearch.setfocus(0)
			SpecialSearch()
			else
				if InteractAction() { 
					ComponentsBrowserWindow().oView.oTextSearch.setText(Lower(cText))
					ComponentsBrowserWindow().SearchAction()
				} 
		} 
		#/*
		#		Purpose : Key Press Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func KeyPress  { 
		nKey = oView.oFilter.getkeycode()
		if oView.oTreeFilter.getmodifiers() = 0 { 
			#No CTRL Key is pressed
			if  NOT (nKey = 16777223) { 
				#DEL
				return 
			} 
		} 
		switch nKey { 
			case 61
				#CTRL + +
				IncreaseSizeAction()
			case 45
				#CTRL + -
				DecreaseSizeAction()
			case 70
				#CTRL+F
				SearchAction()
			case 78
				#CTRL+N
				if oView.lUseNewCommentButton { 
					AddStepAction()
				} 
			case 80
				#CTRL+P
				PrintStepsAction()
			case 16777223
				#DEL
				DeleteStepAction()
			case 69
				#CTRL+E
				oItem = oView.oStepsTree.currentItem()
				nStepID = oView.oStepsTree.GetIDByObj(oItem)
				nStepType = oModel.GetStepType(nStepID)
				if (nStepType = C_STEPTYPE_COMMENT) AND oView.lUseNewCommentButton { 
					EditStepAction()
					else
						ModifyAction()
				} 
			case 67
				#CTRL+C
				CopyStepsAction()
			case 73
				#CTRL+I
				IgnoreStepAction()
			case 76
				EditAllStepsAction()
			case 86
				#CTRL+V
				PasteStepsAction()
			case 88
				#CTRL+X
				CutStepsAction()
			case 85
				#CTRL+U
				MoveStepUpAction()
			case 79
				#CTRL+O
				MoveStepDownAction()
			case 84
				#CTRL+T
				InteractAction()
			case 68
				#CTRL+D
				DebugAction()
			case 82
				#CTRL+R
				RunAction()
			case 16777268
				#CTRL+F5
				RunGuiAction()
		} 
		oView.oTreeFilter.setEventOutput(False)
		#/*
		#		Purpose : New File Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func NewFileAction  { 
		#Set the file Name
		if (!isWebAssembly()) AND !lNoFileDialogWhenCreatingNewFiles { 
			 new qfiledialog(oView.win)
			{
				cFileName = getsavefilename(this.oView.win,"New File",this.parent().cCurrentDir,T_GD_DM_FILETYPE)
			}
			if cFileName = NULL { 
				return 
			} 
			else
				cFileName = T_VSF_NONAMEPWCT
		} 
		#Remove the file from the Active Files List
		parent().RemoveFileFromActiveFilesList(lower(oVisualSourceFile.cFileName))
		oVisualSourceFile.cFileName = cFileName
		#Clear the History
		#Remove the current Steps From the Tree Control
		clearHistory()
		oView.oStepsTree.clear()
		oView.oStepsTree.clearData()
		#Create new Model (Steps Tree and Interactions)
		oView.oStepsTree.AddStartPoint()
		SaveBuffer()
		oModel = new GoalDesignerModel
		#Create the file
		RestoreBuffer()
		#Update the Time Machine
		SaveFileAction2()
		#Set the docable widget title
		UpdateTheTimeMachine()
		oView.win.ParentWidget().setWindowTitle(cFileName)
		#/*
		#		Purpose : Save Current File Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func SaveCurrentFileAction  { 
		lSaveFlag = False
		#Check file not saved before
		if oVisualSourceFile.cFileName = T_VSF_NONAMEPWCT { 
			SaveFileAction()
			return 
		} 
		#/*
		#		Purpose : Save File Action
		#		Parameters : None
		#		Output : None
		#	*/
		SaveFileAction2()
	} 
	func SaveFileAction  { 
		#Set the file Name
		 new qfiledialog(oView.win)
		{
			cFileName = getsavefilename(this.oView.win,T_GD_DM_SAVEFILE,this.parent().cCurrentDir,T_GD_DM_FILETYPE)
		}
		if cFileName = NULL { 
			return 
		} 
		oVisualSourceFile.cFileName = cFileName
		#Set the docable widget title
		SaveFileAction2()
		oView.win.ParentWidget().setWindowTitle(cFileName)
		#/*
		#		Purpose : Save File Action 2
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func SaveFileAction2  { 
		showmessageInStatusBar(T_ENVMSG_SAVE)
		#"Save the visual source file..."
		PWCT_APP.processevents()
		oVisualSourceFile.RemoveFile()
		oVisualSourceFile.Open()
		oVisualSourceFile.SetStepsTreeTable(oModel.oStepsTreeModel.GetData())
		oVisualSourceFile.SetInteractionsTable(oModel.oInteractionModel.GetData())
		oVisualSourceFile.SetStepsID(oModel.oStepsTreeModel.GetID())
		oVisualSourceFile.SetInteractionsID(oModel.oInteractionModel.GetID())
		oVisualSourceFile.CreateTables()
		oVisualSourceFile.SaveTables()
		oVisualSourceFile.Close()
		showmessageInStatusBar(T_ENVMSG_GENERATE)
		#"Generate the source code..."
		PWCT_APP.processevents()
		oProgramController.prepare(self)
		showmessageInStatusBar(T_ENVMSG_SAVEGENDONE)
		#"File Saved and the source code is generated!")
		#/*
		#		Purpose : Open File Action
		#		Parameters : None
		#		Output : None
		#	*/
		PWCT_APP.processevents()
	} 
	func OpenFileAction  { 
		#Get the file Name
		oView.oStepsTree.DisableEvents()
		 new qfiledialog(oView.win)
		{
			cFileName = getopenfilename(this.oView.win,T_GD_DM_OPENFILE,this.parent().cCurrentDir,T_GD_DM_FILETYPE)
		}
		if cFileName = NULL { 
			return 
		} 
		#Remove the file from the Active Files List
		parent().RemoveFileFromActiveFilesList(oVisualSourceFile.cFileName)
		oVisualSourceFile.cFileName = cFileName
		OpenFileAction2()
		#Set the docable widget title
		oView.oStepsTree.EnableEvents()
		oView.win.ParentWidget().setWindowTitle(cFileName)
		#/*
		#		Purpose : Open File Action 2
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func SaveBuffer  { 
		aBackupBuffer = oModel.oStepsTreeModel.aBuffer
		aBackupInteraction = oModel.oInteractionModelBuffer
	} 
	func RestoreBuffer  { 
		oModel.oStepsTreeModel.aBuffer = aBackupBuffer
		oModel.oInteractionModelBuffer = aBackupInteraction
	} 
	func OpenFileAction2  { 
		#Clear the History
		CloseAllInteractionPages()
		clearHistory()
		#Get Data From the Visual Source File
		nClock = clock()
		oSystemLog.addMessage("Start - Get data from visual source file")
		#The next call consumes 40 MB on file with 5000 steps ! very bad!
		oVisualSourceFile.Open()
		oVisualSourceFile.LoadTables()
		aStepsTree = oVisualSourceFile.GetStepsTreeTable()
		aInteractions = oVisualSourceFile.GetInteractionsTable()
		nStepsIDCounter = oVisualSourceFile.GetStepsID()
		nInteractionsIDCounter = oVisualSourceFile.GetInteractionsID()
		oVisualSourceFile.Close()
		oSystemLog.addMessage("End - Get data from visual source file")
		oSystemLog.addMessage("Steps Count: "+len(aStepsTree))
		oSystemLog.addMessage("Interactions Count: "+len(aInteractions))
		#Update Objects
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
		#Refresh Steps Tree
		oSystemLog.addMessage("Start - Refresh Steps Tree")
		RefreshStepsTree2(aStepsTree)
		oSystemLog.addMessage("End - Refresh Steps Tree")
		#Prepare the Components Browser
		Activate()
		showmessageInStatusBar("Loading Time: "+((clock()-nClock)/Clockspersecond()))
		#/*
		#		Purpose : Refresh Steps Tree
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func RefreshStepsTree  { 
		aStepsTree = oModel.oStepsTreeModel.getdata()
		RefreshStepsTree2(aStepsTree)
		#/*
		#		Purpose : Refresh Steps Tree
		#		Parameters : The Steps Tree List
		#		Output : None
		#	*/
	} 
	func RefreshStepsTree2 aStepsTree { 
		oView.oStepsTree.setUpdatesEnabled(False)
		oView.oStepsTree.blockSignals(True)
		#Borders around steps
		oView.oStepsTree.lLabelStyle = C_PROPERTIES_BORDERSAROUNDSTEPS
		#Indentation
		oView.oStepsTree.setIndentation(C_STEPSTREE_INDENTATION)
		#Set the font
		#Remove the current Steps From the Tree Control
		oView.oStepsTree.PrepareFont()
		oView.oStepsTree.clear()
		oView.oStepsTree.clearData()
		#Add Steps to the Tree
		oView.oStepsTree.AddStartPoint()
		if lUseSuperSerialAdd { 
			SuperSerialAdd(aStepsTree)
			else
				nMax = len(aStepsTree)
				for x = 2 to nMax step 1 { 
					nStepID = aStepsTree[x][C_TREEMODEL_NODEID]
					nParentID = aStepsTree[x][C_TREEMODEL_PARENTID]
					cStepName = aStepsTree[x][C_TREEMODEL_CONTENT][:name]
					lIgnore = NOT aStepsTree[x][C_TREEMODEL_CONTENT][:active]
					nStepType = aStepsTree[x][C_TREEMODEL_CONTENT][:steptype]
					SetStepColor(nStepType)
					oItem = oView.oStepsTree.SerialAdd(nParentID,nStepID,cStepName,lIgnore)
				} 
		} 
		#Update the Time Machine
		UpdateTheTimeMachine()
		oView.oStepsTree.setUpdatesEnabled(True)
		oView.oStepsTree.blockSignals(False)
		#Using setExpanded() takes a lot of time with qTreeWidget when using Labels in QTreeWidgetItem
		oView.oStepsTree.oFirstStep.SetExpanded(True)
		#/*
		#		Purpose : Quickly add many steps to the Steps Tree
		#			  This function increase the performance 	
		#		Parameters : The steps Tree
		#		Output : None
		#	*/
	} 
	func SuperSerialAdd aStepsTree { 
		oSystemLog.addMessage("Start - super serial add for tree nodes")
		if lCreateNewStepsTree { 
			oView.oStepsTree.close()
			oView.oStepsTree.delete()
			oView.createStepsTree(self)
		} 
		#Using parent().goaldesignerFont() is slow
		#parent().goaldesignerFont()
		nMax = len(aStepsTree)
		nLoadTimeStart = clock()
		lSuperSerialAddExpandSteps = !(nMax > nMaxStepsCountForExpandSteps)
		if nMax > this.nMaxStepsCount AND lUseMaxStepsCount { 
			oView.oStepsTree {
				lUseLabels = False
				setStyleSheet(this.oView.stepsTreeWhiteAndBlackStyle(nFontSize))
			}
			else
				oView.oStepsTree {
					lUseLabels = True
					setStyleSheet(this.oView.stepsTreeStyle())
				}
		} 
		oView.oStepsTree.prepareTempFont()
		oTempFont = oView.oStepsTree.oTempFont
		#A flag to know if we are starting from a step (Not Start Here)
		#How many Root steps, for example using (x=10 y=20 z=30)
		#will lead to three roots
		#if we don't use (nRootsCount) we could get steps in wrong order
		#like (z=30 y=20 z=10) when we insert them
		lUpdateParent = NOT allowInteractButton()
		nRootsCount = 0
		for x = 2 to nMax step 1 { 
			aStep = aStepsTree[x]
			nID = aStep[C_TREEMODEL_NODEID]
			nParentID = aStep[C_TREEMODEL_PARENTID]
			cText = aStep[C_TREEMODEL_CONTENT][:name]
			cPlainText = aStep[C_TREEMODEL_CONTENT][:plainname]
			lIgnore = NOT aStep[C_TREEMODEL_CONTENT][:active]
			nStepType = aStep[C_TREEMODEL_CONTENT][:steptype]
			nInsertIndex = -1
			#Process Step Name (To support displaying images)
			cText = processStepName(cText)
			#When we add step in location that doesn't support children (Not Start Here)
			if lUpdateParent AND aStep[C_TREEMODEL_PARENTID] = aStepsTree[2][C_TREEMODEL_PARENTID] { 
				oItem = oView.oStepsTree.GetObjByID(nParentID)
				nInsertIndex = oItem.parent().indexOfChild(oItem)+nRootsCount+1
				nParentID = oModel.getStepParent(nParentID)
				nRootsCount++
			} 
			oView.oStepsTree {
				if nMax <= this.nMaxStepsCount OR  NOT this.lUseMaxStepsCount { 
					setStepColor(nStepType)
				} 
				#GetObjByID() consumes 0.08 second per 100 steps
				oParent = getObjByID(nParentID)
				if lIgnore { 
					cImage = C_LABELIMAGE_IGNORESTEP
					else
						cImage = C_LABELIMAGE_NODEICON
				} 
				oItem = new QTreeWidgetItem()
				if nMax < this.nMaxStepsCount OR  NOT this.lUseMaxStepsCount { 
					#Changing label Size have a notable effect on performance!
					oLabel = createTreeLabel()
					oLabel.resize(0,0)
					oLabel.setFont(oTempFont)
					if this.lStepColorOldStyle { 
						oLabel.setMaximumWidth(12*len(cPlainText))
						oLabel.setStyleSheet("color:"+cColor+";background-color:"+cBackColor+";")
						oLabel.setText(cPlainText)
						else
							cText = substr(substr(cText,"C_STEPCOLOR_DATA_TEXT",C_STEPCOLOR_DATA_TEXT),"C_STEPCOLOR_DATA_BACKCOLOR",C_STEPCOLOR_DATA_BACKCOLOR)
							cImageCode = ""
							if C_STEPSTREE_NODEICON { 
								cImageCode = nodeImage(cImage)
								else
									if lIgnore { 
										cImageCode = C_COMMENTMARK
									} 
							} 
							oLabel.setText(cImageCode+'<span style="background-color:'+cBackColor+'"><font color="'+cColor+'">'+cText+"</font></span>")
							newLabelStyle(oLabel,[:StepType = nStepType])
					} 
					if nInsertIndex = -1 { 
						oParent.addChild(oItem)
						else
							oParent.insertChild(nInsertIndex,oItem)
					} 
					setItemWidget(oItem,0,oLabel)
					else
						if lIgnore { 
							cPlainText = C_COMMENTMARK+cPlainText
						} 
						oItem.setText(0,cPlainText)
						if nInsertIndex = -1 { 
							oParent.addChild(oItem)
							else
								oParent.insertChild(nInsertIndex,oItem)
						} 
				} 
				addToTree(nID,oItem)
				if this.lSuperSerialAddExpandSteps OR x < this.nMinStepsToExpand { 
					oItem.setExpanded(True)
					else
						oItem.setExpanded(False)
				} 
			}
			if lShowLoadingProgress { 
				if x%100 = 0 { 
					showMessageInStatusBar("Loading : "+floor((x/nMax)*100)+"%")
					oView.oStepsTree.setUpdatesEnabled(True)
					oView.oStepsTree.blockSignals(False)
					PWCT_APP.processEvents()
					oView.oStepsTree.setUpdatesEnabled(False)
					oView.oStepsTree.blockSignals(True)
				} 
			} 
		} 
		oSystemLog.addMessage("End - super serial add for tree nodes")
		oSystemLog.addMessage("Steps Count: "+nMax)
		oSystemLog.addMessage("Loading Time (clocks) : "+(clock()-nLoadTimeStart))
		oSystemLog.addMessage("Loading Time (seconds): "+((clock()-nLoadTimeStart)/ClocksPerSecond())+" seconds.")
		#/*
		#		Purpose : Start New Interaction
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func InteractAction  { 
		if  NOT AllowInteractButton() { 
			#"Can't start new Interaction from this step!"
			#ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTINTERACT)
			#return False
		} 
		if parent().IsDockForComponentsBrowser() AND parent().lDockForComponentsBrowserIsVisible = True { 
			parent().oView.oDockComponentsBrowser.setWidget(ComponentsBrowserWindow().oView.win)
			ComponentsBrowserWindow().Start()
			parent().oView.oDockComponentsBrowser.show()
			parent().oView.oDockComponentsBrowser.Raise()
			elseif parent().IsDockForComponentsBrowser() AND parent().lDockForComponentsBrowserIsVisible = False
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
		#/*
		#		Purpose 	: Load the Components Browser components
		#		Parameters 	: None
		#		Output 		: None
		#	*/
	} 
	func LoadComponentsBrowserComponents  { 
		if parent().isdockForComponentsBrowser() AND parent().lDockForComponentsBrowserIsVisible = True { 
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
			if isdockForComponentsBrowser() AND lDockForComponentsBrowserIsVisible = False { 
				lDockForComponentsBrowserIsVisible = True
				nComponentsBrowserWindowID = Last_WindowID()
			} 
		}
		#/*
		#		Purpose : Get the Components Browser Window Object
		#		Parameters : None
		#		Output : Components Browser Object
		#	*/
	} 
	func ComponentsBrowserWindow  { 
		return GetObjectByID( nComponentsBrowserWindowID ) 
		#/*
		#		Purpose : Called when the componetns browser is closed
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func ComponentsBrowserClosed  { 
		lIsComponentsBrowserOpened = False
		ComponentsBrowserHidden()
	} 
	func ComponentsBrowserHidden  { 
		oView.widgetCB.Hide()
		if parent().isdockForComponentsBrowser() { 
			parent().oView.oDockComponentsBrowser.Hide()
		} 
		#/*
		#		Purpose 	: Check loading the component file
		#		Parameters 	: Component File Name
		#		Output		: None
		#	*/
	} 
	func CheckLoadingComponent cFilePath { 
		if lNoDynamicComponents { 
			return 
		} 
		if fexists(cFilePath) { 
			if find(aComponentsFilesList,cFilePath) = 0 { 
				aComponentsFilesList+cFilePath
				Eval("Load '"+cFilePath+"'")
			} 
		} 
		#/*
		#		Purpose : Modify Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func ModifyAction  { 
		#Check if it is a comment (Step Double Click) 	
		if oView.lUseNewCommentButton AND IsComment() { 
			editstepaction()
			return 
		} 
		#Get the Selected Step
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		#PWCT_App.clipboard().setText(this.oModel.getStepName(nStepID),0)
		#Avoid the Start Point
		if nStepID = 1 { 
			return 
		} 
		ModifyAction2(nStepID)
	} 
	func ModifyAction2 nStepID { 
		#Check Step Type
		openComponent(nStepID)
		#Display the Window
		if lInteractionPagesInGoalDesigner { 
			oView.layoutVPages.InsertWidget(0,Last_Window().oView.win,0,0)
			#Show The Window
			Last_Window().Start()
			#Show the Splitter Widget
			oView.widgetVPages.Show()
			oView.oVPagesScroll.Show()
			else
				#Show The Window
				Last_Window().Start()
		} 
		RegisterInteractionPage()
		nInteractionPagesToModifyCount++
		Last_Window().InternalAfterOpen()
		Last_Window().AfterOpen()
	} 
	func RegisterInteractionPage  { 
		#Add the window ID to the interaction pages list
		aInteractionPagesWindows+Last_Window().ObjectID()
	} 
	func CloseAllInteractionPages  { 
		for nWindowID in aInteractionPagesWindows step 1 { 
			nPos = Get_Window_Pos(nWindowID)
			if nPos! = 0 { 
				GetObjectByID(nWindowID).closeAction()
			} 
		} 
		aInteractionPagesWindows = []
		oView.widgetVPages.Hide()
		oView.oVPagesScroll.Hide()
		nInteractionPagesToModifyCount = 0
	} 
	func RefreshInteractionPagesColors  { 
		for nWindowID in aInteractionPagesWindows step 1 { 
			nPos = Get_Window_Pos(nWindowID)
			if nPos! = 0 { 
				GetObjectByID(nWindowID).oView.setTitleColors()
			} 
		} 
		#/*
		#		Purpose : Open component without displaying the Interaction window
		#		Parameters : The Step ID
		#		Output	: None
		#	*/
	} 
	func OpenComponent nStepID { 
		#Check Step Type
		nIID = oModel.GetInteractionID(nStepID)
		#Get the Component File Name
		cFile = oModel.GetInteractionComponent(nIID)
		#Get the Interaction Variables Values
		cVariablesValues = oModel.GetInteractionVariablesValues(nIID)
		#Check the component File
		cFilePath = cComponentsPath+cFile+".ring"
		CheckLoadingComponent(cFilePath)
		#Use the Component
		#We use Open_WindowNoShow() to avoid flickering
		Open_WindowNoShow(cFile+:ComponentController)
		Last_Window().setParentObject(self)
		Last_Window().cComponent = cFile
		Last_Window().cVariablesValues = cVariablesValues
		Last_Window().nInteractionMode = C_INTERACTIONMODE_MODIFY
		Last_Window().nIID = nIID
		#/*
		#		Purpose : Interaction page (modify) closed
		#		Parameters : None
		#		Output : None
		#	*/
		Last_Window().SetVariablesValues()
	} 
	func InteractionPageToModifyClosed  { 
		nInteractionPagesToModifyCount--
		if nInteractionPagesToModifyCount = 0 { 
			oView.widgetVPages.Hide()
			oView.oVPagesScroll.Hide()
		} 
		#/*
		#		Purpose : Check Allow Interact Button
		#		Parameters : None
		#		Output : True/False
		#	*/
	} 
	func AllowInteractButton  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		#Interact Button Status
		if nStepType = C_STEPTYPE_COMMENT OR nStepType = C_STEPTYPE_ALLOWINTERACTION { 
			return True
		} 
		return False
		#/*
		#		Purpose : Check if the Step Type is Root
		#		Parameters : None
		#		Output : True/False
		#	*/
	} 
	func IsRoot  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		if nStepType = C_STEPTYPE_ROOT { 
			return True
		} 
		return False
		#/*
		#		Purpose : Check is comment or root
		#		Parameters : None
		#		Output : True/False
		#	*/
	} 
	func IsCommentOrRoot  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		#Delete|Move|Cut|Copy Buttons Status
		if nStepType = C_STEPTYPE_COMMENT OR nStepType = C_STEPTYPE_ROOT { 
			return True
		} 
		return False
		#/*
		#		Purpose : Check Is Comment
		#		Parameters : None
		#		Output : True/False
		#	*/
	} 
	func IsComment  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		nStepType = oModel.GetStepType(nStepID)
		#Edit Button Status
		if nStepType = C_STEPTYPE_COMMENT { 
			return True
		} 
		return False
		#/*
		#		Purpose : Check is Generated Step
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func IsGeneratedStep  { 
		return not IsComment() 
	} 
	func IsMoveUp  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if oModel.oStepsTreeModel.SiblingUp(nStepID) { 
			return True
			else
				return False
		} 
		#/*
		#		Purpose : Check Is Move Down
		#		Parameters : None
		#		Output : True/False
		#	*/
	} 
	func IsMoveDown  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if oModel.oStepsTreeModel.SiblingDown(nStepID) { 
			return True
			else
				return False
		} 
		#/*
		#		Purpose : Tree Node Changed Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func TreeNodeChangedAction  { 
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
		#/*
		#		Purpose : Debug Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func DebugAction  { 
		setProgramControllerFileName()
		oProgramController.Debug(self)
		#/*
		#		Purpose : Run Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func RunAction  { 
		setProgramControllerFileName()
		oProgramController.Run(self)
		#/*
		#		Purpose : Run GUI Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func RunGUIAction  { 
		setProgramControllerFileName()
		oProgramController.RunGUI(self)
		#/*
		#		Run web application
		#	*/
	} 
	func RunInBrowser  { 
		setProgramControllerFileName()
		oProgramController.RunInBrowser(self)
		#/*
		#		Purpose : Set Program Controller File Name
		#			  Determine the Generated source code file
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func setProgramControllerFileName  { 
		oProgramController.cFileName = substr(oVisualSourceFile.cFileName,"."+T_VSF_EXTENSION,".ring")
		#/*
		#		Purpose : Font Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func FontAction  { 
		oFontDialog = new qfontdialog()
		{
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
	} 
	func FontAction2  { 
		cFont = oFontDialog.selectedfont().tostring()
		#/*
		#		Purpose : Update Font
		#		Parameters : None
		#		Output : None
		#	*/
		UpdateFont()
	} 
	func UpdateFont  { 
		#set the new font
		SetFontName()
		#/*
		#		Purpose : Update Font  Size
		#		Parameters : None
		#		Output : None
		#	*/
		UpdateFontSize()
	} 
	func UpdateFontSize  { 
		#/*
		#		Purpose : Colors Action
		#		Parameters : None
		#		Output : None
		#	*/
		oView.oStepsTree.UpdateFontSize()
	} 
	func ColorsAction  { 
		Open_Window(:StepsColorsController)
		Last_Window().setParentObject(self)
		#Show the Window
		#/*
		#		Purpose : Set Font Name
		#		Parameters : None
		#		Output : None
		#	*/
		Last_Window().Start()
	} 
	func SetFontName  { 
		oFont = new qfont("",0,0,0)
		oFont.FromString(cFont)
		oView.oStepsTree.SetFont(oFont)
		oView.oStepsTree.setFontObject(oFont)
		#/*
		#		Purpose : Activate Window Action
		#		Parameters : None
		#		Output : None
		#	*/
		oView.oStepsTree.nFontSize = oFont.PointSize()
	} 
	func ActivateWindowAction  { 
		if IsParent() { 
			parent().setParentObject(self)
		} 
		#/*
		#		Purpose : Close File Action
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func CloseFileAction  { 
		#Close All Interaction Pages
		#Remove the file from the Active Files List
		CloseAllInteractionPages()
		parent().RemoveFileFromActiveFilesList(oVisualSourceFile.cFileName)
		#Remove the current Steps From the Tree Control
		oView.oStepsTree.clear()
		oView.oStepsTree.clearData()
		#Create new Model (Steps Tree and Interactions)
		oView.oStepsTree.AddStartPoint()
		SaveBuffer()
		oModel = new GoalDesignerModel
		#Create the file
		RestoreBuffer()
		#Update the Time Machine
		oVisualSourceFile = new VisualSourceFile
		#Set the docable widget title
		UpdateTheTimeMachine()
		oView.win.ParentWidget().setWindowTitle("Goal Designer")
		#/*
		#		Purpose : IsFileOpened
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func IsFileOpened  { 
		return oVisualSourceFile. IsFileOpened() 
	} 
	func IsFileEmpty  { 
		return oModel. IsEmpty() 
	} 
	func GetParentComponentDetails  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 { 
			#start point
			return ["SP" ,1 ]
		} 
		nStepType = oModel.GetStepType(nStepID)
		#Get parent component (Not Comment)
		while nStepType = C_STEPTYPE_COMMENT { 
			nStepID = oModel.getStepParent(nStepID)
			if nStepID = 1 { 
				#start point
				return ["SP" ,1 ]
			} 
			nStepType = oModel.GetStepType(nStepID)
		} 
		nIID = oModel.GetInteractionID(nStepID)
		cFile = oModel.GetInteractionComponent(nIID)
		nStepNumber = oModel.GetStepNumber(nStepID)
		return [cFile, nStepNumber]
		#/*
		#		Purpose : Get Parents List from the Current Step to the Start Point
		#		Parameters : None
		#		Output : List contains the component name of each parent
		#	*/
	} 
	func GetParentsList  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		if nStepID = 1 { 
			#start point
			return ["SP" ]
		} 
		aParents = []
		while nStepID! = 1 { 
			nIID = oModel.GetInteractionID(nStepID)
			cFile = oModel.GetInteractionComponent(nIID)
			aParents+cFile
			nStepID = oModel.getStepParent(nStepID)
		} 
		aParents+"SP"
		return aParents
	} 
	func GetChildrenOneLevel  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		aList = oModel.oStepsTreeModel.ChildrenoneLevel(nStepID)
		aComponents = []
		for nStepID in aList step 1 { 
			nIID = oModel.GetInteractionID(nStepID)
			cFile = oModel.GetInteractionComponent(nIID)
			aComponents+cFile
		} 
		return aComponents
		#/*
		#		Purpose : Get Parent Name  - Used for Rules
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func GetParentComponentName  { 
		return GetParentComponentDetails() [1 ]
		#/*
		#		Purpose : Get Parent Step Number  - Used for Rules
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func GetParentStepNumber  { 
		return GetParentComponentDetails() [2 ]
		#/*
		#		Purpose : Get Component Object
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func GetComponentObject cComponentName { 
		cComponentsPath = C_CB_COMPONENTSPATH
		cFilePath = cComponentsPath+cComponentName+".ring"
		CheckLoadingComponent(cFilePath)
		#Check the Component
		eval("oObject = new "+cComponentName+:ComponentController)
		return oObject
		#/*
		#		Purpose : Check Rules
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func RulesAllow cChildComponentName { 
		#Prepare Variables
		cParentComponentName = getparentComponentName()
		nStepNumber = getparentStepNumber()
		cComponentsPath = C_CB_COMPONENTSPATH
		cFilePath = cComponentsPath+cParentComponentName+".ring"
		#Check that the current component support the parent component
		oChild = GetComponentObject(cChildComponentName)
		oChild.setParentObject(self)
		lCheck = oChild.CheckAllowParent(cParentComponentName,nStepNumber)
		if  NOT lCheck { 
			return false
		} 
		#Check that the parent component accept the current component
		if cParentComponentName = "SP" { 
			return True
		} 
		oParent = GetComponentObject(cParentComponentName)
		oParent.setParentObject(self)
		return oParent. CheckAllowChild( cChildComponentName, nStepNumber ) 
		#/*
		#		Purpose : Check output from the application when we run PWCT on Mobile
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func CheckOutputOnMobile  { 
		oProgramController.CheckOutputOnMobile(self)
		#/*
		#		Purpose : Enable Check output from the application when we run PWCT on Mobile
		#		Parameters : None
		#		Output : None
		#	*/
	} 
	func EnableCheckOutputOnMobile  { 
		#/*
		#		Purpose : Disable Check output from the application when we run PWCT on Mobile
		#		Parameters : None
		#		Output : None
		#	*/
		oView.oCheckOutputOnMobileTimer.start()
	} 
	func DisableCheckOutputOnMobile  { 
		#/*
		#		Purpose	   : Delete Extra steps in the interaction after we
		#			     Modify it and change the interaction options
		#			     We will delete steps in the same interaction
		#			     where the step number > nStepsCount
		#		Parameters : The interaction ID, The Steps Count
		#		Output 	   : None
		#	*/
		oView.oCheckOutputOnMobileTimer.stop()
	} 
	func DeleteExtraSteps nIID,nStepsCount { 
		aList = oModel.GetStepsInTimeRange(nIID-1,nIID,True)
		#Take in mind group of steps in the same interaction
		aList = Sort(aList,1)
		aList = Reverse(aList)
		for x = 1 to len(aList) step 1 { 
			item = aList[x]
			nStepID = item[C_TREEMODEL_NODEID]
			nStepNumber = item[C_TREEMODEL_CONTENT][:stepnumber]
			if nStepNumber > nStepsCount { 
				oItem = oView.oStepsTree.GetObjByID(nStepID)
				oView.oStepsTree.DelByObj(oItem)
				oItem.parent().takechild(oItem.parent().indexofchild(oItem))
				#We don't call deletestep() to avoid deleting the interactaction
				oModel.oStepsTreeModel.DeleteNode(nStepID)
			} 
		} 
		#/*
		#		Purpose 	: Display message in the status bar
		#		Parameters      : The message as string
		#		Output		: None
		#	*/
	} 
	func ShowMessageInStatusBar cMsg { 
		parent().showmessageInStatusBar(cMsg)
		#/*
		#		Check using dockable window for the components browser
		#	*/
	} 
	func isdockForComponentsBrowser  { 
		return parent() . isdockForComponentsBrowser() 
	} 
	func prepareStepName cStep { 
		return oView. oStepsTree. prepareStepName( cStep ) 
		#/*
		#		Check if we have active visual source file
		#	*/
	} 
	func IsActiveFile  { 
		if oVisualSourceFile.cFileName = T_VSF_NONAMEPWCT { 
			return False
		} 
		return True
		#/*
		#		Get the Active visual File Name (*.pwct) from the visual source file object
		#	*/
	} 
	func GetActiveFile  { 
		return oVisualSourceFile. cFileName
		#/*
		#		Get the Active source file name (*.ring)
		#	*/
	} 
	func GetActiveSourceFile  { 
		cActiveFileName = GetActiveFile()
		cActiveFileName = substr(cActiveFileName,"."+T_VSF_EXTENSION,".ring")
		return cActiveFileName
		#/*
		#		Switch goal designer window to full screen or switch full screen to window
		#	*/
	} 
	func FullScreen  { 
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
		#/*
		#		Time Machine - Play As Movie
		#	*/
	} 
	func PlayMovie  { 
		oPlayAsMovie.PlayMovie(self)
		#/*
		#		The Play Movie Timer
		#	*/
	} 
	func PlayMovieTimer  { 
		oPlayAsMovie.PlayMovieTimer(self)
		#/*
		#		Set the Save Flag (For Save Changes? message)
		#	*/
	} 
	func SetSaveFlag  { 
		lSaveFlag = True
		#/*
		#		Display Messagebox (Yes/No) to save the changes to the current file
		#	*/
	} 
	func CheckSavingTheFile  { 
		if isWebAssembly() { 
			return 
		} 
		if lSaveFlag { 
			lSaveFlag = False
			 new qmessagebox(oView.win)
			{
				setwindowtitle(T_ENV_SAVE)
				#"Save"
				settext(T_ENV_SAVECHANGES)
				#"Save Changes?"
				setstandardbuttons(QMessageBox_Yes|QMessageBox_No)
				result = exec()
				this.oView.win {
					if result = QMessageBox_No { 
						return 
					} 
				}
			}
			SaveCurrentFileAction()
		} 
	} 
	func AutoRun  { 
		if lAutoRun { 
			RunGUIAction()
		} 
	} 
	func EditAllStepsAction  { 
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		aChildren = oModel.oStepsTreeModel.ChildrenIDs(nStepID)
		insert(aChildren,0,nStepID)
		aSteps = []
		for nStep in aChildren step 1 { 
			if oModel.GetStepType(nStep) = C_STEPTYPE_ROOT { 
				aSteps+nStep
			} 
		} 
		aSteps = reverse(aSteps)
		for nStep in aSteps step 1 { 
			ModifyAction2(nStep)
			PWCT_APP.processevents()
		} 
	} 
	func showTimeMachine nStatus { 
		if nStatus { 
			oView.sliderTimeMachine.show()
			oView.btnPlay.show()
			if  NOT PWCTIsMobile(:TimeMachineLabel) { 
				oView.labelTM.show()
			} 
			else
				oView.sliderTimeMachine.hide()
				oView.btnPlay.hide()
				if  NOT PWCTIsMobile(:TimeMachineLabel) { 
					oView.labelTM.hide()
				} 
		} 
	} 
	func SpecialSearch  { 
		cFind = oView.oTextSearch.text()
		if trim(cFind) = "" { 
			ComponentsBrowserWindow().QuickMsg().hide()
			oView.oStepsTree.setFocus(0)
			return 
		} 
		cFind = ComponentsBrowserWindow().isSearchFindComponent(cFind)[2]
		ComponentsBrowserWindow().QuickMsg().setText(cFind)
		ComponentsBrowserWindow().QuickMsg().centerTheWindow()
		#The next code is a workaround in a bug in Qt for WebAssembly
		#Because the LineEdit lost the focus for the QuickMsg window
		#And we want to keep it
		ComponentsBrowserWindow().QuickMsg().show()
		ComponentsBrowserWindow().QuickMsg().oView.win.activatewindow()
		oView.oTextSearch.activatewindow()
		oView.oTextSearch.setFocus(7)
	} 
	func SpecialSearchEnterPressAction  { 
		oView.oTextFilter.setEventOutput(False)
		if oView.oTextFilter.getKeyCode() = 16777220 { 
			ComponentsBrowserWindow().QuickMsg().hide()
			cFind = oView.oTextSearch.text()
			if !ComponentsBrowserWindow().FindAndSelectComponent(cFind) { 
				ComponentsBrowserWindow().TextualCodeToVisualCode(cFind)
				oView.oStepsTree.setFocus(0)
			} 
		} 
		#/*
		#		Methods for the Undo operation
		#	*/
	} 
	func saveHistory  { 
		if lHistory { 
			oUndo.AddToHistory(self)
		} 
	} 
	func undo  { 
		oUndo.undo(self)
	} 
	func enableHistory  { 
		lHistory = True
	} 
	func disableHistory  { 
		lHistory = False
	} 
	func clearHistory  { 
		#/*
		#		Goto Line
		#	*/
		oUndo.clearHistory()
	} 
	func GotoLine  { 
		Open_Window(:GotoLineController)
		Last_Window().setParentObject(self)
		#/*
		#		Select step using the Step Name
		#	*/
	} 
	func SelectStepByName cName { 
		aTree = oModel.oStepsTreeModel.GetData()
		for item in aTree step 1 { 
			aContent = item[C_TREEMODEL_CONTENT]
			cStepName = aContent[:name]
			cStepName = trim(oModel.RemoveTags(cStepName))
			if cStepName = cName { 
				oItem = oView.oStepsTree.GetObjByID(item[C_TREEMODEL_NODEID])
				oView.oStepsTree.SetCurrentItem(oItem,0)
				exit 1
			} 
		} 
		#/*
		#		Create Event Methods Automatically
		#		After adding the event in the form designer
		#	*/
	} 
	func NewEventName cFunctionName { 
		cFunctionName = trim(cFunctionName)
		#Be sure that we have saved form file
		if parent().FormDesigner().ActiveFileName() = "" { 
			return 
		} 
		#Be sure that the Controller class source code is opened
		cFileNameInFormDesigner = substr(parent().FormDesigner().ActiveFileName(),"."+T_PWCT_FORMDESIGNER_FILEEXTENSION,T_VSF_CONTROLLER+"."+T_VSF_EXTENSION)
		if trim(lower(oVisualSourceFile.cFileName))! = trim(lower(cFileNameInFormDesigner)) { 
			return 
		} 
		#Be sure that the event code doesn't contains (, ', ", ` and spaces
		if substr(cFunctionName," ") OR substr(cFunctionName,"'") OR substr(cFunctionName,'"') OR substr(cFunctionName,"`") OR substr(cFunctionName,"(") { 
			return 
		} 
		#Select the Step (Methods) as parent
		SelectStepByName(T_FORMEVENTS_PARENTSTEP)
		#Create the Event Code
		cStr = WindowsNL()+Tab+"func "+cFunctionName+WindowsNL()+Tab+Tab+T_FORMEVENTS_VIEWOBJECT+" {"+WindowsNL()+Tab+Tab+Tab+WindowsNL()+Tab+Tab+"}"+WindowsNL()
		ComponentsBrowserWindow().EnglishTextualCodeToVisualCode(cStr)
	} 
	func DropEvent  { 
		#Source (Dragged Step)
		oItem = oView.oStepsTree.currentItem()
		nStepID = oView.oStepsTree.GetIDByObj(oItem)
		#Destination (Step)
		pos = oView.oTreeFilter2.getDropEventObject().pos()
		droppedIndex = oView.oStepsTree.indexAt(pos)
		if !droppedIndex.isValid() { 
			return 
		} 
		oDroppedItem = oView.oStepsTree.itemAt(pos.x(),pos.y())
		if oDroppedItem.pObject = NULL { 
			return 
		} 
		#Check if the source is the same as the destination
		if oItem.pObject = oDroppedItem.pObject { 
			return 
		} 
		#Check if the destination is one of the source children
		aIDs = oModel.oStepsTreeModel.ChildrenIDs(nStepID)
		nDestStepID = oView.oStepsTree.GetIDByObj(oDroppedItem)
		if std_find(aIDs,nDestStepID) { 
			return 
		} 
		#Check if they have the same parent and dest. is above source directly
		if oModel.getStepParent(nStepID) = oModel.getStepParent(nDestStepID) { 
			nParentID = oModel.getStepParent(nStepID)
			aChildren = oModel.oStepsTreeModel.ChildrenOneLevel(nParentID)
			if find(aChildren,nDestStepID) = find(aChildren,nStepID)-1 { 
				oView.oStepsTree.SetCurrentItem(oDroppedItem,0)
				oDroppedItem = oItem
			} 
		} 
		#Cut & Paste
		if cutStepsAction() { 
			oView.oStepsTree.SetCurrentItem(oDroppedItem,0)
			if pasteStepsAction() { 
				expandItems(oView.oStepsTree.currentItem())
			} 
		} 
	} 
	func expandItems oParentItem { 
		aSteps = oView.oStepsTree.StepsList(oParentItem)
		for oItem in aSteps step 1 { 
			oItem.setexpanded(True)
		} 
	} 
private
