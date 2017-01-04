/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Time Machine Controller Class
**	Date : 2017.01.04
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TimeMachineController

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
		# Take in mind groupd of steps in the same interaction
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
				nStepID = item[1]
				nParentID = item[2]
				cStepName = item[3][:name]
				oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
			}
		}
