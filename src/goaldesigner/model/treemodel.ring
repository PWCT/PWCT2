/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Tree Model Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TreeModel

	/*
		We manage the Tree data as a Table
		The Table contains the next columns
		nNodeID - nParentID - Content
	*/

	aList = []		# Tree Content [nNodeID - nParentID - Content]
	nID = 0		# Automatic ID for each node

	aBuffer = []		# List used for Cut, Copy & Paste operations

	/*
		The next method return the Count of Nodes
		Parameters : None
		Output : The Nodes Count As Number
	*/
	func Count
		return len(aList)

	/*
		The next method return the ID
		Parameters : None
		Output : The ID of the Last Node
	*/
	func GetID
		return nID

	/*
		The next method set the ID of the Last Node
		Parameters : The ID Value as Number
		Output : None
	*/
	func SetID nIDValue
		nID = nIDValue

	/*
		The next method add new nodes to the tree
		The method check where to inset new nodes
		We have tree in the correct order (Top-Down)
		Parameters : Parent ID , Content List
		Output : The new node ID
	*/
	func AddNode  nParent,Content
		nID++	# Increase the Automatic ID by 1
		nPos = FindNewNodePosition(nParent)
		insert(aList,nPos, [nID, nParent, Content])
		return nID	# Return the Node ID

	func AddNodeAfterNode  nParent,Content,nParent2
		nID++	# Increase the Automatic ID by 1
		nPos = FindNewNodePosition(nParent2)
		insert(aList,nPos, [nID, nParent, Content])
		return nID	# Return the Node ID


	/*
		The next method get the position of the new node
		We use the insert() function later to add new nodes
		The goal is to keep the tree in the correct order
		So we don't need to order the tree when we generate the code
		Parameters : Parent ID
		Output : the Position as Number
	*/
	func FindNewNodePosition nParent
		# Check Adding after the last record (Special Case) - for better performance 
			if len(aList) > 0
				if aList[len(aList)][C_TREEMODEL_PARENTID] = nParent or 
					aList[len(aList)][C_TREEMODEL_NODEID] = nParent
					return len(aList)
				ok 
			ok
		for x = 1 to len(aList) {
			if aList[x][C_TREEMODEL_NODEID] = nParent {
				aParentList = [nParent]
				for x2 = x+1 to len(aList) {
					if find(aParentList,aList[x2][C_TREEMODEL_PARENTID]) = 0 {
						return x2-1
					else
						aParentList + aList[x2][C_TREEMODEL_NODEID]
					}
				}
			}
		}
		return len(aList)

	/*
		The next method edit the node content in the tree
		Parameters : The Node ID and the Content List
		Output : None
	*/
	func SetNodeContent nNodeID,Content
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)
		aList[nPos][C_TREEMODEL_CONTENT] = Content

	/*
		The next method get the node content from the tree
		Parameters : The Node ID
		Output : The Content List
	*/
	func GetNodeContent nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)
		return aList[nPos][C_TREEMODEL_CONTENT]

	/*
		The next method get the node parent from the tree
		Parameters : The Node ID
		Output : The Parent ID
	*/
	func GetNodeParent nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)
		return aList[nPos][C_TREEMODEL_PARENTID]


	/*
		The next method return the tree list
		Parameters : None
		Output : The Nodes List
	*/
	func GetData
		return aList

	/*
		The next method set the tree list
		Parameters : The Tree Nodes List
		Output : None
	*/
	func SetData aData
		aList = aData

	/*
		The next method return a list of the node children
		The list contains each node index
		Parameters : The Node ID
		Output : Children List
	*/
	func Children nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)
		nSize = len(aList)
		aChildren = []
		aParents = []
		aParents + nNodeID
		for x = nPos + 1 to nSize {
			if find(aParents,aList[x][C_TREEMODEL_PARENTID]) {
				aChildren + x
				aParents + aList[x][C_TREEMODEL_NODEID]
			}
		}
		return aChildren

	/*
		The next method return a list of the node children
		The list contains each node ID
		Parameters : Node ID
		Output : Children IDs List
	*/
	func ChildrenIDs nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)
		nSize = len(aList)
		aChildren = []
		aParents = []
		aParents + nNodeID
		for x = nPos + 1 to nSize {
			if find(aParents,aList[x][C_TREEMODEL_PARENTID]) {
				aChildren + aList[x][C_TREEMODEL_NODEID]
				aParents + aList[x][C_TREEMODEL_NODEID]
			}
		}
		return aChildren

	/*
		The next method return the index of a node with respect to the parent
		Parameters : Parent ID , Node ID
		Output : Node Index with respect to the Parent
		
	*/
	func ChildIndex nParentID,nNodeID
		aChildList = ChildrenIDs(nParentID)
		return Find(aChildList,nNodeID)


	/*
		Remove children from the Tree
		The input is a list of each node index
		Parameters : Nodes Positions List
		Output : None
	*/
	func DeleteChildren aChildren
		# We remove from bottom to up to keep the node index valid during deletion
		for x = len(aChildren) to 1 step -1  {
			del(aList,aChildren[x])
		}
	
	/*
		The next method get a list of the Children data
		Parameters : Children list of indexes 
		Output : Children list of data
	*/
	func GetChildren aChildren
		aOutput = []
		for x in aChildren {
			aOutput + aList[x]
		}
		return aOutput

	/*
		Remove node and it's children
		Parameters : The Node ID
		Output : None
	*/
	func DeleteNode nNodeID
		# Delete Children
		DeleteChildren(Children(nNodeID)) 		
		# Delete the node itself
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)		
		del(aList,nPos)

	/*
		The next method find the sibling node (UP)
		Parameters : The Node ID
		Output : The Position of the sibling node (up)
	*/
	func SiblingUp nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)		
		nParentID = aList[nPos][C_TREEMODEL_PARENTID]
		# Find the sibling node (Up)
		nPos2 = 0
		for x=nPos-1 to 1 step -1 {
			if aList[x][C_TREEMODEL_PARENTID] = nParentID {
				nPos2 = x
				exit 
			}
		}
		return nPos2

	/*
		The next method find the sibling node (Down)
		Parameters : The Node ID
		Output : The position of the sibling node (Down)
	*/
	func SiblingDown nNodeID
		nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)		
		nParentID = aList[nPos][C_TREEMODEL_PARENTID]
		# Find the sibiling node (Down)
		nPos2 = 0
		for x=nPos+1 to len(aList) {
			if aList[x][C_TREEMODEL_PARENTID] = nParentID {
				nPos2 = x
				exit 
			}
		}
		return nPos2

	/*
		The next method move a node up
		Parameters : The Node ID
		Output : None
	*/
	func MoveNodeUp nNodeID
		# Find the sibling node (Up)
			nPos = SiblingUp(nNodeID)
		# Check if we don't have nodes Up
			if nPos = 0 { return }
		# Get Children List
			aMove = GetChildren(Children(aList[nPos][C_TREEMODEL_NODEID]))
		# Add the Parent Node
			Insert(aMove,0,aList[nPos])
		# Delete The Node
			DeleteNode(aList[nPos][C_TREEMODEL_NODEID])
		# Get the Last Item in the Node children that we move up
			aChildren = children(nNodeID)
			if len(aChildren) > 0 {
				nPos2 = aChildren[Len(aChildren)]
			else 
				nPos2 = find(aList,nNodeID,C_TREEMODEL_NODEID)		
			}
		# Insert Items after the last item in the node children 
			for x = len(aMove) to 1 step -1 {
				Insert(aList,nPos2,aMove[x])
			}

	
	/*
		The next method move the Node down
		Parameters : NodeID
		Output : None
	*/
	func MoveNodeDown nNodeID
		# Find the sibiling node (Down)
			nPos = SiblingDown(nNodeID)
		# Move The Sibling node (Up)
			MoveNodeUp(aList[nPos][C_TREEMODEL_NODEID])

	/*
		The next method Cut the Node
		Parameters : The Node ID
		Output : None
	*/
	func CutNode nNodeID
		# Copy the Node Data
			nPos = CopyNode(nNodeID)
		# Delete The Node
			DeleteNode(aList[nPos][C_TREEMODEL_NODEID])

	/*
		The next method Copy the Node
		Parameters : The Node ID
		Output : The Node Position
	*/
	func CopyNode nNodeID
		# Get the Node position
			nPos = find(aList,nNodeID,C_TREEMODEL_NODEID)		
		# Get Children List
			aBuffer = GetChildren(Children(aList[nPos][C_TREEMODEL_NODEID]))
		# Add the Parent Node
			Insert(aBuffer,0,aList[nPos])
		return nPos

	/*
		The next method Paste the Node
		We have the nodes in the aBuffer List 
		When we paste, We must
			1 - Change the parent ID of the first node to the input of PasteNode method
			2 - Change the ID of each node to be a new and unique ID
		Parameters : The Parent Node ID
		Output : None
	*/
	func PasteNode nParentNodeID
		nID++
		# Get the nodes Count in the Buffer
			nMax = len(aBuffer)
		# Map between the NodeID in the buffer and the new NodeID 
			aIDsMap = []
		# Update Each Node ID
		for x=1 to len(aBuffer) { 	
			aIDsMap + [aBuffer[x][C_TREEMODEL_NODEID],nID]		
			aBuffer[x][C_TREEMODEL_NODEID] = nID
			nID++
			nPos = find(aIDsMap,aBuffer[x][C_TREEMODEL_PARENTID],1)
			if nPos > 0 {
				aBuffer[x][C_TREEMODEL_PARENTID] = aIDsMap[nPos][2]
			}
		}
		# Update the first node parent ID		
			aBuffer[1][C_TREEMODEL_PARENTID] = nParentNodeID
		# Copy the nodes
			aChildren = Children(nParentNodeID)
			if len(aChildren) > 0 {
				nPos = aChildren[len(aChildren)]
			else
				nPos = find(aList,nParentNodeID,C_TREEMODEL_NODEID)
			}
			for x = len(aBuffer) to 1 step -1 {
				node = aBuffer[x] 
				Insert(aList,nPos,node)
			}

	/*
		The next method return the tree list in the buffer that are used for Cut,Copy and Paste
		Parameters : None
		Output : The Buffer List
	*/
	func GetBuffer
		return aBuffer

	/*
		The next method set the buffer list
		Parameters : The Buffer List
		Output : None
	*/
	func SetBuffer aNewBuffer
		aBuffer = aNewBuffer
		
