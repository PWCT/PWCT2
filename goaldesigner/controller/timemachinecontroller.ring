/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Time Machine Controller Class
**	Date : 2017.01.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TimeMachineController

	/*
		Purpose : Time Machine Goto Present
		Parameters : View Object and Model Object
		Output : None
	*/

	func TimeMachineGotoPresent oView,oModel
		if not oView.sliderTimeMachine.IsPresent() { 
			# Save Current Item
				oItem  = oView.oStepsTree.currentItem()
			# Go to the Present
			nActiveInteraction = oView.sliderTimeMachine.nActiveInteraction
			nInteractionsCount = oModel.oInteractionModel.InteractionsCount()
			oView.sliderTimeMachine.setInteractionPoints(nInteractionsCount)
			oView.sliderTimeMachine.nActiveInteraction = nActiveInteraction
			ChangeTimeMachinePoint(oView,oModel)
			# Restore Item
				oView.oStepsTree.SetCurrentItem(oItem,0)	
		}

	/*
		Purpose : Change Time Machine Point
		Parameters : View Object and Model Object
		Output : None
	*/

	func ChangeTimeMachinePoint oView,oModel
		nOldTMValue = oView.sliderTimeMachine.GetActiveInteraction()
		nTMValue = oView.sliderTimeMachine.value()
		// puts( " old value = " + nOldTMValue + " current value = " + nTMValue)
		if nOldTMValue = nTMValue {
			// puts("No Action")
			return
		}
		if nTMValue > nOldTMValue { 
			Direction = C_TMDIRECTION_FORWARD	# Add Steps
			lVisible = True
		else
			Direction = C_TMDIRECTION_BACKWARD	# Remove Steps
			lVisible = False
		}
		oView.sliderTimeMachine.SetActiveInteraction(nTMValue)
		# We uses + 1 to skip the start point
			nTMValue = oModel.oInteractionModel.GetInteractionID(nTMValue + 1)
			nOldTMValue = oModel.oInteractionModel.GetInteractionID(nOldTMValue + 1)
		nMinIID = min(nTMValue,nOldTMValue)
		nMaxIID = max(nTMValue,nOldTMValue)
		aList = oModel.GetStepsInTimeRange(nMinIID,nMaxIID,lVisible)		
		# Take in mind group of steps in the same interaction
			aList = Sort(aList,1)
			if direction = C_TMDIRECTION_BACKWARD {
				aList = Reverse(aList)
			}
		for x = 1 to len(aList) {
			item = aList[x]
			// puts( item[3][:name] )
			if direction = C_TMDIRECTION_BACKWARD {
				oItem = oView.oStepsTree.GetObjByID(item[1])
				oView.oStepsTree.DelByObj(oItem)
				oItem.parent().takechild(oItem.parent().indexofchild(oItem))
			else
				nStepID = item[C_TREEMODEL_NODEID]
				nParentID = item[C_TREEMODEL_PARENTID]
				cStepName = item[C_TREEMODEL_CONTENT][:name]
				nStepIID = item[C_TREEMODEL_CONTENT][:interactionid]
				nStepType = item[C_TREEMODEL_CONTENT][:steptype]
				oView.oStepsTree.SetStepColor(nStepType)
				lInsert = CheckInsertStep(oView,oModel,nParentID,nStepID,nStepIID)
				if lInsert= False { 
					oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
				else
					nIndex = lInsert--	# Start from 0 not 1
					oView.oStepsTree.InsertStep(nParentID,nStepID,cStepName,nIndex)
				}
			}
		}

		# To Correctly draw items (Avoid a Qt bug in drawing)
			oView.FixDrawing()


	/*
		The next method will
		Check if we will insert the step (before another step)
		Or we will add it (to the end) 
		This function is required and necessary when we have situation like
		Three  - Third interaction
		Two    - Second Interaction
		One	- First Interaction
		After we get the step One (First Interaction) we need to insert the
		Step Two Before it (Second Interaction)
		Parameters : View Object, Model Object, Parent Step ID, Step ID and Step Interaction ID
		Output : True/False
	*/
	func CheckInsertStep oView,oModel,nParentID,nStepID,nStepIID
		# Get the Next step after this step
			nPos = oModel.oStepsTreeModel.SiblingDown(nStepID)
		if nPos != 0 {
			nStepID2 = oModel.oStepsTreeModel.GetData()[nPos][C_TREEMODEL_NODEID]
			nStepIID2 = oModel.oStepsTreeModel.GetData()[nPos][C_TREEMODEL_CONTENT][:interactionid]
			if nStepIID2 < nStepIID  { # The next Step is visible  
					oItem = oView.oStepsTree.GetObjByID(nStepID2)
					nIndex = oItem.parent().indexofchild(oItem)
					nIndex++	 	# Start from 1 not 0
					return nIndex 	# True and the Item Index
			}
		}
		return False

	/*
		Get the Current Time Machine - Active Interaction ID
	*/	
	func ActiveInteractionID oView,oModel
		nTMValue = oView.sliderTimeMachine.value()
		nTMValue = oModel.oInteractionModel.GetInteractionID(nTMValue + 1)
		return nTMValue
		
