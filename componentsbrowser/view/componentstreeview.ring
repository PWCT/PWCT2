/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Components Tree View Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentsTreeView from StepsTreeView

	lDefaultTree = True		# True = Don't create qLabel for each item

	cControlHeader = T_CB_COMPONENTSTREE 
	cStartPointText = T_CB_RINGPWCT

	# We create the Init Method to avoid adding the root two times
	# As a result of nested call to AddStartPoint()

	/*
		Purpose : init. the object
		Parameters : None
		Output : reference to the object (Self)
	*/

	func Init win
		if lDefaultTree {
			super.init2(win)
			TreeStyle()
		else
			super.init(win)
		}
		return self

	func TreeStyle
		setStyleSheet(
			'QTreeWidget { color: green; font-size: '+nFontSize+'pt  } '+
			'QTreeWidget::branch:open { image: url("' + C_LABELIMAGE_NODEICON + '") }' +
			'QTreeWidget::!active { selection-background-color:rgba(0,65,255,255) ; selection-color:white; } ; ' +
			'QTreeWidget::branch:closed:has-children { image: url("' + C_LABELIMAGE_NODEICON + '") }'
			 )

	func AddNode nParentID,nStepID,cStepName
		if lDefaultTree {
			SerialAdd2(nParentID,nStepID,cStepName)								
		else
			oItem = super.AddNode(nParentID,nStepID,cStepName)								
			scrolltoitem(oItem,0)
		}

	
