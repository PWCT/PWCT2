/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	: Components Browser Controller Class
**	Date 		: 2017.02.01
**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentsBrowserController from WindowsControllerParent

	oView 			= new ComponentsBrowserView
	oModel 			= new TreeModel
	cComponentsPath 	= C_CB_COMPONENTSPATH 

	lHideOnlyDontClose 	= True

	# Write Ring source code (list) instead of using SQLite
		lWriteComponentsFile	= False	
	# Use Ring source code instead of using SQLite
		if PWCTIsMobile(:UseComponentsFile) {
			lUseComponentsFile	= False 
		else 
			lUseComponentsFile	= False
		}

	if PWCTIsMobile(:InteractionPagesInGoalDesigner) {
		lInteractionPagesInGoalDesigner = False
	else
		lInteractionPagesInGoalDesigner = ! C_STEPSTREE_OPENINTERACTIONSINNEWWINDOWS
	}

	# Search Result 
		lSearchResult = False 

	# Special Search Window 
		if PWCTIsMobile(:SpecialSearchWindow) {
			lSpecialSearchWindow = False 
		else 
			lSpecialSearchWindow = True 
		}

	# Escape Key (To close the window)
		lEscapeKey = False

	# Always show the special search window 
		lAlwaysShowSpecialWindow = False

	# Auto-Complete 
		lSupportAutoComplete = True

	/*
		Purpose : Key Press Action
		Parameters : None
		Output : None
	*/

	func KeyPressAction
		nKeyCode = oView.oWinFilter.getKeyCode()
		switch nKeyCode {	
		case Qt_Key_Escape
			if lSpecialSearchWindow {				
				HideRingCode()
			}
			if lEscapeKey {
				CloseAction()	
			}
		}

	/*
		Purpose : Enter Press Action
		Parameters : None
		Output : None
	*/

	func EnterPressAction
		oView.oTextFilter.setEventOutput(False)
		if oView.oTextFilter.getKeyCode() = 16777220 {	
			SelectAction()	
		}


	/*
		Purpose : Add Components to the List
		Parameters : None
		Output : None
	*/

	func AddComponents
		if ! lUseComponentsFile {
			oVisualSourceFile = new VisualSourceFile
			if isWebAssembly() {
				oVisualSourceFile.cFileName = T_CB_COMPONENTSFILE # "vpl/components.pwct"
			elseif PWCTisMobile(:ComponentsFile)
				oVisualSourceFile.cFileName = CurrentDir() + "/" + T_CB_COMPONENTSFILE # "vpl/components.pwct"
			else 
				oVisualSourceFile.cFileName = T_CB_COMPONENTSFILE # "vpl/components.pwct"
			}
			oVisualSourceFile.Open()
			oVisualSourceFile.LoadTables()
			aStepsTree   = oVisualSourceFile.GetStepsTreeTable()
			nStepsID     = oVisualSourceFile.GetStepsID()
			oVisualSourceFile.Close()
		else 
			aStepsTree = $aComponentsStepsTree
			nStepsID   = $nComponentsStepsID
		}
		if lWriteComponentsFile {
			cCode = "$aComponentsStepsTree = " + List2RingCode(aStepsTree) + nl
			cCode += "$nComponentsStepsID = " + oVisualSourceFile.GetStepsID() + nl
			write("componentsbrowser/componentslist.ring",cCode)
		}
		oModel.SetData(aStepsTree)
		oModel.SetID(nStepsID)
		oView.oComponentsTree {
			blocksignals(True)
			setupdatesenabled(False)
			nMax = len(aStepsTree)
			for x = 2 to nMax {
				nStepID      	= aStepsTree[x][1]
				nParentID   	= aStepsTree[x][2]
				cStepName  	= aStepsTree[x][3][:name]
				SerialAdd2(nParentID,nStepID,cStepName)								
			}
			setupdatesenabled(True)
			blocksignals(False)
			oFirstStep.SetExpanded(True)
			ActivateTheFirstStep()
		}


	/*
		Purpose : Search in the Components list
		Parameters : None
		Output : None
	*/

	func SearchAction

		# Avoid this event when we have Completer Popup (Listbox)
		# Because using Backspace key (In the Keyboard) and deleting large code 
		# Could lead to crash because of this event code & Completer Popup code 
		# To Test this past large code (Many Lines) then use backspace to delete each letter 

			if ! NoCompleter() {
				if oView.oTextSearch.completer().popup().isvisible() {
					return 
				}
			}

		cFind = trim(oView.oTextSearch.Text())
		aTree = oModel.GetData()
		if cFind = "" {
			oView.oComponentsTree {
				SetCurrentItem(oFirstStep,0)
			}
			if lSpecialSearchWindow {
				HideRingCode()
			}
			return
		}
		lSearchResult = False 
		nMax = len(aTree) 
		for x=2 to nMax {
			item = aTree[x]
			aContent = item[C_TREEMODEL_CONTENT]
			cStepName = aContent[:name]
			cStepCode = aContent[:code]
			cStepName = lower(cStepName)
			cFind = lower(cFind)
			if left(cStepName,len(cFind)) = cFind  and 
				trim(cStepCode) != NULL {			
				nID =  item[C_TREEMODEL_NODEID]
				oItem = oView.oComponentsTree.GetObjByID(nID)
				oView.oComponentsTree.SetCurrentItem(oItem,0)
				oView.oComponentsTree.ScrollToItem(oItem,0)	
				lSearchResult = True
				if ! lAlwaysShowSpecialWindow {
					if lSpecialSearchWindow {
						HideRingCode()
					}
					return 
				else 
					exit
				}
			}
		}
		if lSearchResult = False {
			oView.oComponentsTree { SetCurrentItem(oFirstStep,0) }
		}
		if lSpecialSearchWindow {
			# Avoid lower(cFind) to support upper/lower letters
				cFind = trim(oView.oTextSearch.Text())
			if lSearchResult {
				cFind += " --> [ " + aContent[:name] + " ]"
			}
			QuickMsg().setText(cFind)
			QuickMsg().centerTheWindow()
			ShowRingCode()
			# The next code is a workaround in a bug in Qt for WebAssembly 
			# Because the LineEdit lost the focus for the QuickMsg window 
			# And we want to keep it 
			QuickMsg().oView.win.activatewindow()
			oView.oTextSearch.activatewindow()
			oView.oTextSearch.setFocus(7)
		}


	func isSearchFindComponent cFind 
		lSearchResult = False 
		aTree = oModel.GetData()
		nMax = len(aTree) 
		for x=2 to nMax {
			item = aTree[x]
			aContent = item[C_TREEMODEL_CONTENT]
			cStepName = aContent[:name]
			cStepCode = aContent[:code]
			cStepName = lower(cStepName)
			cFind = lower(cFind)
			if left(cStepName,len(cFind)) = cFind and 
				trim(cStepCode) != NULL {			
				lSearchResult = True
				return [lSearchResult,cFind + " --> [ " + aContent[:name] + " ]"]
			}
		}
		return [lSearchResult,cFind]


	/*
		Purpose : Open the Selected component to use it
		Parameters : None
		Output : None
	*/

	func SelectAction
		if lSpecialSearchWindow {
			HideRingCode()
		}
		if lSearchResult {	
			lSearchResult = False 
			OpenSelected()
			return 
		}

		# Get the Search Value 
			cFind = oView.oTextSearch.Text()	
			TextualCodeToVisualCode(cFind)
		# Clear the Search Textbox 
			oView.oTextSearch.SetText("")
		# Run the application and display the output (optional)
			parent().AutoRun()
		# The Focus 
			parent().parent().oView.oDockGoalDesigner.raise()
			parent().oView.win.raise()
			parent().oView.win.activatewindow()
			parent().oView.oStepsTree.setFocus(0)
		# When working on Mobile (Close the components browser window)
			if PWCTIsMobile(:CloseCBAfterRingCode2PWCT) {
				closeAction()
			}

	func TextualCodeToVisualCode cFind 	
		# Convert Ring Code to PWCT (Steps & Interactions)
			aLists = RingCode2PWCT(cFind)
			if len(aLists) = 0 { return }
		# Save the History for undo operations 
			parent().saveHistory()
		# Get The Output of the Conversion
			aStepsTree = aLists[:StepsTreeTable]
			aInteractions = aLists[:InteractionsTable]
		# Update the Interactions ID
			# Map between the InteractionID and the new NodeID 
				aInteractionIDsMap = []
			# Update Each Node ID
				nMax = len(aInteractions)
				for x=1 to nMax { 	
					aInteractionIDsMap + [  aInteractions[x][C_INTERACTIONRECORD_ID],
								parent().oModel.oInteractionModel.nID ]		
					aInteractions[x][C_INTERACTIONRECORD_ID] = parent().oModel.oInteractionModel.nID
					parent().oModel.oInteractionModel.nID++
				}
		# Get the Parent Step 
			oItem  = parent().oView.oStepsTree.currentItem()
			nParentID = parent().oView.oStepsTree.GetIDByObj(oItem)

		# Update the Steps ID
			# Map between the NodeID and the new NodeID 
				aIDsMap = [[1,nParentID]]
			# Update Each Node ID
			nMax = len(aStepsTree)
			for x=1 to nMax { 	
				aIDsMap + [aStepsTree[x][C_TREEMODEL_NODEID],parent().oModel.oStepsTreeModel.nID]		
				aStepsTree[x][C_TREEMODEL_NODEID] = parent().oModel.oStepsTreeModel.nID
				parent().oModel.oStepsTreeModel.nID++
				# Update the Parent ID
					nPos = find(aIDsMap,aStepsTree[x][C_TREEMODEL_PARENTID],1)
					if nPos > 0 {
						aStepsTree[x][C_TREEMODEL_PARENTID] = aIDsMap[nPos][2]
					}
				# Update the Interaction ID 
					nPos = find(aInteractionIDsMap,aStepsTree[x][C_TREEMODEL_CONTENT][:InteractionID],1)
					if nPos > 0 {
						aStepsTree[x][C_TREEMODEL_CONTENT][:InteractionID] = aInteractionIDsMap[nPos][2]
					}			
			}
		# Add Steps Tree to Goal Designer 
		# We use insert to Keep the Order of the Steps 
			aChildren = parent().oModel.oStepsTreeModel.Children(nParentID)
			if len(aChildren) > 0 {
				nPos = aChildren[len(aChildren)]
			else
				nPos = find(parent().oModel.oStepsTreeModel.aList,nParentID,C_TREEMODEL_NODEID)
			}

			lUpdateParent = not parent().AllowInteractButton()
				
			for x = len(aStepsTree) to 2 step -1 {
				node = aStepsTree[x] 
				# When we add step in location that doesn't support children (Not Start Here)
				# We check the First Generated Step 
				# We don't use (if x = 2) because we may have many parents 
				# Like when we use (x=1 y=2 z=3) each one will be the first generated step 
				# So we use (if node[C_TREEMODEL_PARENTID] = nParentID)
					if lUpdateParent and node[C_TREEMODEL_PARENTID] = nParentID { 
							# Update the Generated Step Parent 
							# To be the parent of the selected step (Not Start Here)
							# That we used to start the Interaction 
							node[C_TREEMODEL_PARENTID] = parent().oModel.getStepParent(nParentID)
					}
				Insert(parent().oModel.oStepsTreeModel.aList,nPos,node)
			}
		# Add Interactions to Goal Designer 
			nMax = len(aInteractions)
			for t=2 to nMax {
				parent().oModel.oInteractionModel.aList + aInteractions[t]
			}
		parent().oView.oStepsTree.setUpdatesEnabled(False)
		parent().oView.oStepsTree.blockSignals(True)
		parent().superSerialAdd(aStepsTree)
		parent().oView.oStepsTree.setUpdatesEnabled(True)
		parent().oView.oStepsTree.blockSignals(False)
		parent().UpdateTheTimeMachine()
		# To Correctly draw items (Avoid a Qt bug in drawing)
			parent().oView.FixDrawing()
		# Select the First Generated Step That Allow New Interactions 
			for aStep in aStepsTree {
				if aStep[C_TREEMODEL_CONTENT][:steptype] = C_STEPTYPE_ALLOWINTERACTION {
					oItem = parent().oView.oStepsTree.GetObjByID(aStep[C_TREEMODEL_NODEID])
					parent().oView.oStepsTree.SetCurrentItem(oItem,0)	
					exit
				}				
			}

	func OpenSelected
		# Clear the Search TextBox
			oView.oTextSearch.SetText("")
		oItem  = oView.oComponentsTree.currentItem()
		nID = oView.oComponentsTree.GetIDByObj(oItem)
		OpenSelectedByID(nID)

	func OpenSelectedByID nID
		if nID = 1 {	# Avoid root node
			return
		}
		aContent = oModel.GetNodeContent(nID)
		cFile = aContent[:Code]
		if cFile = NULL { return }
		# Check the Rules 
			if ! parent().RulesAllow(cFile)  {
				msginfo(T_CB_SORRY,T_CB_CANTUSECOMPONENT)
				return 
			}
		cFilePath = cComponentsPath + cFile + ".ring"
		Parent().CheckLoadingComponent(cFilePath)
		# Start the Component
			if lInteractionPagesInGoalDesigner {
				Open_WindowNoShow(cFile+:ComponentController)
				parent().oView.layoutVPages.InsertWidget(0,Last_Window().oView.win,0,0)
				Last_Window().nInsideGoalDesigner = True
				Last_Window().Start()			# Show The Window
				parent().oView.widgetVPages.Show()	# Show the Splitter Widget
				parent().oView.oVPagesScroll.Show()
				parent().nInteractionPagesToModifyCount++
			else 
				Open_Window(cFile+:ComponentController)
			}


			Last_Window().setParentObject(parent())
			Last_Window().cComponent = cFile
			Last_Window().nInteractionMode = C_INTERACTIONMODE_NEW
			# Register the interaction page in the goal designer 
				parent().RegisterInteractionPage()
			Last_Window().InternalAfterOpen()
			Last_Window().AfterOpen()

		if not Parent().lComponentsBrowserInGoalDesigner and not parent().isDockForComponentsBrowser() {
			oView.win.hide()
		}
		if ( PWCTIsMobile(:ComponentSelected) and parent().isDockForComponentsBrowser()) or
			C_ENV_DEFAULT_MODE = C_ENV_MODE_GD {
			parent().parent().oView.oDockGoalDesigner.raise()
		}
		parent().oView.win.raise()
		Last_Window().oView.win.raise()
		Last_Window().oView.win.show()
		# If we use components without interaction pages 
		# Then we don't have setTheFocusToTheFirstTextBox() !
			if isMethod(Last_Window(),:setTheFocusToTheFirstTextBox) {
				Last_Window().setTheFocusToTheFirstTextBox()
			}

	/*
		Purpose : Show the components browser window and activate search textBox
		Parameters : None
		Output : None
	*/

 	func Start
		if PWCTisMobile(:ComponentsBrowser) {
			oView.win.showmaximized()
		else
			Super.Start()
		}
		oView.win.activateWindow()
		oView.oTextSearch.SetFocus(0)
		if not Parent().lComponentsBrowserInGoalDesigner {
			oView.win {
				if not PWCTisMobile(:ComponentsBrowser) {
					oDesktop = new qDesktopwidget() 
					move((oDesktop.width()-500)/2,(oDesktop.height()-500)/2)
					resize(500,500)
				}
			}
		}

		if lSpecialSearchWindow {
			if ! isMethod(self,:QuickMsg) {
				open_windowandlink(:quickmsgController,self)
				HideRingCode()
			}
		}

	/*
		Purpose : Close the window
		Parameters : None
		Output : None
	*/

	func CloseAction
		if lHideOnlyDontClose {
			oView.win.hide()
			Parent().ComponentsBrowserHidden()
			if parent().isDockForComponentsBrowser() {
				parent().parent().oView.oDockComponentsBrowser.Hide()
			}
			return 
		}
		Parent().ComponentsBrowserClosed()
		Super.CloseAction()

	/*
		Update the font size 
	*/
	func UpdateFontSize nSize
		oView.oComponentsTree { 
			nFontSize = nSize
			TreeStyle()
		}

	/*
		Function to get component by file name, used by the Time Mahcine 
	*/
	func GetComponentByFileName cComponent 
		for item in oModel.getData() {
			if item[C_TREEMODEL_CONTENT][:code] = cComponent  {
				return item 
			}
		}

	func FindAndSelectComponent cFind
		aTree = oModel.GetData()
		if cFind = "" {
			return False
		}
		nMax = len(aTree) 
		for x=2 to nMax {
			item = aTree[x]
			aContent = item[C_TREEMODEL_CONTENT]
			cStepName = aContent[:name]
			cStepCode = aContent[:code]
			cStepName = lower(cStepName)
			cFind = lower(cFind)
			if left(cStepName,len(cFind)) = cFind and 
				trim(cStepCode) != NULL {			
				nID =  item[C_TREEMODEL_NODEID]
				OpenSelectedByID(nID)
				return True 
			}
		}
		return False

	func ShowRingCode
		QuickMsg().show()
		# Support Auto-Complete
			if lSupportAutoComplete and not parent().lAvoidComponentsBrowserAutoComplete{
				if NoCompleter() {
					parent().oAutoComplete.supportControlWithoutSettingItAsParent(parent(),oView.oTextSearch)
				else 
					if  parent().oAutoComplete.CheckUsingAutoCompleteCache(parent()) {
						oCompleter = oView.oTextSearch.completer()
						oView.oTextSearch.setcompleter(NULL)
						parent().oAutoComplete.supportControlWithoutSettingItAsParent(parent(),oView.oTextSearch)
						oCompleter.delete()
					}
				}
			else 
				oView.oTextSearch.setcompleter(NULL)
			}

	func NoCompleter 
		return isNull(oView.oTextSearch.completer().pObject)

	func HideRingCode
		QuickMsg().hide()
		oView.oTextSearch.setcompleter(NULL)
