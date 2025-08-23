#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  Time Machine Controller Class
#**	Date : 2017.01.04
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class TimeMachineController
	#/*
	#		Flag to use the Fast way to implement the Time Machine
	#		instead of Adding/removing steps when we change the time point
	#		We just Show/Hide the steps based on needs
	#	*/
	lUseSetHidden = True
	#/*
	#		Flag to control adding information about Time Machine performance to the Log
	#	*/
	lPerformanceLog = False
	#/*
	#		Purpose : Time Machine Goto Present
	#		Parameters : View Object and Model Object
	#		Output : None
	#	*/
	func TimeMachineGotoPresent oView,oModel { 
		if  NOT oView.sliderTimeMachine.IsPresent() { 
			#Save Current Item
			#Go to the Present
			oItem = oView.oStepsTree.currentItem()
			nActiveInteraction = oView.sliderTimeMachine.nActiveInteraction
			nInteractionsCount = oModel.oInteractionModel.InteractionsCount()
			oView.sliderTimeMachine.setInteractionPoints(nInteractionsCount)
			oView.sliderTimeMachine.nActiveInteraction = nActiveInteraction
			ChangeTimeMachinePoint(oView,oModel)
			#Restore Item
			oView.oStepsTree.SetCurrentItem(oItem,0)
		} 
		#/*
		#		Purpose : Change Time Machine Point
		#		Parameters : View Object and Model Object
		#		Output : None
		#	*/
	} 
	func ChangeTimeMachinePoint oView,oModel { 
		if lPerformanceLog { 
			nTimeMachineChangeStart = clock()
			oSystemLog.addMessage("Start using Time Machine to change position")
		} 
		nOldTMValue = oView.sliderTimeMachine.GetActiveInteraction()
		#Check that we have change in the Time
		nTMValue = oView.sliderTimeMachine.value()
		if nOldTMValue = nTMValue { 
			return 
		} 
		#Determine the change direction (Forward|Backward)
		if nTMValue > nOldTMValue { 
			Direction = C_TMDIRECTION_FORWARD
			#Add Steps
			lVisible = True
			else
				Direction = C_TMDIRECTION_BACKWARD
				#Remove Steps
				lVisible = False
		} 
		oView.sliderTimeMachine.SetActiveInteraction(nTMValue)
		#We uses + 1 to skip the start point
		nTMValue = oModel.oInteractionModel.GetInteractionID(nTMValue+1)
		nOldTMValue = oModel.oInteractionModel.GetInteractionID(nOldTMValue+1)
		nMinIID = min(nTMValue,nOldTMValue)
		nMaxIID = max(nTMValue,nOldTMValue)
		aList = oModel.GetStepsInTimeRange(nMinIID,nMaxIID,lVisible)
		#Take in mind group of steps in the same interaction
		aList = Sort(aList,1)
		if direction = C_TMDIRECTION_BACKWARD { 
			aList = Reverse(aList)
		} 
		oView.oStepsTree.lactivateParent = False
		for x = 1 to len(aList) step 1 { 
			item = aList[x]
			if direction = C_TMDIRECTION_BACKWARD { 
				oItem = oView.oStepsTree.GetObjByID(item[C_TREEMODEL_NODEID])
				if lUseSetHidden { 
					oItem.setHidden(True)
					oItem = oView.oStepsTree.GetObjByID(item[C_TREEMODEL_PARENTID])
					if x = len(aList) { 
						oView.oStepsTree.SetCurrentItem(oItem,0)
					} 
					else
						oView.oStepsTree.DelByObj(oItem)
						oItem.parent().takechild(oItem.parent().indexofchild(oItem))
				} 
				else
					nStepID = item[C_TREEMODEL_NODEID]
					nParentID = item[C_TREEMODEL_PARENTID]
					if lUseSetHidden { 
						oItem = oView.oStepsTree.GetObjByID(nParentID)
						oItem.setHidden(False)
						oItem = oView.oStepsTree.GetObjByID(nStepID)
						oItem.setHidden(False)
						if x = len(aList) { 
							oView.oStepsTree.SetCurrentItem(oItem,0)
						} 
						else
							cStepName = item[C_TREEMODEL_CONTENT][:name]
							cPlainStepName = item[C_TREEMODEL_CONTENT][:plainname]
							nStepIID = item[C_TREEMODEL_CONTENT][:interactionid]
							nStepType = item[C_TREEMODEL_CONTENT][:steptype]
							oView.oStepsTree.SetStepColor(nStepType)
							lInsert = CheckInsertStep(oView,oModel,nParentID,nStepID,nStepIID)
							if  NOT oView.oStepsTree.luseLabels { 
								cStepName = cPlainStepName
							} 
							if lInsert = False { 
								oView.oStepsTree.AddStep(nParentID,nStepID,cStepName)
								else
									nIndex = lInsert--
									#Start from 0 not 1
									oView.oStepsTree.InsertStep(nParentID,nStepID,cStepName,nIndex)
							} 
					} 
			} 
		} 
		oView.oStepsTree.lactivateParent = True
		#To Correctly draw items (Avoid a Qt bug in drawing)
		oView.FixDrawing()
		if lPerformanceLog { 
			oSystemLog.addMessage("End of using Time Machine to change position")
			oSystemLog.addMessage("Position Change Time (Clocks)  : "+(clock()-nTimeMachineChangeStart))
			oSystemLog.addMessage("Position Change Time (Seconds) : "+((clock()-nTimeMachineChangeStart))/clockspersecond())
		} 
		#/*
		#		The next method will
		#		Check if we will insert the step (before another step)
		#		Or we will add it (to the end)
		#		This function is required and necessary when we have situation like
		#		Three  - Third interaction
		#		Two    - Second Interaction
		#		One	- First Interaction
		#		After we get the step One (First Interaction) we need to insert the
		#		Step Two Before it (Second Interaction)
		#		Parameters : View Object, Model Object, Parent Step ID, Step ID and Step Interaction ID
		#		Output : True/False
		#	*/
		#/*
		#		The next method uses a while loop (While True)
		#		And check what after unvisible steps
		#		To avoid the next problem
		#		Create four steps ( one - two - three - four )
		#		move the step (four) to be before (one) so we have
		#		four
		#		one
		#		two
		#		three
		#		Until now no problem in the time machine
		#		Now create another four steps (Print one - print two - print three - print four)
		#		move (print four) to be up so we have
		#		four
		#		print four
		#		one
		#		two
		#		three
		#		print one
		#		print two
		#		print three
		#		now go back using the time machine then go forward
		#		we have
		#		print four
		#		one
		#		two
		#		three
		#		four 	-------> wrong place !!!
		#		print one
		#		print two
		#		print three
		#		So the While loop solve the problem
		#		when we are at (four) the next step will be (print four)
		#		So the while loop will pass this step to the next one
		#	*/
	} 
	func CheckInsertStep oView,oModel,nParentID,nStepID,nStepIID { 
		while True { 
			#We will repeat the process until we find a visible step after this step
			#Get the Next step after this step
			nPos = oModel.oStepsTreeModel.SiblingDown(nStepID)
			if nPos != 0 { 
				nStepID2 = oModel.oStepsTreeModel.GetData()[nPos][C_TREEMODEL_NODEID]
				nStepIID2 = oModel.oStepsTreeModel.GetData()[nPos][C_TREEMODEL_CONTENT][:interactionid]
				if nStepIID2 < nStepIID { 
					#The next Step is visible
					oItem = oView.oStepsTree.GetObjByID(nStepID2)
					nIndex = oItem.parent().indexofchild(oItem)
					nIndex++
					#Start from 1 not 0
					return nIndex
					#True and the Item Index
					else
						#The step is not visible - we need what after it
						#Use the unvisible step as the current step
						nStepID = nStepID2
				} 
				else
					exit 1
					#No more unvisible steps to repeat the loop
			} 
		} 
		return False
		#/*
		#		Get the Current Time Machine - Active Interaction ID
		#	*/
	} 
	func ActiveInteractionID oView,oModel { 
		nTMValue = oView.sliderTimeMachine.value()
		nTMValue = oModel.oInteractionModel.GetInteractionID(nTMValue+1)
		return nTMValue
	} 
private
