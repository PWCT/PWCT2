/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class FindStepController from GoalDesignerSubWindowsParent

	oView = new FindStepView

	aStepIDResult = [] # Array contains the IDs of the search result

	func FindValueAction
		cFind = oView.oSearchValue.Text()	
		aTree = Parent().oModel.oStepsTreeModel.GetData()
		aStepIDResult = []
		oView.oListResult.Clear()
		lState = oView.oSearchCase.CheckState()
		for item in aTree {
			aContent = item[C_TREEMODEL_CONTENT]
			cStepName = aContent[:name]
			if lState = False {	# Don't Match the case
				cStepName = lower(cStepName)
				cFind = lower(cFind)
			}
			if substr(cStepName,cFind) > 0 {				
				aStepIDResult + item[C_TREEMODEL_NODEID]
				oView.oListResult.AddItem(aContent[:name])
			}
		}
		if len(aStepIDResult) > 0 {
			oView.oListResult.SetCurrentRow(0,2)
		}

	func ItemSelectedAction
		if len(aStepIDResult) = 0 { return }		
		nIndex = oView.oListResult.CurrentRow() + 1
		nStepID = aStepIDResult[nIndex]
		oItem = Parent().oView.oStepsTree.GetObjByID(nStepID)
		Parent().oView.oStepsTree.SetCurrentItem(oItem,0)

	func ReplaceAction
		if len(aStepIDResult) = 0 { return }	
		nIndex = oView.oListResult.CurrentRow() + 1
		nStepID = aStepIDResult[nIndex]	
		ReplaceStep(nStepID)

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

	func ReplaceAllAction
		if len(aStepIDResult) = 0 { return }	
		for nStepID in aStepIDResult {
			ReplaceStep(nStepID)
		}

	func SearchKeyPressAction
		if oView.oSearchFilter.getKeyCode() = Qt_Key_Escape {	
			CloseAction()		
		}
