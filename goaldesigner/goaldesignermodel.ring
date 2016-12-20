/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Goal Designer Model Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class GoalDesignerModel

	oStepsTreeModel = new TreeModel

	# Add the first step
	AddStep(0,[:name = T_GD_FirstStep ,
		      :active = True , 
		      :code = "" , 
		      :date = date() ,
		      :time = time()])

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
		oStepsTreeModel.DeleteNode(nStepID)

	func MoveStepUp nStepID
		oStepsTreeModel.MoveNodeUp(nStepID)

	func MoveStepDown nStepID
		oStepsTreeModel.MoveNodeDown(nStepID)

	func CutStep nStepID
		oStepsTreeModel.CutNode(nStepID)

	func CopyStep nStepID
		oStepsTreeModel.CopyNode(nStepID)

	func PasteStep nParentStepID
		oStepsTreeModel.PasteNode(nParentStepID)

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

