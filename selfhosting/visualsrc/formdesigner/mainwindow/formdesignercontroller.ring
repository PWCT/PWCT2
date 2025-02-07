#/*
#**	Project : Form Designer
#**	File Purpose :  Form Designer Controller
#**	Date : 2017.04.29
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
package formdesigner
class FormDesignerController from WindowsControllerParent
	oView = new FormDesignerView
	oModel = new FormDesignerModel
	oGeneral = new FormDesignerGeneral
	oFile = new FormDesignerFileSystem
	func Start  { 
		oView.SetParentObject(self)
		oView.CreateMainWindow(oModel)
		AddObjectsToCombo()
		AddObjectProperties()
		DisplayObjectProperties()
		oView.WindowMoveResizeEvents()
	} 
	func ObjectProperties  { 
		AddObjectProperties()
		DisplayObjectProperties()
	} 
	func AddObjectsToCombo  { 
		oView.oObjectsCombo.blocksignals(True)
		oView.oObjectsCombo.Clear()
		aObjects = oModel.GetObjects()
		for item in aObjects step 1 { 
			oView.oObjectsCombo.AddItem(item[1],0)
		} 
		oView.oObjectsCombo.setcurrentindex(len(aObjects)-1)
		oView.oObjectsCombo.blocksignals(False)
	} 
	func AddObjectProperties  { 
		oView.oPropertiesTable {
			#Remove Rows
			clear()
			this.oView.PreparePropertiesTable(self)
		}
		oModel.ActiveObject().AddObjectProperties(self)
	} 
	func DisplayObjectProperties  { 
		oModel.ActiveObject().DisplayProperties(self)
	} 
	func ToolBtnChangeAction  { 
		if oView.oToolBtn1.isChecked() { 
			#Select Mode
			oModel.FormObject().setCursor(
				new qCursor() {
					setShape(Qt_ArrowCursor)
				}
			)
			EnableMouseEventsForControls()
			else
				oModel.FormObject().setCursor(
					new qCursor() {
						setShape(Qt_CrossCursor)
					}
				)
				DisableMouseEventsForControls()
		} 
	} 
	func DisableMouseEventsForControls  { 
		aObjects = oModel.GetObjects()
		for x = 2 to len(aObjects) step 1 { 
			aObjects[x][2].setAttribute(Qt_WA_TransparentForMouseEvents,True)
		} 
	} 
	func EnableMouseEventsForControls  { 
		aObjects = oModel.GetObjects()
		for x = 2 to len(aObjects) step 1 { 
			aObjects[x][2].setAttribute(Qt_WA_TransparentForMouseEvents,False)
		} 
	} 
	func SetToolboxModeToSelectAfterDraw  { 
		if  NOT oView.oToolLock.isChecked() { 
			SetToolboxModeToSelect()
			else
				#To include the latest created control
				DisableMouseEventsForControls()
		} 
	} 
	func SetToolboxModeToSelect  { 
		oView.oToolBtn1.setChecked(2)
		ToolBtnChangeAction()
	} 
	func UpdateProperties  { 
		SetToolboxModeToSelect()
		nRow = oView.oPropertiesTable.Currentrow()
		nCol = oView.oPropertiesTable.Currentcolumn()
		cValue = oView.oPropertiesTable.item(nRow,nCol).text()
		oModel.ActiveObject().UpdateProperties(self,nRow,nCol,cValue)
	} 
	func ResizeWindowAction  { 
		oView.oLabelSelect.Hide()
		SetToolboxModeToSelect()
		DisplayFormProperties()
		oView.oFilter.seteventoutput(False)
	} 
	func MoveWindowAction  { 
		oView.oLabelSelect.Hide()
		SetToolboxModeToSelect()
		DisplayFormProperties()
	} 
	func DisplayFormProperties  { 
		if oModel.IsFormActive() { 
			oModel.FormObject().DisplayProperties(self)
		} 
	} 
	func MousePressAction  { 
		oModel.FormObject().MousePressAction(self)
		if oView.oToolBtn1.ischecked() { 
			#Select Mode
			#Activate the Window Object
			oModel.RemoveCurrentParentCache()
			ChangeObjectByCode(0)
		} 
		oView.oFilter.seteventoutput(False)
	} 
	func MouseReleaseAction  { 
		oModel.FormObject().MouseReleaseAction(self)
		oView.oFilter.seteventoutput(False)
	} 
	func MouseMoveAction  { 
		oModel.FormObject().MouseMoveAction(self)
		oView.oFilter.seteventoutput(False)
	} 
	func DialogButtonAction nRow { 
		SetToolboxModeToSelect()
		oModel.ActiveObject().DialogButtonAction(self,nRow)
	} 
	func ComboItemAction nRow { 
		SetToolboxModeToSelect()
		oModel.ActiveObject().ComboItemAction(self,nRow)
	} 
	func ShowPropertiesWidget  { 
		if oModel.IsManySelected() { 
			nWidth = oView.oPropertiesDock.width()
			oView.oPropertiesDock.setWidget(oView.oProperties2)
			oView.oPropertiesDock.setminimumwidth(nWidth)
			else
				oView.oPropertiesDock.setminimumwidth(10)
				oView.oPropertiesDock.setWidget(oView.oProperties)
		} 
	} 
	func SelectDrawAction aRect { 
		if oView.oToolBtn1.ischecked() { 
			#Select
			oModel.ClearSelectedObjects()
			SelectObjects(aRect)
			ShowPropertiesWidget()
			#Create Label
			elseif oView.oToolBtn2.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddLabel(
					new FormDesigner_QLabel(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setMouseTracking(True)
						setFocusPolicy(0)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Label",oModel.LabelsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QPushButton
			elseif oView.oToolBtn3.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddPushButton(
					new FormDesigner_QPushButton(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setMouseTracking(True)
						setFocusPolicy(0)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Button",oModel.PushButtonsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QLineEdit
			elseif oView.oToolBtn4.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddLineEdit(
					new FormDesigner_QLineEdit(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("LineEdit",oModel.LineEditsCount())
				oModel.ActiveObject().updatestylesheets()
				SetToolboxModeToSelectAfterDraw()
			#Create QTextEdit
			elseif oView.oToolBtn5.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddTextEdit(
					new FormDesigner_QTextEdit(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("TextEdit",oModel.TextEditsCount())
				oModel.ActiveObject().updatestylesheets()
				SetToolboxModeToSelectAfterDraw()
			#Create QListWidget
			elseif oView.oToolBtn6.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddListWidget(
					new FormDesigner_QListWidget(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("ListWidget",oModel.ListWidgetsCount())
				oModel.ActiveObject().updatestylesheets()
				SetToolboxModeToSelectAfterDraw()
			#Create QCheckBox
			elseif oView.oToolBtn7.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddCheckBox(
					new FormDesigner_QCheckBox(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("CheckBox",oModel.CheckBoxesCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QImage
			elseif oView.oToolBtn8.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddImage(
					new FormDesigner_QImage(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Image",oModel.ImagesCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QSlider
			elseif oView.oToolBtn9.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddSlider(
					new FormDesigner_QSlider(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Slider",oModel.SlidersCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QProgressBar
			elseif oView.oToolBtn10.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddProgressbar(
					new FormDesigner_QProgressbar(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Progressbar",oModel.ProgressbarsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QSpinBox
			elseif oView.oToolBtn11.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddSpinBox(
					new FormDesigner_QSpinBox(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("SpinBox",oModel.SpinBoxesCount())
				oModel.ActiveObject().updatestylesheets()
				SetToolboxModeToSelectAfterDraw()
			#Create QComboBox
			elseif oView.oToolBtn12.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddComboBox(
					new FormDesigner_QComboBox(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("ComboBox",oModel.ComboBoxesCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QDateTimeEdit
			elseif oView.oToolBtn13.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddDateTimeEdit(
					new FormDesigner_QDateTimeEdit(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("DateTimeEdit",oModel.DateTimeEditsCount())
				oModel.ActiveObject().updatestylesheets()
				SetToolboxModeToSelectAfterDraw()
			#Create QTableWidget
			elseif oView.oToolBtn14.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddTableWidget(
					new FormDesigner_QTableWidget(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("TableWidget",oModel.TableWidgetsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QTreeWidget
			elseif oView.oToolBtn15.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddTreeWidget(
					new FormDesigner_QTreeWidget(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("TreeWidget",oModel.TreeWidgetsCount())
				oModel.ActiveObject().updatestylesheets()
				SetToolboxModeToSelectAfterDraw()
			#Create QRadioButton
			elseif oView.oToolBtn16.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddRadioButton(
					new FormDesigner_QRadioButton(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("RadioButton",oModel.RadioButtonsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QWebView
			elseif oView.oToolBtn17.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddWebView(
					new FormDesigner_QWebView(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("WebView",oModel.WebViewsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QDial
			elseif oView.oToolBtn18.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddDial(
					new FormDesigner_QDial(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Dial",oModel.DialsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QVideoWidget
			elseif oView.oToolBtn19.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddVideoWidget(
					new FormDesigner_QVideoWidget(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("VideoWidget",oModel.VideoWidgetsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QFrame
			elseif oView.oToolBtn20.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddFrame(
					new FormDesigner_QFrame3(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Frame",oModel.FramesCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QLCDNumber
			elseif oView.oToolBtn21.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddLCDNumber(
					new FormDesigner_QLCDNumber(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("LCDNumber",oModel.LCDNumbersCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QHyperLink
			elseif oView.oToolBtn22.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddHyperLink(
					new FormDesigner_QHyperLink(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("HyperLink",oModel.HyperLinksCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QTimer
			elseif oView.oToolBtn23.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddTimer(
					new FormDesigner_QTimer(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Timer",oModel.TimersCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QAllEvents
			elseif oView.oToolBtn24.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddAllEvents(
					new FormDesigner_QAllEvents(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("AllEvents",oModel.AllEventsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QLayout
			elseif oView.oToolBtn25.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddLayout(
					new FormDesigner_QLayout(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Layout",oModel.LayoutsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QTab
			elseif oView.oToolBtn26.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddTab(
					new FormDesigner_QTabWidget(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("Tab",oModel.TabsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QStatusBar
			elseif oView.oToolBtn27.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddStatusBar(
					new FormDesigner_QStatusBar(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("StatusBar",oModel.StatusBarsCount())
				SetToolboxModeToSelectAfterDraw()
			#Create QToolbar
			elseif oView.oToolBtn28.ischecked()
				HideCorners()
				UpdatePositionForParent(aRect)
				oModel.AddToolBar(
					new FormDesigner_QToolbar(oModel.CurrentParent()) {
						move(aRect[1],aRect[2])
						resize(aRect[3],aRect[4])
						setFocusPolicy(0)
						setMouseTracking(True)
						cParent = this.oModel.CurrentParentName()
					}
				)
				oModel.ActiveObject().setCurrentParentName(cParent)
				NewControlEvents("ToolBar",oModel.ToolBarsCount())
				SetToolboxModeToSelectAfterDraw()
		} 
	} 
	func UpdatePositionForParent aRect { 
		if classname(oModel.ActiveObject()) = "formdesigner_qtabwidget" { 
			#28 for the tab title height
			aRect[1] -= oModel.ActiveObject().x()
			aRect[2] -= oModel.ActiveObject().y()+28
			elseif isObject(oModel.CurrentParentCache())
				#28 for the tab title height
				aRect[1] -= oModel.CurrentParentCache().x()
				aRect[2] -= oModel.CurrentParentCache().y()+28
		} 
	} 
	func NewControlEvents cName,nCount { 
		CreateControlEvents(cName,nCount)
		oModel.ActiveObject().CreateCorners()
		AddObjectsToCombo()
		ObjectProperties()
	} 
	func CreateControlEventsCornersNoInit cName,nCount { 
		CreateControlEvents(cName,nCount)
		oModel.ActiveObject().CreateCornersNoInit()
	} 
	func CreateControlEvents cName,nCount { 
		oFilter = new qAllevents(oModel.ActiveObject())
		{
			#/*
			#				  Here we uses This.Method() to access the
			#				  Method() method in the WindowsControllerParent class
			#				  Because we are inside braces { } to access qAllevents Methods
			#				  Using Method() without This.Method() will access
			#				  the Method() Function (Not the Method() Method)
			#				  The difference between Method() Function and Method() Method is that
			#				  the Method() Method define the event for the current object (This instance)
			#				  While Method() function define the event for the current active object
			#				  The current active object maybe changed by using
			#				  openWindow() or openWindownoshow() functions.
			#				  This happened when we merged the Form Designer with Ring Notepad.
			#				  So to avoid defining the events for other objects, We uses This.Method() to
			#				  be sure that the event will be defined for the correct object that will be
			#				  created from this class.
			#				*/
			setmousebuttonpressevent(This.Method(:ActiveObjectMousePress+"("+this.oModel.GetCurrentID()+")"))
			setMouseButtonReleaseEvent(This.Method(:ActiveObjectMouseRelease+"("+this.oModel.GetCurrentID()+")"))
			setMouseMoveEvent(This.Method(:ActiveObjectMouseMove+"("+this.oModel.GetCurrentID()+")"))
		}
		oModel.ActiveObject().installeventfilter(oFilter)
		oModel.ActiveObject().oFilter = oFilter
		if find([:formdesigner_qlabel,:formdesigner_qpushbutton,:formdesigner_qcheckbox,:formdesigner_qradiobutton],classname(oModel.ActiveObject())) { 
			oModel.ActiveObject().setText(cName+nCount)
		} 
		oModel.ActiveObject().Show()
	} 
	func SelectObjects aRect { 
		nSX = aRect[1]
		nSY = aRect[2]
		nSX2 = nSX+aRect[3]
		nSY2 = nSY+aRect[4]
		aObjects = oModel.GetObjects()
		for x = 2 to len(aObjects) step 1 { 
			#Start from 2 to avoid the Form Object
			item = aObjects[x]
			oObject = item[2]
			if  NOT (oObject.CurrentParentName() = "win" OR oObject.CurrentParentName() = "") { 
				loop 1
			} 
			nX = oObject.x()
			nY = oObject.y()
			nX2 = nX+oObject.Width()
			nY2 = nY+oObject.Height()
			if Intersection(nX,nY,nX2,nY2,nSX,nSY,nSX2,nSY2) { 
				oObject.oCorners.Show()
				oModel.AddSelectedObject(x)
			} 
		} 
	} 
	func Intersection nX,nY,nX2,nY2,nSX,nSY,nSX2,nSY2 { 
		if pointinbox(nX,nY,nSX,nSY,nSX2,nSY2) OR pointinbox(nX,nY2,nSX,nSY,nSX2,nSY2) OR pointinbox(nX2,nY,nSX,nSY,nSX2,nSY2) OR pointinbox(nX2,nY2,nSX,nSY,nSX2,nSY2) OR pointinbox(nSX,nSY,nX,nY,nX2,nY2) OR pointinbox(nSX,nSY2,nX,nY,nX2,nY2) OR pointinbox(nSX2,nSY,nX,nY,nX2,nY2) OR pointinbox(nSX2,nSY2,nX,nY,nX2,nY2) OR IntersectionLikePlusOperator(nX,nY,nX2,nY2,nSX,nSY,nSX2,nSY2) { 
			return True
		} 
		return False
	} 
	func pointinbox nX,nY,nSX,nSY,nSX2,nSY2 { 
		if nX >= nSX AND nX <= nSX2 AND nY >= nSY AND nY <= nSY2 { 
			return True
		} 
		return False
	} 
	func intersectionlikeplusOperator nX,nY,nX2,nY2,nSX,nSY,nSX2,nSY2 { 
		if (nY < nSY AND nY2 > nSY2 AND nX > nSX AND nX2 < nSX2) OR (nSY < nY AND nSY2 > nY2 AND nSX > nX AND nSX2 < nX2) { 
			return True
		} 
		return False
	} 
	func CancelSelectedObjects  { 
		aObjects = oModel.getselectedObjects()
		if len(aObjects) = 0 { 
			return 
		} 
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.oCorners.Hide()
		} 
		oModel.clearSelectedObjects()
	} 
	func ChangeObjectAction  { 
		if oView.oObjectsCombo.count() = 0 { 
			return 
		} 
		HideCorners()
		nIndex = oView.oObjectsCombo.currentindex()
		oModel.nActiveObject = nIndex+1
		ObjectProperties()
		ShowCorners()
	} 
	func ChangeObjectByCode nIndex { 
		HideCorners()
		oView.oObjectsCombo.blocksignals(True)
		oView.oObjectsCombo.setcurrentindex(nIndex)
		oModel.nActiveObject = nIndex+1
		ObjectProperties()
		oView.oObjectsCombo.blocksignals(False)
		ShowCorners()
	} 
	func HideCorners  { 
		CancelSelectedObjects()
		if isattribute(oModel.activeObject(),"oCorners") { 
			oModel.activeObject().oCorners.Hide()
		} 
	} 
	func ShowCorners  { 
		if isattribute(oModel.activeObject(),"oCorners") { 
			oModel.activeObject().oCorners.Show()
		} 
	} 
	func ActiveObjectMousePress nObjectID { 
		nObjectIndex = oModel.IDToIndex(nObjectID)
		if oView.oToolBtn1.ischecked() { 
			#Select Mode
			if oModel.IsManySelected() { 
				if oModel.IsObjectSelected(nObjectID) { 
					if oFDApp.keyboardmodifiers() { 
						oModel.RemoveSelectedObject(nObjectIndex)
						oModel.GetObjectByIndex(nObjectIndex).oCorners.Hide()
						else
							if classname(oModel.GetObjectByIndex(nObjectIndex))! = "formdesigner_qwidget" { 
								oModel.GetObjectByIndex(nObjectIndex).MousePressMany(self)
							} 
					} 
					ShowPropertiesWidget()
					return 
					else
						if oFDApp.keyboardmodifiers() { 
							oModel.AddSelectedObject(nObjectIndex)
							oModel.GetObjectByIndex(nObjectIndex).MousePressMany(self)
							oModel.GetObjectByIndex(nObjectIndex).oCorners.Show()
							ShowPropertiesWidget()
							return 
						} 
				} 
				else
					#Here we don't have many objects selected
					#Support starting multiple selection operation using the keyboard
					if oFDApp.keyboardmodifiers() { 
						#We save the current object first
						nOldCurrentIndex = oModel.ActiveObjectIndex()
						oModel.ClearSelectedObjects()
						ChangeObjectByCode(nObjectIndex-1)
						#Keep the old current object in selection
						oModel.ActiveObject().oCorners.Show()
						oModel.AddSelectedObject(nOldCurrentIndex)
						#Draw old current object corners
						if classname(oModel.GetObjectByIndex(nOldCurrentIndex))! = "formdesigner_qwidget" { 
							oModel.getobjectByIndex(nOldCurrentIndex).oCorners.show()
						} 
						oModel.AddSelectedObject(nObjectIndex)
						ShowPropertiesWidget()
						return 
					} 
			} 
			ChangeObjectByCode(nObjectIndex-1)
			if classname(oModel.ActiveObject())! = "formdesigner_qwidget" { 
				oModel.ActiveObject().MousePress(self)
			} 
		} 
	} 
	func ActiveObjectMouseRelease nObjectID { 
		nObjectIndex = oModel.IDToIndex(nObjectID)
		if oView.oToolBtn1.ischecked() { 
			#Select Mode
			if oModel.IsManySelected() { 
				if classname(oModel.GetObjectByIndex(nObjectIndex))! = "formdesigner_qwidget" { 
					oModel.GetObjectByIndex(nObjectIndex).MouseReleaseMany(self)
				} 
				return 
			} 
			if classname(oModel.ActiveObject())! = "formdesigner_qwidget" { 
				oModel.ActiveObject().MouseRelease(self)
			} 
		} 
	} 
	func ActiveObjectMouseMove nObjectID { 
		nObjectIndex = oModel.IDToIndex(nObjectID)
		if oView.oToolBtn1.ischecked() { 
			#Select Mode
			if oModel.IsManySelected() { 
				if classname(oModel.GetObjectByIndex(nObjectIndex))! = "formdesigner_qwidget" { 
					oModel.GetObjectByIndex(nObjectIndex).MouseMoveMany(self)
				} 
				return 
			} 
			if classname(oModel.ActiveObject())! = "formdesigner_qwidget" { 
				oModel.ActiveObject().MouseMove(self)
			} 
		} 
	} 
	func KeyPressAction  { 
		if oModel.IsManySelected() { 
			KeyPressManyAction()
			return 
		} 
		if oModel.IsFormActive() { 
			return 
		} 
		nKey = oView.oFilter.getkeycode()
		nModifier = oView.oFilter.getmodifiers()
		switch nModifier { 
			case 0
				#No CTRL Key is pressed
				switch nkey { 
					case Qt_Key_Right
						oModel.ActiveObject().move(oModel.ActiveObject().x()+10,oModel.ActiveObject().y())
					case Qt_Key_Left
						oModel.ActiveObject().move(oModel.ActiveObject().x()-10,oModel.ActiveObject().y())
					case Qt_Key_Up
						oModel.ActiveObject().move(oModel.ActiveObject().x(),oModel.ActiveObject().y()-10)
					case Qt_Key_Down
						oModel.ActiveObject().move(oModel.ActiveObject().x(),oModel.ActiveObject().y()+10)
					case Qt_Key_Delete
						DeleteControl()
						return 
				} 
			case 33554432
				#Shift
				switch nkey { 
					case Qt_Key_Right
						oModel.ActiveObject().resize(oModel.ActiveObject().width()+10,oModel.ActiveObject().height())
					case Qt_Key_Left
						oModel.ActiveObject().resize(oModel.ActiveObject().width()-10,oModel.ActiveObject().height())
					case Qt_Key_Up
						oModel.ActiveObject().resize(oModel.ActiveObject().width(),oModel.ActiveObject().height()-10)
					case Qt_Key_Down
						oModel.ActiveObject().resize(oModel.ActiveObject().width(),oModel.ActiveObject().height()+10)
				} 
		} 
		if ismethod(oModel.ActiveObject(),"refreshcorners") { 
			oModel.ActiveObject().refreshCorners(oModel.ActiveObject())
		} 
	} 
	func DeleteControl  { 
		if oModel.IsManySelected() { 
			aObjects = oModel.getselectedObjects()
			for item in aObjects step 1 { 
				oObject = item[2]
				oObject.oCorners.Hide()
				oObject.Close()
			} 
			oModel.deleteselectedObjects()
			AddObjectsToCombo()
			ShowPropertiesWidget()
			return 
		} 
		if oModel.IsFormActive() { 
			return 
		} 
		HideCorners()
		oModel.ActiveObject().close()
		oModel.deleteactiveObject()
		ShowCorners()
		AddObjectsToCombo()
		if ismethod(oModel.ActiveObject(),"refreshcorners") { 
			oModel.ActiveObject().refreshCorners(oModel.ActiveObject())
		} 
	} 
	func KeyPressManyAction  { 
		nKey = oView.oFilter.getkeycode()
		nModifier = oView.oFilter.getmodifiers()
		aObjects = oModel.getselectedObjects()
		switch nModifier { 
			case 0
				#No CTRL Key is pressed
				switch nkey { 
					case Qt_Key_Right
						for item in aObjects step 1 { 
							oObject = item[2]
							oObject.move(oObject.x()+10,oObject.y())
							oObject.oCorners.refresh(oObject)
						} 
					case Qt_Key_Left
						for item in aObjects step 1 { 
							oObject = item[2]
							oObject.move(oObject.x()-10,oObject.y())
							oObject.oCorners.refresh(oObject)
						} 
					case Qt_Key_Up
						for item in aObjects step 1 { 
							oObject = item[2]
							oObject.move(oObject.x(),oObject.y()-10)
							oObject.oCorners.refresh(oObject)
						} 
					case Qt_Key_Down
						for item in aObjects step 1 { 
							oObject = item[2]
							oObject.move(oObject.x(),oObject.y()+10)
							oObject.oCorners.refresh(oObject)
						} 
					case Qt_Key_Delete
						DeleteControl()
				} 
			case 33554432
				#Shift
				switch nkey { 
					case Qt_Key_Right
						for item in aObjects step 1 { 
							oObject = item[2]
							oObject.resize(oObject.width()+10,oObject.height())
							oObject.oCorners.refresh(oObject)
						} 
					case Qt_Key_Left
						for item in aObjects step 1 { 
							oObject = item[2]
							oObject.resize(oObject.width()-10,oObject.height())
							oObject.oCorners.refresh(oObject)
						} 
					case Qt_Key_Up
						for item in aObjects step 1 { 
							oObject = item[2]
							oObject.resize(oObject.width(),oObject.height()-10)
							oObject.oCorners.refresh(oObject)
						} 
					case Qt_Key_Down
						for item in aObjects step 1 { 
							oObject = item[2]
							oObject.resize(oObject.width(),oObject.height()+10)
							oObject.oCorners.refresh(oObject)
						} 
				} 
		} 
	} 
	func MSAlignLeft  { 
		aObjects = oModel.GetSelectedObjects()
		nX = 5000
		for item in aObjects step 1 { 
			oObject = item[2]
			nX = min(nX,oObject.x())
		} 
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(nX,oObject.y())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSAlignRight  { 
		aObjects = oModel.GetSelectedObjects()
		nRight = 0
		for item in aObjects step 1 { 
			oObject = item[2]
			nRight = max(nRight,oObject.x()+oObject.width())
		} 
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(nRight-oObject.width(),oObject.y())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSAlignTop  { 
		aObjects = oModel.GetSelectedObjects()
		nY = 5000
		for item in aObjects step 1 { 
			oObject = item[2]
			nY = min(nY,oObject.y())
		} 
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(oObject.x(),nY)
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSAlignBottom  { 
		aObjects = oModel.GetSelectedObjects()
		nBottom = 0
		for item in aObjects step 1 { 
			oObject = item[2]
			nBottom = max(nBottom,oObject.y()+oObject.height())
		} 
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(oObject.x(),nbottom-oObject.height())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSCenterVer  { 
		#Get Minimum Top and Maximum Top+Height
		aObjects = oModel.GetSelectedObjects()
		nMinTop = 5000
		nMaxTopHeight = 0
		for item in aObjects step 1 { 
			oObject = item[2]
			nMinTop = min(nMinTop,oObject.y())
			nMaxTopHeight = max(nMaxTopHeight,oObject.y()+oObject.Height())
		} 
		#Get Top Difference
		nDiff = nMaxTopHeight-nMinTop
		nTop = (oObject.ParentWidget().Height()-nDiff)/2
		nDiff = nMinTop-nTop
		#Apply the Top difference to all controls
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(oObject.x(),oObject.y()-nDiff)
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSCenterHor  { 
		#Get Minimum Left and Maximum Left+Width
		aObjects = oModel.GetSelectedObjects()
		nMinLeft = 5000
		nMaxLeftWidth = 0
		for item in aObjects step 1 { 
			oObject = item[2]
			nMinLeft = min(nMinLeft,oObject.x())
			nMaxLeftWidth = max(nMaxLeftWidth,oObject.x()+oObject.Width())
		} 
		#Get Left Difference
		nDiff = nMaxLeftWidth-nMinLeft
		nLeft = (oObject.ParentWidget().Width()-nDiff)/2
		nDiff = nMinLeft-nLeft
		#Apply the Left difference to all controls
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(oObject.x()-nDiff,oObject.y())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSSizeToTallest  { 
		aObjects = oModel.GetSelectedObjects()
		nHeight = 0
		for item in aObjects step 1 { 
			oObject = item[2]
			nHeight = max(nHeight,oObject.height())
		} 
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.resize(oObject.width(),nHeight)
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSSizeToShortest  { 
		aObjects = oModel.GetSelectedObjects()
		nHeight = 5000
		for item in aObjects step 1 { 
			oObject = item[2]
			nHeight = min(nHeight,oObject.height())
		} 
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.resize(oObject.width(),nHeight)
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSSizeToWidest  { 
		aObjects = oModel.GetSelectedObjects()
		nWidth = 0
		for item in aObjects step 1 { 
			oObject = item[2]
			nWidth = max(nWidth,oObject.width())
		} 
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.resize(nWidth,oObject.Height())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSSizeToNarrowest  { 
		aObjects = oModel.GetSelectedObjects()
		nWidth = 5000
		for item in aObjects step 1 { 
			oObject = item[2]
			nWidth = min(nWidth,oObject.width())
		} 
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.resize(nWidth,oObject.Height())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func SortObjectsByX  { 
		#Sort the list of objects by X value 	
		aObjects = oModel.GetSelectedObjects()
		aSortedObjects = []
		for item in aObjects step 1 { 
			oObject = item[2]
			aSortedObjects+[item,oObject.X()]
		} 
		return sort( aSortedObjects,2 ) 
	} 
	func SortObjectsByY  { 
		#Sort the list of objects by Y value 	
		aObjects = oModel.GetSelectedObjects()
		aSortedObjects = []
		for item in aObjects step 1 { 
			oObject = item[2]
			aSortedObjects+[item,oObject.Y()]
		} 
		return sort( aSortedObjects,2 ) 
	} 
	func MSHorSpacingMakeEqual  { 
		aSortedObjects = SortObjectsByX()
		nLastLeft = 0
		for x = 1 to len(aSortedObjects) step 1 { 
			item = aSortedObjects[x][1]
			oObject = item[2]
			if x = 1 { 
				nLastLeft = oObject.x()+oObject.Width()+10
				loop 1
			} 
			oObject.move(nLastLeft,oObject.y())
			nLastLeft = oObject.x()+oObject.Width()+10
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSHorSpacingIncrease  { 
		aSortedObjects = SortObjectsByX()
		for x = 2 to len(aSortedObjects) step 1 { 
			item = aSortedObjects[x][1]
			oObject = item[2]
			oObject.move(oObject.x()+(10*(x-1)),oObject.y())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSHorSpacingDecrease  { 
		aSortedObjects = SortObjectsByX()
		for x = 2 to len(aSortedObjects) step 1 { 
			item = aSortedObjects[x][1]
			oObject = item[2]
			oObject.move(oObject.x()-(10*(x-1)),oObject.y())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSVerSpacingMakeEqual  { 
		aSortedObjects = SortObjectsByY()
		nLastTop = 0
		for x = 1 to len(aSortedObjects) step 1 { 
			item = aSortedObjects[x][1]
			oObject = item[2]
			if x = 1 { 
				nLastTop = oObject.y()+oObject.Height()+10
				loop 1
			} 
			oObject.move(oObject.x(),nLastTop)
			nLastTop = oObject.y()+oObject.Height()+10
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSVerSpacingIncrease  { 
		aSortedObjects = SortObjectsByY()
		for x = 2 to len(aSortedObjects) step 1 { 
			item = aSortedObjects[x][1]
			oObject = item[2]
			oObject.move(oObject.x(),oObject.y()+(10*(x-1)))
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSVerSpacingDecrease  { 
		aSortedObjects = SortObjectsByY()
		for x = 2 to len(aSortedObjects) step 1 { 
			item = aSortedObjects[x][1]
			oObject = item[2]
			oObject.move(oObject.x(),oObject.y()-(10*(x-1)))
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSTextColor  { 
		oGeneral.cColorOperation = :MSTextColor
		cColor = oGeneral.SelectColor()
	} 
	func ApplyMSTextColor cColor { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oModel.GetObjectByID(item[3]).setTextColor(cColor)
		} 
	} 
	func MSBackColor  { 
		oGeneral.cColorOperation = :MSBackColor
		cColor = oGeneral.SelectColor()
	} 
	func ApplyMSBackColor cColor { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oModel.GetObjectByID(item[3]).setBackColor(cColor)
		} 
	} 
	func MSFont  { 
		oGeneral.cFontOperation = :MSFont
		oGeneral.SelectFont()
	} 
	func ApplyMSFont cFont { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oModel.GetObjectByID(item[3]).setFontProperty(cFont)
		} 
	} 
	func MSMoveUp  { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(oObject.x(),oObject.y()-10)
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSMoveDown  { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(oObject.x(),oObject.y()+10)
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSMoveLeft  { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(oObject.x()-10,oObject.y())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSMoveRight  { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.move(oObject.x()+10,oObject.y())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSIncreaseWidth  { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.resize(oObject.width()+10,oObject.height())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSDecreaseWidth  { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.resize(oObject.width()-10,oObject.height())
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSIncreaseHeight  { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.resize(oObject.width(),oObject.height()+10)
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func MSDecreaseHeight  { 
		aObjects = oModel.GetSelectedObjects()
		for item in aObjects step 1 { 
			oObject = item[2]
			oObject.resize(oObject.width(),oObject.height()-10)
			oObject.oCorners.Refresh(oObject)
		} 
	} 
	func NewAction  { 
		oFile.NewAction(self)
	} 
	func OpenAction  { 
		oFile.OpenAction(self)
	} 
	func SaveAction  { 
		oFile.SaveAction(self)
	} 
	func SaveAsAction  { 
		oFile.SaveAsAction(self)
	} 
	func CloseAction  { 
		oFile.CloseAction(self)
	} 
	func ExitAction  { 
		if HasParent() { 
			#The form designer is embedded in Dockable widget
			oView.win.parentwidget().Hide()
			return 
		} 
		Super.CloseAction()
	} 
	func Duplicate  { 
		#Selected objects - if we have many objects selected
		oModel.RefreshSelectedObjects()
		#Support duplication of one selected object
		aObjects = oModel.GetSelectedObjects()
		if len(aObjects) = 0 AND  NOT oModel.IsFormActive() { 
			aObjects = oModel.ActiveObjectItemAsList()
		} 
		#Display messagebox if not objects are selected
		if len(aObjects) = 0 { 
			ShowMsg("Sorry!","No objects are selected","Select objects first to be duplicated")
			return 
		} 
		#Duplication of selected objects
		cCode = oFile.Objects2String(self,aObjects)
		eval(cCode)
		#Update Name and Position
		nIndex = 0
		for item in aObjectsList step 1 { 
			nIndex++
			#Remove Numbers from the name
			for char in item[:name] step 1 { 
				if  NOT isalpha(char) AND isalnum(char) { 
					char = " "
				} 
			} 
			item[:name] = substr(item[:name]," ","")
			#Avoid name duplication
			while find(oModel.aObjectsList,item[:name]+(oModel.ObjectsCount()+nIndex-1),1) { 
				nIndex++
			} 
			#Add New number to the name
			#-1 to avoid counting the window object
			item[:name] += ""+(oModel.ObjectsCount()+nIndex-1)
			#Update Position
			item[:data][:x] += 10
			item[:data][:y] += 10
		} 
		nCount = oModel.ObjectsCount()
		oFile.CreateFormObjects(self,aObjectsList)
		#Select the new objects
		aObjects = oModel.GetObjects()
		for x = nCount+1 to len(aObjects) step 1 { 
			item = aObjects[x]
			oObject = item[2]
			oObject.oCorners.Show()
			if nCount+1! = len(aObjects) { 
				oModel.AddSelectedObject(x)
			} 
		} 
	} 
	func ShowMsg cTitle,cText,cText2 { 
		 new QMessageBox(oView.win)
		{
			setWindowFlags(Qt_Popup|Qt_WindowTitleHint|Qt_CustomizeWindowHint)
			setwindowtitle(cTitle)
			settext(cText+nl+cText2)
			show()
		}
	} 
	func BringToFront  { 
		if CheckOneObject() { 
			oModel.ActiveObject().oCorners.Hide()
			oModel.ActiveObject().raise()
			oModel.RaiseActiveObject()
			AddObjectsToCombo()
		} 
	} 
	func SendToBack  { 
		if CheckOneObject() { 
			oModel.ActiveObject().oCorners.Hide()
			oModel.ActiveObject().lower()
			oModel.LowerActiveObject()
			AddObjectsToCombo()
		} 
	} 
	func CheckOneObject  { 
		if oModel.IsFormActive() OR oModel.IsManySelected() { 
			ShowMsg("Sorry!","Object selection is not correct","Select one object first!")
			return False
		} 
		return True
	} 
	func Toolbox  { 
		if oView.oToolBoxDock.isvisible() { 
			oView.oToolBoxDock.hide()
			else
				oView.oToolBoxDock.Show()
		} 
	} 
	func Properties  { 
		if oView.oPropertiesDock.isvisible() { 
			oView.oPropertiesDock.hide()
			else
				oView.oPropertiesDock.Show()
		} 
	} 
	func OpenCHMAction  { 
		new QDesktopServices
		{
			OpenURL( new qURL("file:///"+substr(exefolder(),"\","/")+"../documents/ring.chm"))
		}
	} 
	func OpenPDFAction  { 
		new QDesktopServices
		{
			OpenURL( new qURL("file:///"+substr(exefolder(),"\","/")+"../documents/ring.pdf"))
		}
	} 
	func MsgBox cTitle,cMessage { 
		 new QMessagebox(oView.win)
		{
			setWindowFlags(Qt_Popup|Qt_WindowTitleHint|Qt_CustomizeWindowHint)
			setwindowtitle(cTitle)
			setText(cMessage)
			show()
		}
	} 
	func LangAction  { 
		#"Programming Language"
		MsgBox(T_FORMDESIGNER_LANG_TITLE,T_FORMDESIGNER_LANG_INFO)
		#"This application is developed using the Ring programming language"
	} 
	func GUIAction  { 
		#"GUI Library"
		MsgBox(T_FORMDESIGNER_GUILIB_TITLE,T_FORMDESIGNER_GUILIB_INFO)
		#"This application uses the Qt GUI Library through RingQt"
	} 
	func AboutAction  { 
		#"About"
		MsgBox(T_FORMDESIGNER_ABOUT_TITLE,T_FORMDESIGNER_ABOUT_INFO)
	} 
	func HasParent  { 
		oParent = oView.win.parentwidget()
		if  NOT oParent.pObject = NULLPointer() { 
			return True
		} 
		return False
	} 
	func OpenFile cFileName { 
		oFile {
			SetFileName(cFileName)
			LoadFormFromFile(this)
		}
	} 
	func PrepareStringForFormFile cString { 
		#To allow writing " in properties
		if isString(cString) { 
			cString = SubStr(cString,'"','"+char(34)+"')
		} 
		return cString
	} 
	func SaveIfOnlyFileIsOpened  { 
		oFile.SaveIfOnlyFileIsOpened(self)
	} 
	func ObjectsOrderAction  { 
		openWindowAndLink(:ObjectsOrderController,self)
		ObjectsOrder().loadobjects()
	} 
	func SelectObjectsWindow  { 
		openWindowAndLink(:selObjectsController,self)
		SelObjects().loadobjects()
	} 
	func DownloadAction  { 
		#Avoid _ in the start of the file name (Added by Qt!)
		cDownloadedFileName = oFile.cFileName
		if len(cDownloadedFileName) > 1 { 
			if !isalnum(cDownloadedFileName[1]) { 
				cDownloadedFileName = substr(cDownloadedFileName,2)
			} 
		} 
		WebAssemblyDownload(cDownloadedFileName,oFile.FormFileContent(self))
	} 
	func UploadAction  { 
		WebAssemblyUpload("Form Files (*.rform)",Method(:FileLoaded))
	} 
	func FileLoaded  { 
		if fexists(WebAssemblyUploadedFileName()) { 
			remove(WebAssemblyUploadedFileName())
		} 
		Write(WebAssemblyUploadedFileName(),WebAssemblyUploadedFileContent())
		OpenFile(WebAssemblyUploadedFileName())
	} 
	func NewEventName cEventName { 
		if trim(cEventName) = NULL { 
			return 
		} 
		if IsParent() { 
			if isMethod(Parent(),:NewEventName) { 
				Parent().NewEventName(cEventName)
			} 
		} 
	} 
	func ActiveFileName  { 
		return oFile. cFileName
	} 
private
