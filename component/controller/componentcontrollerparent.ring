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

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

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

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func NewStep cStep
		if nInteractionMode = C_INTERACTIONMODE_MODIFY {
			nStepID = SelectStep()
			EditStepName(cStep,nStepID)
			return
		}
		SaveRoot()
		nStepNumber++
		AddStep(cStep,nIID,nStepNumber)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

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

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func AllowInteraction
		lAllowInteraction = True

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SelectStep   
		nStepNumber++
		if nStepNumber = 1 {
			SaveVariablesValues()
		}
		aList = parent().SelectStep(nIID,nStepNumber)
		oItem = aList[1]
		nStepID = aList[2]
		return nStepID

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func EditStepName cStep,nStepID
		# Set the Step Color
			nStepType = parent().oModel.GetStepType(nStepID)
			parent().SetStepColor(nStepType)
		# Modify the step
			parent().oView.oStepsTree.editstep(oItem,cStep,parent().oModel.GetStepIgnoreStatus(nStepID))
			parent().oModel.EditStepName(nStepID,cStep)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SaveRoot
		# Save the root node
			if ISNULL(oParent) { 
				oParent = parent().oView.oStepsTree.currentItem() 
				GenerateIID()
				SaveVariablesValues()
			}

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GenerateIID
		nIID = parent().AddGeneratedInteraction(cComponent)
		nStepNumber = 0

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SaveVariablesValues
		parent().SaveVariablesValues(nIID,oView.GetVariablesValues())

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetVariablesValues
		oView.SetVariablesValues(cVariablesValues)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetStepCode cCode
		nStepID = parent().oView.oStepsTree.GetIDByObj(oItem)
		parent().oModel.SaveStepCode(nStepID,cCode)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetParentStep 
		oItem = parent().oView.oStepsTree.currentItem()
		return oItem

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetActiveStep 
		return oItem

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func SetActiveStep oNewItem
		oItem = oNewItem
		parent().oView.oStepsTree.SetCurrentItem(oItem,0)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func KeyPressAction
		switch oView.oWinFilter.getKeyCode() {
			case Qt_Key_Escape 
				CloseBtnAction()		
			case 87	# CTRL+W
				OkAction()
			case 71 	# CTRL+G
				AgainAction()
		}

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func Variable cVariable
		return oView.Variable(cVariable)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func CheckInteract
		if not Parent().AllowInteractButton() {
			ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTINTERACT)
			return false
		}
		return True

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func OkAction	
		if nInteractionMode = C_INTERACTIONMODE_MODIFY  or CheckInteract() {
			GenerateAction()
			parent().oView.oStepsTree.setFocus(0)
			CloseBtnAction()				
		}

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

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

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func Start
		Super.Start()
		oView.win.activateWindow()
		if oView.lFirstTextBox = False {
			oView.oFirstText.SetFocus(0)
		}

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func CloseBtnAction
		if nInteractionMode = C_INTERACTIONMODE_MODIFY  {
			parent().InteractionPageToModifyClosed()
		}
		Super.CloseAction()

	func GenerateAction		# To be written in the component


