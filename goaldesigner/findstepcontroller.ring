/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class FindStepController from WindowsBase

	oView = new FindStepView

	oGDID		# Goal Designer Object ID 

	aStepIDResult = [] # Array contains the IDs of the search result

	func Start
		oView.win.Show()

	func FindValueAction
		cFind = oView.oSearchValue.Text()	
		aTree = GD().oModel.oStepsTreeModel.GetData()
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
		oItem = GD().oView.oStepsTree.GetObjByID(nStepID)
		GD().oView.oStepsTree.SetCurrentItem(oItem,0)

	func setGoalDesignerObject oGD
		oGDID = oGD.ObjectID()

	func GD
		return GetObjectByID(oGDID)

	func ReplaceAction
		if len(aStepIDResult) = 0 { return }	
		nIndex = oView.oListResult.CurrentRow() + 1
		nStepID = aStepIDResult[nIndex]	
		ReplaceStep(nStepID)

	func ReplaceStep nStepID
		oItem = GD().oView.oStepsTree.GetObjByID(nStepID)
		cFind = oView.oSearchValue.Text()	
		cReplace = oView.oReplaceValue.Text()	
		cText = GD().oModel.GetStepName(nStepID)
		lState = oView.oSearchCase.CheckState()
		if lState = false {
			cText = substr(cText,cFind,cReplace,true) 
		else
			cText = substr(cText,cFind,cReplace) 
		}
		GD().oView.oStepsTree.editstep(oItem,cText,GD().oModel.GetStepIgnoreStatus(nStepID))
		GD().oModel.EditStepName(nStepID,cText)
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

	func CloseAction
		oView.Close()
		Super.Close()
