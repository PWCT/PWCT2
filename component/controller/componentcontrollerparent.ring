/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Component Controller Parent Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ComponentControllerParent from WindowsControllerParent

	oItem  

	func NewParentStep cStep
		oItem = parent().AddStep(cStep)
		parent().oView.oStepsTree.SetCurrentItem(oItem,0)

	func NewStep cStep
		oItem = parent().AddStep(cStep)

	func SetStepCode cCode
		nStepID = parent().oView.oStepsTree.GetIDByObj(oItem)
		parent().oModel.SaveStepCode(nStepID,cCode)

	func SaveParent
		oItem = parent().oView.oStepsTree.currentItem()
		return oItem

	func SaveLast
		return oItem

	func SetParent oNewItem
		oItem = oNewItem
		parent().oView.oStepsTree.SetCurrentItem(oItem,0)
