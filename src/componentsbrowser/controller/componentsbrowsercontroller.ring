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
		lInteractionPagesInGoalDesigner = True
	}

	# Search Result 
		lSearchResult = False 

	/*
		Purpose : Key Press Action
		Parameters : None
		Output : None
	*/

	func KeyPressAction
		nKeyCode = oView.oWinFilter.getKeyCode()
		switch nKeyCode {	
		case Qt_Key_Escape
			CloseAction()	
		case 87	# CTRL+W
			CloseAction()	
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
		cFind = oView.oTextSearch.Text()	
		aTree = oModel.GetData()
		if cFind = "" {
			oView.oComponentsTree {
				SetCurrentItem(oFirstStep,0)
			}
			return
		}
		lSearchResult = False 
		nMax = len(aTree) 
		for x=2 to nMax {
			item = aTree[x]
			aContent = item[C_TREEMODEL_CONTENT]
			cStepName = aContent[:name]
			cStepName = lower(cStepName)
			cFind = lower(cFind)
			if left(cStepName,len(cFind)) = cFind {			
				nID =  item[C_TREEMODEL_NODEID]
				oItem = oView.oComponentsTree.GetObjByID(nID)
				oView.oComponentsTree.SetCurrentItem(oItem,0)
				oView.oComponentsTree.ScrollToItem(oItem,0)	
				lSearchResult = True
				exit
			}
		}

	/*
		Purpose : Open the Selected component to use it
		Parameters : None
		Output : None
	*/

	func SelectAction
		if lSearchResult {
			lSearchResult = False 
			OpenSelected()
			return 
		}
		cFind = oView.oTextSearch.Text()	
		msginfo("Code",cFind)

	func OpenSelected
		oItem  = oView.oComponentsTree.currentItem()
		nID = oView.oComponentsTree.GetIDByObj(oItem)
		if nID = 1 {	# Avoid root node
			return
		}
		aContent = oModel.GetNodeContent(nID)
		cFile = aContent[:Code]
		if cFile = NULL { return }
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


		# Clear the Search TextBox
			oView.oTextSearch.SetText("")
		if not Parent().lComponentsBrowserInGoalDesigner and not parent().isDockForComponentsBrowser() {
			oView.win.hide()
		}
		if ( PWCTIsMobile(:ComponentSelected) and parent().isDockForComponentsBrowser()) or
			C_ENV_DEFAULT_MODE = C_ENV_MODE_GD {
			parent().parent().oView.oDockGoalDesigner.raise()
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
