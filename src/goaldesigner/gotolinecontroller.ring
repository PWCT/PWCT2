/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goto Line Controller Class
**	Date : 2021.06.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GotoLineController from WindowsControllerParent

	oView = new GotoLineView

	/*
		Purpose : Find Value Action
		Parameters : None
		Output : None
	*/

	func GotoLineAction
		cFind = oView.oSearchValue.Text()	
		nLine = NumOrZero(cFind) 
		if nLine = 0 { return }
		cCode = ""
		aTree = Parent().oModel.oStepsTreeModel.GetData()
		for item in aTree {
			aContent = item[C_TREEMODEL_CONTENT]
			if trim(aContent[:code]) != "" {
				if cCode != "" { cCode += nl }
				cCode += aContent[:code]
			}
			if lines(cCode) >= nLine and cCode != "" {
				oItem = parent().oView.oStepsTree.GetObjByID(item[C_TREEMODEL_NODEID])
				parent().oView.oStepsTree.SetCurrentItem(oItem,0)	
				exit 
			}
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
