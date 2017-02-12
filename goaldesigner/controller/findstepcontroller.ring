/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class FindStepController from WindowsControllerParent

	oView = new FindStepView

	aStepIDResult = [] # Array contains the IDs of the search result

	/*
		Purpose : Find Value Action
		Parameters : None
		Output : None
	*/

	func FindValueAction
		cFind = oView.oSearchValue.Text()	
		aTree = Parent().oModel.oStepsTreeModel.GetData()
		aStepIDResult = []
		oView.oListResult.Clear()
		lState = oView.oSearchCase.CheckState()
		for item in aTree {
			aContent = item[C_TREEMODEL_CONTENT]
			if not aContent[:visible] { loop }
			cStepName = aContent[:name]
			cStepName = Parent().oModel.RemoveTags(cStepName)
			cStepNamePure = cStepName
			if lState = False {	# Don't Match the case
				cStepName = lower(cStepName)
				cFind = lower(cFind)
			}
			if substr(cStepName,cFind) > 0 {				
				aStepIDResult + item[C_TREEMODEL_NODEID]
				oView.oListResult.AddItem(cStepNamePure)
			}
		}
		if len(aStepIDResult) > 0 {
			oView.oListResult.SetCurrentRow(0,2)
		}

	/*
		Purpose : Item Selected Action
		Parameters : None
		Output : None
	*/

	func ItemSelectedAction
		if len(aStepIDResult) = 0 { return }		
		nIndex = oView.oListResult.CurrentRow() + 1
		nStepID = aStepIDResult[nIndex]
		Try {
			oItem = Parent().oView.oStepsTree.GetObjByID(nStepID)
			Parent().oView.oStepsTree.SetCurrentItem(oItem,0)			
		Catch	
			new qmessagebox(oView.win)
 			 {
    		            	setwindowtitle(T_GD_FS_SORRY) # "Sorry"
       			         	settext(T_GD_FD_CANTFINDTHEITEM) # "Can't find the item"                 
                			setstandardbuttons(QMessageBox_Yes)
                			show()
       			 }
			# The Item is not found (Maybe because of Time Position Change)		
				cEvent = oView.oListResult.getCurrentItemChangedEvent()
				oView.oListResult.setCurrentItemChangedEvent("")
				FindValueAction()	
				oView.oListResult.setCurrentItemChangedEvent(cEvent)
		}		

	/*
		Purpose : Replace Action
		Parameters : None
		Output : None
	*/

	func ReplaceAction
		if len(aStepIDResult) = 0 { return }	
		nIndex = oView.oListResult.CurrentRow() + 1
		nStepID = aStepIDResult[nIndex]	
		ReplaceStep(nStepID)

	/*
		Purpose : Replace Step 
		Parameters : The Step ID
		Output :  None
	*/

	func ReplaceStep nStepID
		oItem = Parent().oView.oStepsTree.GetObjByID(nStepID)
		cFind = oView.oSearchValue.Text()	
		if cFind = "" { return }
		cReplace = oView.oReplaceValue.Text()	
		cText = Parent().oModel.GetStepName(nStepID)
		lState = oView.oSearchCase.CheckState()
		if lState = false {
			cText = substr(cText,cFind,cReplace,true) 
		else
			cText = substr(cText,cFind,cReplace) 
		}
		Parent().oView.oStepsTree.editstep(oItem,cText,Parent().oModel.GetStepIgnoreStatus(nStepID))
		Parent().oModel.EditStepName(nStepID,cText)
		oView.oListResult.Item(find(aStepIDResult,nStepID)-1).SetText(cText)

	/*
		Purpose :  Replace All Action
		Parameters : None
		Output :  None
	*/

	func ReplaceAllAction
		if len(aStepIDResult) = 0 { return }	
		for nStepID in aStepIDResult {
			ReplaceStep(nStepID)
		}

	/*
		Purpose : Search Key Press Action
		Parameters : None
		Output : None
	*/

	func SearchKeyPressAction
		if oView.oSearchFilter.getKeyCode() = Qt_Key_Escape {	
			CloseAction()		
		}
