/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Find Step Controller Class
**	Date : 2016.11.22
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class FindStepController from WindowsBase

	oView = new FindStepView

	oGDRef 	# Goal Designer Object Reference

	func Start
		oView.win.Show()

	func FindValueAction
		cFind = oView.oSearchValue.Text()	
		aTree = GD().oModel.oStepsTreeModel.GetData()
		oView.oListResult.Clear()
		for item in aTree {
			aContent = item[C_TREEMODEL_CONTENT]
			if substr(aContent[:name],cFind) > 0 {				
				oView.oListResult.AddItem(aContent[:name])
			}
		}
	
	func setGoalDesignerObject oGD
		oGDRef = Object2Pointer(oGD)  

	func GD
		return Pointer2Object(oGDRef)

	func ReplaceAction

	func ReplaceAllAction

	func SearchKeyPressAction
		if oView.oSearchFilter.getKeyCode() = Qt_Key_Escape {	
			CloseAction()		
		}

	func CloseAction
		oView.Close()
		Super.Close()
