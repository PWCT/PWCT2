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
		Purpose : Add step
		Parameters :the Parent ID and the step content list
		Output : The new step ID
	*/

	func AddStep nParent,Content
		nID =  oStepsTreeModel.AddNode(nParent,Content)
		return nID

	/*
		Purpose :  Edit step name
		Parameters : The step ID and the new Step Name
		Output : None
	*/

	func EditStepName nStepID,cStepName
		oStepsTreeModel.GetNodeContent(nStepID)[:name] = cStepName

	/*
		Purpose :  Get Step Name
		Parameters : The Step ID
		Output : The Step Name
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
		Purpose :  Get the Step Code
		Parameters : The step ID
		Output : The step code
	*/

	func GetStepCode nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		return aContent[:code] 

	/*
		Purpose : Get Step Type
		Parameters : The Step ID as Number
		Output : The Step Type as Number
	*/

	func GetStepType nStepID
		aContent = oStepsTreeModel.GetNodeContent(nStepID)
		return aContent[:steptype] 

	/*
		Purpose : Print Steps to Console Window
		Parameters : None
		Output : None
	*/

	func PrintSteps
		for x in oStepsTreeModel.getdata() {
			puts( x[C_TREEMODEL_CONTENT][:name] +
				 " .. Active : " +
				x[C_TREEMODEL_CONTENT][:active])
		}

	/*
		Purpose : Get the Steps Tree Text
		Parameters : None
		Output : The steps Tree Text as String
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
		Purpose : Get the Steps Tree Code
		Parameters : None
		Output : Steps Tree Code as String
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
		Purpose : Delete Step
		Parameters : The Step ID as Number
		Output :  None
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
		Purpose : Delete Interaction record
		Parameters : the step ID
		Output : None
	*/

	func DeleteInteractionRecord nStepID
		# Get Interaction ID
			nIID = GetInteractionID(nStepID)
		# Delete the Interaction Record
			oInteractionModel.DeleteInteraction(nIID)
	
	/*
		Purpose : Get Interaction record ID
		Parameters : THE Step ID as Number
		Output : Interaction ID as Number
	*/

	func GetInteractionID nStepID
		# Get Content
			aContent = oStepsTreeModel.GetNodeContent(nStepID)
		# Get Interaction ID
			nIID = aContent[:interactionid]
		return nIID

	/*
		Purpose : Get the Interaction Component
		Parameters : The Interaction ID
		Output : Interaction component as string
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
		Purpose : Move Step Up
		Parameters : The step ID
		Output : None
	*/

	func MoveStepUp nStepID
		oStepsTreeModel.MoveNodeUp(nStepID)

	/*
		Purpose : Move Step Down
		Parameters : The Step ID
		Output : None
	*/

	func MoveStepDown nStepID
		oStepsTreeModel.MoveNodeDown(nStepID)

	/*
		Purpose : Cut Step
		Parameters : The Step ID
		Output : None
	*/

	func CutStep nStepID
		# Delete Interaction Records (The Time Machine keep them in a buffer for paste)
			DeleteInteractionsRecords(nStepID)
		oStepsTreeModel.CutNode(nStepID)

	/*
		Purpose : Copy Step
		Parameters : The Step ID
		Output : None
	*/

	func CopyStep nStepID
		oStepsTreeModel.CopyNode(nStepID)

	/*
		Purpose : Paste Step
		Parameters : The Parent Step ID
		Output : None
	*/

	func PasteStep nParentStepID
		UpdateInteractionIDs()
		oStepsTreeModel.PasteNode(nParentStepID)

	/*
		The next method update the Interaction IDs of the buffer (Used for Paste)
		We will keep a list of the updated IDs to be used when the steps
		Share the same interaction ID 
		Parameters : None		
		Output : None
		
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
		Purpose : Get the buffer list
		Parameters : None
		Output : The buffer list
	*/

	func GetBuffer
		return oStepsTreeModel.GetBuffer()

	/*
		The next function  ignore step (Enable/Disable step)
		Parameters : The Step ID
		Output : True/False (not Active Status)
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
		Parameters : The step ID and the step code
		Output : None
	*/
	func SaveStepCode nStepID,cCode
		oStepsTreeModel.GetNodeContent(nStepID)[:code]  = cCode

	/*
		The next method get steps in interaction range (min,max) value
		And set the visible attribute (True/False) using lVisible Parameter
		Parameters : Interaction ID Min , Interaction ID Maximum , Logical Visible
		Output : Sub Steps Tree List
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
		Purpose : Get Step ID By Interaction ID
		Parameters : The Interaction ID and the Step Number (Order)
		Output : The Step ID
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
		Purpose : Is Steps Tree Empty?
		Parameters : None
		Output : True/False 
	*/

	func IsEmpty
		if oStepsTreeModel.Count() <= 1 { # Start Point only
			return True
		}
		return False
