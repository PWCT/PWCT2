/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Component Controller Parent Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ComponentControllerParent from WindowsControllerParent

	oItem  
	oParent = NULL

	nIID	= NULL		# Interaction ID
	cComponent  = NULL	# Component Name

	nInteractionMode		# New or Modify

	func NewParentStep cStep
		SaveRoot()
		oItem = parent().AddGeneratedStep(cStep,nIID)
		parent().oView.oStepsTree.SetCurrentItem(oItem,0)

	func NewStep cStep
		SaveRoot()
		oItem = parent().AddGeneratedStep(cStep,nIID)

	func SaveRoot
		# Save the root node
			if ISNULL(oParent) { 
				oParent = parent().oView.oStepsTree.currentItem() 
				GenerateIID()
				SaveVariablesValues()
			}

	func GenerateIID
				nIID = parent().AddGeneratedInteraction(cComponent)

	func SaveVariablesValues
			parent().SaveVariablesValues(nIID,oView.GetVariablesValues())

	func SetStepCode cCode
		nStepID = parent().oView.oStepsTree.GetIDByObj(oItem)
		parent().oModel.SaveStepCode(nStepID,cCode)

	func GetParentStep 
		oItem = parent().oView.oStepsTree.currentItem()
		return oItem

	func GetActiveStep 
		return oItem

	func SetActiveStep oNewItem
		oItem = oNewItem
		parent().oView.oStepsTree.SetCurrentItem(oItem,0)

	func KeyPressAction
		switch oView.oWinFilter.getKeyCode() {
			case Qt_Key_Escape 
				CloseAction()		
			case 87	# CTRL+W
				OkAction()
			case 71 	# CTRL+G
				AgainAction()
		}

	func Variable cVariable
		return oView.Variable(cVariable)

	func OkAction			
		GenerateAction()
		CloseAction()

	func AgainAction			
		GenerateAction()
		parent().oView.oStepsTree.SetCurrentItem(oParent,0)
		oParent = NULL

	func GenerateAction		# To be written in the component


