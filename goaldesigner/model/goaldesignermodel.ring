/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer Model Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerModel

	oStepsTreeModel = new TreeModel
	oInteractionModel = new InteractionModel

	# Add the first step
		AddStep(0,[:name = T_GD_FirstStep ,
			      :active = True , 
			      :code = "" , 
			      :interactionid = oInteractionModel.AddUserInteraction() ,
			      :visible = True ])

	func AddStep nParent,Content
		nID =  oStepsTreeModel.AddNode(nParent,Content)
		return nID

	func EditStepName nStepID,cStepName
		oStepsTreeModel.GetNodeContent(nStepID)[:name] = cStepName

	func GetStepName nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		return aContent[:name] 

	func GetStepIgnoreStatus nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		# The Ignore Status is the reverse of the Active Status
		return not aContent[:active] 

	func GetStepCode nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		return aContent[:code] 

	func PrintSteps
		for x in oStepsTreeModel.getdata() {
			puts( x[C_TREEMODEL_CONTENT][:name] +
				 " .. Active : " +
				x[C_TREEMODEL_CONTENT][:active])
		}

	func StepsTreeText
		cText = ""
		for x in oStepsTreeModel.getdata() {
			cText += x[C_TREEMODEL_CONTENT][:name] + nl
		}
		return cText

	func StepsTreeCode
		cText = ""
		for x in oStepsTreeModel.getdata() {
			cText += x[C_TREEMODEL_CONTENT][:code] + nl
		}
		return cText

	func DeleteStep nStepID
		# Delete Interaction Record
			DeleteInteractionRecord(nStepID)
		# Delete Interaction Records for Children
			aChildren = oStepsTreeModel.ChildrenIDs(nStepID)
			for x in aChildren {
				DeleteInteractionRecord(nStepID)
			}
		# Delete Node
			oStepsTreeModel.DeleteNode(nStepID)

	func DeleteInteractionRecord nStepID
		# Get Content
			aContent = oStepsTreeModel.GetNodeContent(nStepID)
		# Get Interaction ID
			nIID = aContent[:interactionid]
		# Delete the Interaction Record
			oInteractionModel.DeleteInteraction(nIID)
		

	func MoveStepUp nStepID
		oStepsTreeModel.MoveNodeUp(nStepID)

	func MoveStepDown nStepID
		oStepsTreeModel.MoveNodeDown(nStepID)

	func CutStep nStepID
		oStepsTreeModel.CutNode(nStepID)

	func CopyStep nStepID
		oStepsTreeModel.CopyNode(nStepID)

	func PasteStep nParentStepID
		UpdateInteractionIDs()
		oStepsTreeModel.PasteNode(nParentStepID)

	/*
		The next method update the Interaction IDs of the buffer (Used for Paste)
		We will keep a list of the updated IDs to be used when the steps
		Share the same interaction ID 
		
	*/
	func UpdateInteractionIDs 
		aUpdatedIDs  = []
		for x = 1 to len(oStepsTreeModel.aBuffer) {
			nID = oStepsTreeModel.aBuffer[x][C_TREEMODEL_CONTENT][:interactionid] 
			nPos = find(aUpdatedIDs,nID,1)
			if nPos = 0 {
				nNewID = oInteractionModel.NewInteractionIDAfterPaste(nID)
				oStepsTreeModel.aBuffer[x][C_TREEMODEL_CONTENT][:interactionid] = nNewID
				aUpdatedIDs + [nID,nNewID] 
			else
				nNewID = aUpdatedIDs[nPos][2]
				oStepsTreeModel.aBuffer[x][C_TREEMODEL_CONTENT][:interactionid] = nNewID
			}
		}


	func GetBuffer
		return oStepsTreeModel.GetBuffer()

	/*
		The next function  ignore step (Enable/Disable step)
	*/
	func IgnoreStep nStepID
		# The Active Status is the reverse of the Ignore Status
			nActive = not oStepsTreeModel.GetNodeContent(nStepID)[:active]
		# Set Ignore status for the parent step 
			oStepsTreeModel.GetNodeContent(nStepID)[:active]  = nActive
		# Set Ignore status for children steps
			aChildren = oStepsTreeModel.Children(nStepID)	
			for nIndex in aChildren {
				oStepsTreeModel.GetData()[nIndex][C_TREEMODEL_CONTENT][:active]  = nActive
			}
		return not nActive

	/*
		The next function save the step code
	*/
	func SaveStepCode nStepID,cCode
		oStepsTreeModel.GetNodeContent(nStepID)[:code]  = cCode

	/*
		The next method get steps in interaction range (min,max) value
		And set the visible attribute (True/False) using lVisible Parameter
	*/
	func GetStepsInTimeRange nIIDMin,nIIDMax,lVisible
		aList = oStepsTreeModel.GetData()
		for x = len(aList) to 1 step -1 {
			item = aList[x]
			nIID =  item[C_TREEMODEL_CONTENT][:interactionid]
			# x = 1 avoid start point
			if (nIID <= nIIDMin ) or (nIID > nIIDMax) or (x=1) {
				del(aList,x)
			else 
				oStepsTreeModel.aList[x][C_TREEMODEL_CONTENT][:visible] = lVisible
			}
		}
		return aList
