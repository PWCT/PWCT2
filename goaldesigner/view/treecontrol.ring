/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Tree Control Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TreeControl from qTreeWidget	

	aTree = []	# Node ID , Node Object , Node Object.pObject

	font  nFontSize = 12	# The font object and the font size

	lUseLabels = False	# Use QLabel for each Tree Item

	cColor = "green"		# Node Color
	cBackColor = ""		# Node Background Color

	func init win
		super.init(win)
		font = new qFont("",0,0,0)
		font.setpixelsize(nFontSize)
		return self

	func AddNode nParentID,nID,cText
		return InsertNode(nParentID,nID,cText,-1)

	func InsertNode nParentID,nID,cText,nIndex
		oParent = GetObjByID(nParentID)
		oItem = new qtreewidgetitem()
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
		setCurrentItem(oParent,0)	# Focus on Parent Step
		if lUseLabels = True {
			oLabel = new qLabel(self) {			
				settext(this.oStyle.image(C_LABELIMAGE_NODEICON)+
						this.oStyle.text(cText,this.cColor,this.cBackColor))
				setStyleSheet("font-size:" + this.nFontSize + "pt;")
			}
			setItemWidget(oItem,0,oLabel)
		}
		return oItem

	func GetObjByID id
		nPos = std_find2(aTree,id,C_TREECONTROL_ID)
		if nPos = 0 {
			std_raise("GetObjByID() - Can't find the object!")
		}
		return aTree[nPos][C_TREECONTROL_OBJECT]

	func GetIDByObj oObj
		nPos = std_find2(aTree,oObj.pObject,C_TREECONTROL_OBJECTPOINTER)
		if nPos = 0 {
			std_raise("GetIDByObj() - Can't find the ID!")
		}
		return aTree[nPos][C_TREECONTROL_ID]

	func DelByID id
		nPos = std_find2(aTree,id,C_TREECONTROL_ID)
		if nPos = 0 {
			std_raise("GetObjByID() - Can't find the object!")
		}
		del(aTree,nPos)

	func DelByObj oObj
		nPos = std_find2(aTree,oObj.pObject,C_TREECONTROL_OBJECTPOINTER)
		if nPos = 0 {
			std_raise("GetIDByObj() - Can't find the ID!")
		}
		del(aTree,nPos)

	func AddToTree nID,oObject
		aTree + [nID,oObject,oObject.pObject]

	/*
		The next method is used after Paste operation to update the Tree list
		With the new nodes data
	*/
	func AddNodesFromBuffer aNodesObjectsList,aNodesDataList
		for x = 1 to len(aNodesObjectsList) {
			AddToTree(aNodesDataList[x][C_TREEMODEL_NODEID],aNodesObjectsList[x])
		}

	func IncreaseFontSize
		if nFontSize >= 72 { return }
		nFontSize += 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

	func DecreaseFontSize
		if nFontSize <= 12 { return }
		nFontSize -= 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

	func SetCurrentItem oItem,nFlag
		cEvent = getCurrentItemChangedEvent()
		setCurrentItemChangedEvent("")
		super.SetCurrentItem(oItem,nFlag)
		setCurrentItemChangedEvent(cEvent)
