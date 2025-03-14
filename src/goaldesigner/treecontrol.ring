/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Tree Control Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TreeControl from qTreeWidget	

	aTree = []				# Node ID , Node Object , Node Object.pObject
	aTreeObjects = []		# QWidget (Parent),QWidget (Parent).pObject

	font  nFontSize = 12	# The font object and the font size

	lUseLabels = False		# Use TreeLabel for each Tree Item

	cColor = "green"		# Node Color
	cBackColor = ""			# Node Background Color

	cEventString

	oStyle = new HTMLStyles
	oHTML = new HTMLFunctions
	oTempFont = NULL

	lActivateParent = True  # Activate the parent step after creating the step


	/*
		The next method set the object attributes values		
		Parameters : The Parent Window as QWidget Object
		Output : The Object Reference (Self)
	*/

	func init win
		super.init(win)
		font = new qFont("arial",0,0,0)
		font.setpixelsize(nFontSize)
		//setUniformRowHeights(True)
		setAnimated(False)
		return self

	/*
		The next method Add new node to the Tree control	
		Parameters : The Parent Node ID, The Node ID, The Node Text
		Output : Reference to The Node Object (Type : QTreeWidgetItem)
	*/

	func AddNode nParentID,nID,cText
		return InsertNode(nParentID,nID,cText,-1)


	/*
		The next method Add a node and set the colors 		
		Parameters :  The Parent Node ID, The Node ID, The Node Text , Ignore Status
		Output : None
	*/

	func SerialAdd nParentID,nID,cText,lIgnore
		if lUseLabels = False {
			SerialAdd2(nParentID,nID,cText)
			return
		}
		oParent = GetObjByID(nParentID)
		cText = PrepareNodeText(cText)
		if lIgnore {
			cImage = C_LABELIMAGE_IGNORESTEP
		else
			cImage = C_LABELIMAGE_NODEICON
		}
		oItem = new qtreewidgetitem() 
		oLabel = createTreeLabel()
		oLabel.resize(100,30)
		SetLabelFont2(oLabel)
		oLabel.settext(NodeImage(cImage)+
					oStyle.text(cText,cColor,cBackColor))					
		NewLabelStyle(oLabel,[:id = nID])
		oParent.addchild(oItem)
		setItemWidget(oItem,0,oLabel)
		AddToTree(nID,oItem)
		oItem.setExpanded(true)

	/*
		This function add an icon to the step 
	*/

	func NodeImage cImage 
		if C_STEPSTREE_NODEICON {
			return oStyle.image(cImage)
		}

	/*
		In our steps tree each node is a TreeWidgetItem that contains a custom object
		This object could be any QWidget like QLabel (for example) 
		We use the next function to create this object for customization 
	*/

	func createTreeLabel
		aTreeObjects + [new TreeLabel(self),NULL]
		nSize = len(aTreeObjects)
		aTreeObjects[nSize][C_TREEOBJECT_OBJECTPOINTER] = aTreeObjects[nSize][C_TREEOBJECT_OBJECT].pObject
		return aTreeObjects[nSize][C_TREEOBJECT_OBJECT]

	/*
		The next method is the same as SerialAdd
		But doesn't create new TreeLabel object for each item 
		It uses the default item object.
	*/

	func SerialAdd2 nParentID,nID,cText
		cText = oHTML.RemoveTags(cText)
		cText = oHTML.HTMLSpecialChars2Text(cText)
		oItem = new qtreewidgetitem() {
			settext(0,cText)		
			this.GetObjByID(nParentID) { 
				addchild(oItem) 
			}
			setExpanded(true)
		}		
		AddToTree(nID,oItem)
		

	/*
		The next method Insert a node and create the Node Label 	
		Parameters :  The Parent Node ID, The Node ID, The Node Text , Index (insert Position)
		Output : Reference to The Node Object (Type : QTreeWidgetItem)
	*/

	func InsertNode nParentID,nID,cText,nIndex
		oParent = GetObjByID(nParentID)
		oItem = new qtreewidgetitem()
		cText = PrepareNodeText(cText)
		if lUseLabels = False {	
			oItem.settext(0,cText)
		}
		if nIndex = -1 {
			oParent.addchild(oItem)
		else
			oParent.InsertChild(nIndex,oItem)
		}
		AddToTree(nID,oItem)
		setCurrentItem(oItem,0)	# To Display the item (become visible)
		if lActivateParent {
			setCurrentItem(oParent,0)	# Focus on Parent Step
		}
		if lUseLabels = True {
			oLabel = createTreeLabel() {
				resize(100,30)
				# if we used setlabelfont2() here
				# when we cut steps and paste
				# we don't see the change in the font!			
				this.SetLabelFont(self)
				settext(this.NodeImage(C_LABELIMAGE_NODEICON)+
						this.oStyle.text(cText,this.cColor,this.cBackColor))
			}
			NewLabelStyle(oLabel,[:id = nID])
			setItemWidget(oItem,0,oLabel)
		}
		return oItem

	/*
		Function that can be used to customize the new labels added to the Tree items
	*/
	func NewLabelStyle oLabel,aPara

	/*
		Purpose : Can be replaced in child classes with custom processing on node text 
				Like replacing colors for example 
		Parameters : Node Text as String 
		Output : Node Text as String 
	*/
	func PrepareNodeText cText
		return cText 

	/*
		The next method set the font of the label of the Node Item
		Parameters :  Reference to The Node Object (Type : QTreeWidgetItem)
		Output : None
	*/

	func SetLabelFont oLabel
		# Using font().family() on Android lead to Crash!
		if PWCTIsMobile(:FontFamily) {
			oLabel.setStyleSheet("font-size:" + this.nFontSize + "pt;")
		else 
			cFontFam =  font().family() 				
			oLabel.setStyleSheet('font-family: "'+cFontFam+
				'" ; font-size:' + this.nFontSize + "pt;")
		}

	func SetLabelFont2 oLabel
		# Faster than SetLabelFont 
		cFontFam =  font().family() 				
		if not isObject(oTempFont) {
			oTempFont = new qfont(cFontFam,nFontSize,-1,0)
		else 
			oTempFont.setFamily(cFontFam)
			oTempFont.setPointsize(nFontSize)
		}
      		oLabel.setFont(oTempFont)

	func preparetempfont
		cFontFam =  font().family() 				
		if not isObject(oTempFont) {
			oTempFont = new qfont(cFontFam,nFontSize,-1,0)
		else 
			oTempFont.setFamily(cFontFam)
			oTempFont.setPointsize(nFontSize)
		}

	func SetLabelFont3 oLabel 
      		oLabel.setFont(oTempFont)


	/*
		The next method get the Tree Node Object using the Tree Node ID
		Parameters :  The Node ID
		Output : Reference to The Node Object (Type : QTreeWidgetItem)
	*/

	func GetObjByID id
		nPos = std_find2(aTree,id,C_TREECONTROL_ID)
		if nPos = 0 {
			std_raise("GetObjByID() - Can't find the object!")
		}
		return aTree[nPos][C_TREECONTROL_OBJECT]

	/*
		Check ID (if we have it or not)
	*/
	
	func CheckID id
		return std_find2(aTree,id,C_TREECONTROL_ID)


	/*
		The next method get the Tree Node ID using the Tree Node Object
		Parameters :  Reference to The Node Object (Type : QTreeWidgetItem)
		Output : The Node ID 
	*/

	func GetIDByObj oObj
		nPos = std_find2(aTree,oObj.pObject,C_TREECONTROL_OBJECTPOINTER)
		if nPos = 0 {
			std_raise("GetIDByObj() - Can't find the ID!")
		}
		return aTree[nPos][C_TREECONTROL_ID]

	/*
		Check Object 
	*/
	
	func CheckObj oObj 
		return std_find2(aTree,oObj.pObject,C_TREECONTROL_OBJECTPOINTER)

	/*
		The next method delete node using the Node ID
		Parameters :  The Node ID
		Output : None
	*/

	func DelByID id
		nPos = std_find2(aTree,id,C_TREECONTROL_ID)
		if nPos = 0 {
			std_raise("GetObjByID() - Can't find the object!")
		}
		del(aTree,nPos)

	/*
		The next method delete node using the Object ID 
		Parameters :  Reference to The Node Object (Type : QTreeWidgetItem)
		Output : None
	*/

	func DelByObj oObj
		nPos = std_find2(aTree,oObj.pObject,C_TREECONTROL_OBJECTPOINTER)
		if nPos = 0 {
			std_raise("GetIDByObj() - Can't find the ID!")
		}
		del(aTree,nPos)

	/*
		The next method Add new node to the Tree List of nodes and IDs
		Parameters :  Node ID , Reference to The Node Object (Type : QTreeWidgetItem)
		Output : None
	*/

	func AddToTree nID,oObject
		aTree + [nID,oObject,oObject.pObject]


	/*
		The next method is used after Paste operation to update the Tree list
		With the new nodes data
		Parameters :  The Nodes Objects List , The Nodes Data List (ParentID, NodeID, Content)
		Output : None
	*/

	func AddNodesFromBuffer aNodesObjectsList,aNodesDataList
		for x = 1 to len(aNodesObjectsList) {
			AddToTree(aNodesDataList[x][C_TREEMODEL_NODEID],aNodesObjectsList[x])
		}

	/*
		The next method increase the font size by 2 points
		Parameters :  None
		Output : None
	*/

	func IncreaseFontSize
		if nFontSize >= 72 { return }
		nFontSize += 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

	/*
		The next method decrease the font size by 2 points
		Parameters :  None
		Output : None
	*/

	func DecreaseFontSize
		if nFontSize <= 12 { return }
		nFontSize -= 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

	func PrepareFont
		font.setpixelsize(nFontSize)
		SetFont(font)

	/*
		The next method set the current item (Active Item) 
		It will disable the CurrentItemChangedEvent event during this change
		Parameters :  Reference to The Node Object (Type : QTreeWidgetItem) , The Flag
		Output : None
	*/

	func SetCurrentItem oItem,nFlag
		cEvent = getCurrentItemChangedEvent()
		setCurrentItemChangedEvent("")
		super.SetCurrentItem(oItem,nFlag)
		setCurrentItemChangedEvent(cEvent)

	/*
		The next method return the current item (Active Item) 
		Parameters :  None
		Output : Reference to The Node Object (Type : QTreeWidgetItem)
	*/

	func CurrentItem
		cEvent = getCurrentItemChangedEvent()
		setCurrentItemChangedEvent("")
		oItem = super.CurrentItem()
		setCurrentItemChangedEvent(cEvent)
		return oItem

	/*
		The next method disable the currentItemChangedEvent
		Parameters :  None
		Output : None
	*/

	func DisableEvents
		cEventString = getCurrentItemChangedEvent()
		setCurrentItemChangedEvent("")

	/*
		The next method enable the currentItemChangedEvent
		Parameters :  None
		Output : None
	*/

	func EnableEvents
		setCurrentItemChangedEvent(cEventString)

	/*
		The next method set the font Object
		We set a defined attributed in this class called (Font)
		We uses it for setting the nodes font through the Labels created for each item
		Parameters :  The font object (QFont)
		Output : None
	*/

	func SetFontObject oFont
		font = oFont

	/*
		The next method clear the lists
	*/

	func clearData

		aTree = []
		aTreeObjects = []
