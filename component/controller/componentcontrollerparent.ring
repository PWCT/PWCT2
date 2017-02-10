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

	cVariablesValues		# Variables Values

	nStepNumber = 0 	# Step Number

	lAllowInteraction	= False	# The step allow sub steps

	func NewParentStep cStep
		if nInteractionMode = C_INTERACTIONMODE_MODIFY {
			nStepID = SelectStep()
			EditStepName(cStep,nStepID)
			return
		}
		SaveRoot()
		nStepNumber++
		AddStep(cStep,nIID,nStepNumber)
		parent().oView.oStepsTree.SetCurrentItem(oItem,0)

	func NewStep cStep
		if nInteractionMode = C_INTERACTIONMODE_MODIFY {
			nStepID = SelectStep()
			EditStepName(cStep,nStepID)
			return
		}
		SaveRoot()
		nStepNumber++
		AddStep(cStep,nIID,nStepNumber)

	func AddStep cStep,nIID,nStepNumber
		if nStepNumber = 1 {
			nStepType = C_STEPTYPE_ROOT
		else
			nStepType = C_STEPTYPE_INFO
		}
		if lAllowInteraction {
			lAllowInteraction = False
			nStepType = C_STEPTYPE_ALLOWINTERACTION
		}
		oItem = parent().AddGeneratedStep(cStep,nIID,nStepNumber,nStepType)

	func AllowInteraction
		lAllowInteraction = True

	func SelectStep   
		nStepNumber++
		if nStepNumber = 1 {
			SaveVariablesValues()
		}
		aList = parent().SelectStep(nIID,nStepNumber)
		oItem = aList[1]
		nStepID = aList[2]
		return nStepID

	func EditStepName cStep,nStepID
		# Set the Step Color
			nStepType = parent().oModel.GetStepType(nStepID)
			parent().SetStepColor(nStepType)
		# Modify the step
			parent().oView.oStepsTree.editstep(oItem,cStep,parent().oModel.GetStepIgnoreStatus(nStepID))
			parent().oModel.EditStepName(nStepID,cStep)

	func SaveRoot
		# Save the root node
			if ISNULL(oParent) { 
				oParent = parent().oView.oStepsTree.currentItem() 
				GenerateIID()
				SaveVariablesValues()
			}

	func GenerateIID
		nIID = parent().AddGeneratedInteraction(cComponent)
		nStepNumber = 0

	func SaveVariablesValues
		parent().SaveVariablesValues(nIID,oView.GetVariablesValues())

	func SetVariablesValues
		oView.SetVariablesValues(cVariablesValues)

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
				CloseBtnAction()		
			case 87	# CTRL+W
				OkAction()
			case 71 	# CTRL+G
				AgainAction()
		}

	func Variable cVariable
		return oView.Variable(cVariable)

	func CheckInteract
		if not Parent().AllowInteractButton() {
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTINTERACT)
			return false
		}
		return True

	func OkAction	
		if nInteractionMode = C_INTERACTIONMODE_MODIFY  or CheckInteract() {
			GenerateAction()
			parent().oView.oStepsTree.setFocus(0)
			CloseBtnAction()				
		}

	func AgainAction	
		if CheckInteract() {
			noldInteractionMode = nInteractionMode
			nInteractionMode = C_INTERACTIONMODE_NEW	
			GenerateAction()
			parent().oView.oStepsTree.SetCurrentItem(oParent,0)
			oParent = NULL
			nInteractionMode = noldInteractionMode
			nStepNumber = 0
		}

	func Start
		Super.Start()
		oView.win.activateWindow()
		if oView.lFirstTextBox = False {
			oView.oFirstText.SetFocus(0)
		}

	func CloseBtnAction
		if nInteractionMode = C_INTERACTIONMODE_MODIFY  {
			parent().InteractionPageToModifyClosed()
		}
		Super.CloseAction()

	func GenerateAction		# To be written in the component


