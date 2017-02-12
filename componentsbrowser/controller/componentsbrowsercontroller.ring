/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Components Browser Controller Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentsBrowserController from WindowsControllerParent

	oView = new ComponentsBrowserView
	oModel = new TreeModel
	cComponentsPath = C_CB_COMPONENTSPATH # "vpl/ringpwct/"

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
		oVisualSourceFile = new VisualSourceFile
		oVisualSourceFile.cFileName = T_CB_COMPONENTSFILE # "vpl/components.pwct"
		oVisualSourceFile.Open()
		oVisualSourceFile.LoadTables()
		aStepsTree   =  oVisualSourceFile.GetStepsTreeTable()
		oModel.SetData(aStepsTree)
		oModel.SetID(oVisualSourceFile.GetStepsID())
		oVisualSourceFile.Close()
		for x = 2 to len(aStepsTree) {
			nStepID      = aStepsTree[x][1]
			nParentID   = aStepsTree[x][2]
			cStepName  = aStepsTree[x][3][:name]
			oItem = oView.oComponentsTree.AddStep(nParentID,nStepID,cStepName)								
			oView.oComponentsTree.ScrollToItem(oItem,0)
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
		for x=2 to len(aTree) {
			item = aTree[x]
			aContent = item[C_TREEMODEL_CONTENT]
			cStepName = aContent[:name]
			cStepName = lower(cStepName)
			cFind = lower(cFind)
			if substr(cStepName,cFind) > 0 {			
				nID =  item[C_TREEMODEL_NODEID]
				oItem = oView.oComponentsTree.GetObjByID(nID)
				oView.oComponentsTree.SetCurrentItem(oItem,0)
				oView.oComponentsTree.ScrollToItem(oItem,0)				
				exit
			}
		}

	/*
		Purpose : Open the Selected component to use it
		Parameters : None
		Output : None
	*/

	func SelectAction
		oItem  = oView.oComponentsTree.currentItem()
		nID = oView.oComponentsTree.GetIDByObj(oItem)
		if nID = 1 {	# Avoid root node
			return
		}
		aContent = oModel.GetNodeContent(nID)
		cFile = aContent[:Code]
		cFilePath = cComponentsPath + cFile + ".ring"
		if fexists(cFilePath) {
			if find(aComponentsFilesList,cFilePath) = 0 { 
				aComponentsFilesList + cFilePath
				Eval("Load '" + cFilePath + "'")
			}
			# Start the Component
				Open_Window(cFile+:ComponentController)
				Last_Window().setParentObject(parent())
				Last_Window().cComponent = cFile
				Last_Window().nInteractionMode = C_INTERACTIONMODE_NEW
			# Clear the Search TextBox
				oView.oTextSearch.SetText("")
		}

	/*
		Purpose : Show the components browser window and activate search textBox
		Parameters : None
		Output : None
	*/

 	func Start
		Super.Start()
		oView.win.activateWindow()
		oView.oTextSearch.SetFocus(0)

	/*
		Purpose : Close the window
		Parameters : None
		Output : None
	*/

	func CloseAction
		Parent().ComponentsBrowserClosed()
		Super.CloseAction()
