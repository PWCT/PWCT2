/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Components Browser Controller Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentsBrowserController from WindowsControllerParent

	oView = new ComponentsBrowserView
	oModel = new TreeModel

	func KeyPressAction
		if oView.oWinFilter.getKeyCode() = Qt_Key_Escape {	
			CloseAction()		
		}

	func AddComponents
		oVisualSourceFile = new VisualSourceFile
		oVisualSourceFile.cFileName = "vpl/components.pwct"
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
