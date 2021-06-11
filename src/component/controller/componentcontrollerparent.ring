/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	: Component Controller Parent Class
**	Date 		: 2017.02.01
**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
*/

Class ComponentControllerParent from WindowsControllerParent

	oItem  
	oParent 		= NULL

	nIID			= NULL		# Interaction ID
	cComponent  		= NULL		# Component Name

	nInteractionMode			# New or Modify
	cVariablesValues 	= NULL		# Variables Values

	nStepNumber 		= 0 		# Step Number
	lAllowInteraction	= False		# The step allow sub steps

	lNoInteractionPage 	= False		# No Interaction Page 

	oStyle 			= new HTMLStyles
	oHTMLFunctions 		= new HTMLFunctions


	nInsideGoalDesigner	= False

	lDisplayTimeProblem	= False 


	/*
		Purpose : Create a Step as parent to other steps
		Parameters : The Step Name as string 
		Output : None
	*/

	func NewParentStep cStep
		cStepName = parent().prepareStepName(cStep)
		if nInteractionMode = C_INTERACTIONMODE_MODIFY {
			nStepID = SelectStep()
			if nStepID != -1 {
				EditStepName(cStepName,nStepID)
				return
			}
			# In some cases nStepID will become NULL
			# Like a component generate many steps 
			# Then modify - avoid/delete some of these steps	
			# Then modify - add/generate these steps again 
			# Here nStepID = NULL and we are in nInteractionMode = C_INTERACTIONMODE_MODIFY {
		}
		# We do this check to avoid generating new IID while 
		# We are modifying the component 
		if nInteractionMode != C_INTERACTIONMODE_MODIFY {
			SaveRoot()
		}
		nStepNumber++
		AddStep(cStep,nIID,nStepNumber)
		parent().oView.oStepsTree.SetCurrentItem(oItem,0)

	/*
		Purpose : Create new step (child) in the steps tree 
		Parameters : The step name as string 
		Output : None
	*/

	func NewStep cStep
		cStepName = parent().prepareStepName(cStep)
		if nInteractionMode = C_INTERACTIONMODE_MODIFY {
			nStepID = SelectStep()
			if nStepID != -1 {
				EditStepName(cStepName,nStepID)
				return
			}
		}
		if nInteractionMode != C_INTERACTIONMODE_MODIFY {
			SaveRoot()
		}
		nStepNumber++
		AddStep(cStep,nIID,nStepNumber)

	/*
		Purpose : Use the goal designer to add new step 
		Parameters : Step Name, Step ID and the Step Number (Order)
		Output : None
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
		Purpose : Determine if the generated step will allows interaction or not
		Parameters : None
		Output : None
	*/

	func AllowInteraction
		lAllowInteraction = True

	/*
		Purpose : Select step in the Goal Designer
		Parameters : None
		Output : The Step ID
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
		Purpose : Edit step name 
		Parameters : The step name and the Step ID
		Output : None
	*/

	func EditStepName cStep,nStepID
		# Set the Step Color
			nStepType = parent().oModel.GetStepType(nStepID)
			parent().SetStepColor(nStepType)
		# Modify the step
			parent().oView.oStepsTree.editstep(oItem,cStep,parent().oModel.GetStepIgnoreStatus(nStepID))
			parent().oModel.EditStepName(nStepID,cStep)

	/*
		Purpose : Save reference to the Root node in the goal designer
		Parameters : None
		Output : None
	*/

	func SaveRoot
		# Save the root node
			if ISNULL(oParent) { 
				oParent = parent().oView.oStepsTree.currentItem() 
				GenerateIID()
				SaveVariablesValues()
			}

	/*
		Purpose : Generate Interaction ID
		Parameters : None
		Output : Output
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
		Purpose : Set Interaction Variables Values
		Parameters : None
		Output : None
	*/

	func SetVariablesValues
		oView.SetVariablesValues(cVariablesValues)

	/*
		Purpose : Set the Step Code
		Parameters : The Step Code as String
		Output : None
	*/

	func SetStepCode cCode
		nStepID = parent().oView.oStepsTree.GetIDByObj(oItem)
		parent().oModel.SaveStepCode(nStepID,cCode)

	/*
		Purpose : Get the Parent Step of the steps that will be generated 
		Parameters : None
		Output : None
	*/

	func GetParentStep 
		oItem = parent().oView.oStepsTree.currentItem()
		return oItem

	/*
		Purpose :  Get reference to the active step 
		Parameters : None
		Output : None
	*/

	func GetActiveStep 
		return oItem

	/*
		Purpose : Set the Active Step in the Goal Designer
		Parameters : Reference to the new active step
		Output : None
	*/

	func SetActiveStep oNewItem
		oItem = oNewItem
		parent().oView.oStepsTree.SetCurrentItem(oItem,0)

	/*
		Purpose : Key press action - support keyboard shortcuts
		Parameters : None
		Output : None
	*/

	func KeyPressAction
		//? "Key Code : " see oView.oWinFilter.getKeyCode()
		switch oView.oWinFilter.getKeyCode() {
			case Qt_Key_Escape 
				CloseBtnAction()		
			case 87				# CTRL+W
				OkAction()
			case 69				# CTRL+E (WebAssembly)
				OkAction()
			case 71 			# CTRL+G
				AgainAction()
		}

	/*
		Purpose : Get Variable Value from the Interaction Page
		Parameters : The Variable Name
		Output : None
	*/

	func Variable cVariable
		return oView.Variable(cVariable)

	/*
		Purpose : Check if we can start new interaction from the current step
		Parameters : None
		Output : True/False
	*/

	func CheckInteract
		if not Parent().AllowInteractButton() {
			//ShowMessage(T_GD_BM_SORRY,T_GD_BM_CANTINTERACT)
			//return false
		}
		return True


	/*
		Check Syntax before Ok/Again actions 
	*/

	func CheckSyntax
		return True

	func BeforeOkAction 
		return checkSyntax()

	func BeforeAgainAction
		return checkSyntax()

	func ContainsSyntaxError cCode 
		aRingCode = RingCode2PWCT(cCode)
		if len(aRingCode[:StepsTreeTable]) = 1 { 
			return True
		}
		return False

	/*
		Purpose : Execute the Ok button action
		Parameters : None
		Output : None
	*/


	func OkAction
		if not BeforeOkAction() { return }	
		parent().SetSaveFlag()
		parent().saveHistory()
		if lNoInteractionPage {
			oView.win.hide()
		}
		if CheckTimeProblem() { return } 
		if nInteractionMode = C_INTERACTIONMODE_MODIFY  or (CheckInteract()  and RulesAllow()) {
			if nInteractionMode != C_INTERACTIONMODE_MODIFY  {
				parent().TimeMachineGotoPresent()
			}
			if GenerateAction() { 
				# Delete extra steps after modify 
					if nInteractionMode = C_INTERACTIONMODE_MODIFY {
						parent().DeleteExtraSteps(nIID,nStepNumber)
					}
				parent().autoRun()
				CloseBtnAction()
			}
		else 
			if lNoInteractionPage {
				parent().autoRun()
				closebtnAction()
			}
		}

	/*
		Check time problem - Modify the future while we are in the past!
	*/
	func CheckTimeProblem
		if (nInteractionMode = C_INTERACTIONMODE_MODIFY) and not (nIID <= parent().TimeMachineActiveInteractionID() ) {
			if lDisplayTimeProblem {
				msginfo(T_GD_BM_SORRY,T_GD_BM_CANTMODIFYFUTURE)
			}
			return True
		}
		return False

	/*
		Purpose : Execute the Again button action
		Parameters : None
		Output : None
	*/

	func AgainAction	
		if not BeforeAgainAction() { return }	

		parent().SetSaveFlag()
		parent().saveHistory()
		if CheckTimeProblem() { return } 
		if CheckInteract() and RulesAllow() {
			noldInteractionMode = nInteractionMode
			nInteractionMode = C_INTERACTIONMODE_NEW	
			GenerateAction()
			parent().oView.oStepsTree.SetCurrentItem(oParent,0)
			oParent = NULL
			nInteractionMode = noldInteractionMode
			nStepNumber = 0
			parent().autoRun()
		}

	/*
		Purpose : Show the Interaction window and activate the first textbox
		Parameters : None
		Output : None
	*/

	func Start
		if PWCTIsMobile(:InteractionPage) {
			oView.win.showmaximized()
		else 
			Super.Start()
		}
		oView.win.activateWindow()
		setTheFocusToTheFirstTextBox()

	/*
		Purpose : Activate the first textbox in the interaction page 
		Parameters : None
		Output : None
	*/

	func setTheFocusToTheFirstTextBox
		if oView.lFirstTextBox = False {
			oView.oFirstText.SetFocus(0)
		}
		

	/*
		Purpose : Close Button Action
		Parameters : None
		Output : None
	*/

	func CloseBtnAction
		parent().oView.oStepsTree.setFocus(0)
		# To Correctly draw items (Avoid a Qt bug in drawing)
			parent().oView.FixDrawing()
		if nInteractionMode = C_INTERACTIONMODE_MODIFY  or nInsideGoalDesigner {
			parent().InteractionPageToModifyClosed()
		}
		Super.CloseAction()


	/*
		Purpose : Set Text color and backcolor 
		Parameters : Text as String 
		Output : Styled Text as String 
	*/
	func StyleData cText 
		return oStyle.text( htmlspecialchars(cText) , "C_STEPCOLOR_DATA_TEXT" ,"C_STEPCOLOR_DATA_BACKCOLOR") 

	/*
		HTML Special Character 
		Input : String contains Special Characters like < and >
		Output : String to be displayed in HTML pages
	*/
	func HTMLSpecialChars cStr
		return oHTMLFunctions.HTMLSpecialChars(cStr)

	/*
		Purpose : Generate Action (To be written in the component)
		Parameters : None
		Output : None
	*/

	func GenerateAction		

	/*
		Purpose : Check Rules
		Parameters : None
		Output : None
	*/

	func RulesAllow 
		return parent().rulesAllow(cComponent)

	/*
		Purpose : CheckAllowParent (To be written in the component)
		Parameters : Parent Component Name, Parent Step Number
		Output : None
	*/

	func CheckAllowParent cParentComponentName,nParentStepNumber
		return True

	func GetParentsList 
		return Parent().GetParentsList()

	/*
		Purpose : CheckAllowChild (To be written in the component)
		Parameters : Child Component Name, Parent Step Number
		Output : None
	*/

	func CheckAllowChild cChildComponentName,nParentStepNumber
		return True


	/*
		Check that the variable is not empty 
		Parameters : Variable Name 
		Output : True (If Empty) - False if not empty
	*/
	func NoValue cVariable
		if trim(Variable(cVariable)) = NULL {
			return True 
		}
		return False

	/*
		Check that the variable is not empty 
		Parameters : Variable Name 
		Output : True (If Empty) and Display Message Box - False if not empty
	*/
	func NoValueMsg cVariable 
		if 	NoValue(cVariable) {
			msginfo(T_CT_SORRY,T_CT_ENTERREQUIREDDATA)
			return True
		}
		return False 


	/*
		Check that each list item is not empty 
		Parameters : List Name 
		Output : True (If Empty) and Display Message Box - False if not empty
	*/
	func NoValueMsgList aList
		for cVariable in aList {
			if 	NoValue(cVariable) {
				msginfo(T_CT_SORRY,T_CT_ENTERREQUIREDDATA)
				return True
			}
		}
		return False 

	/*
		Prepare Interaction page variable value to be in Step as Data 		
	*/
	func StepData cValue
		return StyleData(Variable(cValue))

	/*
		Called After Selecting the component, Opening the window
	*/
	func AfterOpen


	/*
		Called After Selecting the component, Opening the window
		The same as AfterOpen but not for internal use 
	*/
	func InternalAfterOpen
		SupportAutoComplete()

	func SupportAutoComplete
		for aItem in oView.aVariables {
			if aItem[C_INTERACTION_VL_TYPE] = C_INTERACTION_CT_TEXTBOX {
				oTextbox = aItem[C_INTERACTION_VL_OBJECT]
				parent().oAutoComplete.supportControl(oTextbox)
			}
		}

	/*
		To call component (GenerateAction) from another component 
	*/
	func UseComponentFromComponent oObject 
		oObject 
		{
			oItem  			= this.oItem
			oParent 		= this.oParent		
			nIID			= this.nIID
			cComponent  		= this.cComponent		
			nInteractionMode	= this.nInteractionMode		
			cVariablesValues	= this.cVariablesValues		
			nStepNumber 		= this.nStepNumber		
			lAllowInteraction 	= this.lAllowInteraction		
			lNoInteractionPage 	= this.lNoInteractionPage		
			oStyle 			= this.oStyle
			oHTMLFunctions 		= this.oHTMLFunctions

			RingQt_nID		= this.RingQt_nID
			RingQt_nParentID	= this.RingQt_nParentID
		}

	func RunComponentFromComponent oCom
		UseComponentFromComponent(oCom)
		oCom.GenerateAction()
		nStepNumber = oCom.nStepNumber

#=========================================================================
#
#	Methods to be used by components for common generation 
#	of steps and code
#
#=========================================================================

	/*
		The next method for classes components 
		When we call object method 
	*/

	func common_callobjectmethod cFunc,cFuncName

		# Process the Method|Function Name 
			nPos = substr(cFuncName,"(")
			# Remove (parameters) from the name
				if nPos {	
					cFuncName = left(cFuncName,nPos-1)
				}
	
		# Set the Object Name if it was written
		# Object Name is optional because we can use braces { }

			if Variable(:Value) != NULL {
				cObjectNameForStepName = StepData(:Value) + "."
				cObjectNameForStepCode = Variable(:Value) + "."
			else 
				cObjectNameForStepName = ""
				cObjectNameForStepCode = ""
			}

		# Set the Output variable if it was written 

			if Variable(:Value4) != NULL {
				cOutputNameForStepName = StepData(:Value4) + " = "
				cOutputNameForStepCode = Variable(:Value4) + " = "
			else 
				cOutputNameForStepName = ""
				cOutputNameForStepCode = ""
			}

		NewStep( cOutputNameForStepName  +
				cObjectNameForStepName + 
				StyleData(cFuncName) +
				"(" + StepData(:Value3) + ")" )

		SetStepCode( cOutputNameForStepCode +
				cObjectNameForStepCode+
				cFunc+"("  + Variable(:Value3 ) + ")"  )
		

	/*
		Accept literal contains characters like ", ' and `
	*/
	func common_literal cText 
		if substr(cText,CHAR(34)) = 0 {
			cChar = Char(34)
		elseif substr(cText,"'") = 0 
			cChar = "'"
		elseif substr(cText,"`") = 0 
			cChar = "`"
		else 
			cChar = '"'
			cText = substr(cText,'"',`"+char(34)+"`)
		}
		return cChar + cText + cChar
