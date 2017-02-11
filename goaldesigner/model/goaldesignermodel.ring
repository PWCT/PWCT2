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
			      :visible = True ,
			      :stepnumber = 1 ,
			      :steptype = C_STEPTYPE_COMMENT  ])

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func AddStep nParent,Content
		nID =  oStepsTreeModel.AddNode(nParent,Content)
		return nID

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func EditStepName nStepID,cStepName
		oStepsTreeModel.GetNodeContent(nStepID)[:name] = cStepName

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetStepName nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		return aContent[:name] 

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetStepIgnoreStatus nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		# The Ignore Status is the reverse of the Active Status
		return not aContent[:active] 

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetStepCode nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		return aContent[:code] 

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetStepType nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		return aContent[:steptype] 

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func PrintSteps
		for x in oStepsTreeModel.getdata() {
			puts( x[C_TREEMODEL_CONTENT][:name] +
				 " .. Active : " +
				x[C_TREEMODEL_CONTENT][:active])
		}

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func StepsTreeText
		cText = ""
		for x in oStepsTreeModel.getdata() {
			if x[C_TREEMODEL_CONTENT][:visible] {
				cText += x[C_TREEMODEL_CONTENT][:name] + nl
			}
		}
		return cText

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func StepsTreeCode
		cText = ""
		for x in oStepsTreeModel.getdata() {
			if x[C_TREEMODEL_CONTENT][:visible] {
				cText += x[C_TREEMODEL_CONTENT][:code] + nl
			}
		}
		return cText

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func DeleteStep nStepID
		# Delete Interaction Records
			DeleteInteractionsRecords(nStepID)
		# Delete Node
			oStepsTreeModel.DeleteNode(nStepID)

	/*
		The next method delete the interactions records for the step and children	
		Parameters : The Step ID
		Output : None
	*/
	func DeleteInteractionsRecords nStepID 
		# Delete Interaction Record
			DeleteInteractionRecord(nStepID)
		# Delete Interaction Records for Children
			aChildren = oStepsTreeModel.ChildrenIDs(nStepID)
			for x in aChildren {
				DeleteInteractionRecord(x)
			}

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func DeleteInteractionRecord nStepID
		# Get Interaction ID
			nIID = GetInteractionID(nStepID)
		# Delete the Interaction Record
			oInteractionModel.DeleteInteraction(nIID)
	
	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetInteractionID nStepID
		# Get Content
			aContent = oStepsTreeModel.GetNodeContent(nStepID)
		# Get Interaction ID
			nIID = aContent[:interactionid]
		return nIID

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetInteractionComponent nIID
		return oInteractionModel.GetInteractionComponent(nIID)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetInteractionVariablesValues nIID
		return oInteractionModel.GetInteractionVariablesValues(nIID)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func MoveStepUp nStepID
		oStepsTreeModel.MoveNodeUp(nStepID)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func MoveStepDown nStepID
		oStepsTreeModel.MoveNodeDown(nStepID)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func CutStep nStepID
		# Delete Interaction Records (The Time Machine keep them in a buffer for paste)
			DeleteInteractionsRecords(nStepID)
		oStepsTreeModel.CutNode(nStepID)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func CopyStep nStepID
		oStepsTreeModel.CopyNode(nStepID)

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

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


	/*
		Purpose : 
		Parameters :
		Output : 
	*/

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

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func GetStepIDbyIID nIID,nStepNumber
		aList = oStepsTreeModel.GetData()
		for x = len(aList) to 1 step -1 {
			item = aList[x]
			if  item[C_TREEMODEL_CONTENT][:interactionid] = nIID and
  			    item[C_TREEMODEL_CONTENT][:stepNumber] = nStepNumber {
				return item[C_TREEMODEL_NODEID]
			}
		}

	/*
		Purpose : 
		Parameters :
		Output : 
	*/

	func IsEmpty
		if oStepsTreeModel.Count() <= 1 { # Start Point only
			return True
		}
		return False
