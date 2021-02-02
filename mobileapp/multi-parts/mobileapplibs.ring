#START qt.rh Constants ===============================================================================

Qt_AlignLeft = 1
Qt_AlignRight = 2
Qt_AlignHCenter = 4
Qt_AlignJustify = 8
Qt_AlignTop = dec("20")
Qt_AlignBottom = dec("40")
Qt_AlignVCenter = dec("80")

QMessageBox_Ok = dec("00000400")	 
QMessageBox_Open = dec("00002000") 
QMessageBox_Save = dec("00000800") 
QMessageBox_Cancel = dec("00400000") 
QMessageBox_Close = dec("00200000") 
QMessageBox_Discard = dec("00800000") 
QMessageBox_Apply = dec("02000000") 
QMessageBox_Reset = dec("04000000") 
QMessageBox_RestoreDefaults = dec("08000000")	 
QMessageBox_Help = dec("01000000")
QMessageBox_SaveAll = dec("00001000") 
QMessageBox_Yes	= dec("00004000") 
QMessageBox_YesToAll = dec("00008000") 
QMessageBox_No = dec("00010000")	 
QMessageBox_NoToAll = dec("00020000") 
QMessageBox_Abort = dec("00040000") 
QMessageBox_Retry = dec("00080000") 
QMessageBox_Ignore = dec("00100000") 
QMessageBox_NoButton = dec("00000000") 

Qt_Widget = 0
Qt_Window = 1
Qt_dialog = 2 | Qt_Window
Qt_sheet = 4 | Qt_Window
Qt_Drawer = Qt_sheet | Qt_Dialog
Qt_popup = 8 | Qt_Window
Qt_Tool = Qt_popup | Qt_Dialog
Qt_ToolTip = Qt_Popup | Qt_Sheet
Qt_SplashScreen = Qt_ToolTip | Qt_Dialog
Qt_Desktop = dec("10") | Qt_Window
Qt_SubWindow = dec("12") 
Qt_ForeignWindow = dec("20") | Qt_Window
Qt_CoverWindow = dec("40") | Qt_Window

Qt_CustomizeWindowHint = dec("2000000")
Qt_WindowTitleHint  = dec("1000")
Qt_WindowSystemMenuHint  = dec("2000")
Qt_WindowMinimizeButtonHint  = dec("4000")
Qt_WindowMaximizeButtonHint  = dec("8000")
Qt_WindowMinMaxButtonsHint = Qt_WindowMinimizeButtonHint | Qt_WindowMaximizeButtonHint 
Qt_WindowCloseButtonHint  = dec("8000000")
Qt_WindowContextHelpButtonHint  = dec("10000")
Qt_MacWindowToolBarButtonHint  = dec("10000000")
Qt_WindowFullscreenButtonHint  = dec("80000000")
Qt_BypassGraphicsProxyWidget = dec("20000000")
Qt_WindowShadeButtonHint = dec("20000")
Qt_WindowStaysOnTopHint = dec("40000")
Qt_WindowStaysOnBottomHint = dec("4000000")
Qt_windowOkButtonHint = dec("80000")
Qt_WindowCancelButtonHint = dec("100000")
Qt_WindowTransparentForInput = dec("80000")
Qt_WindowOverridesSystemGestures = dec("100000")
Qt_WindowDoesNotAcceptFocus = dec("200000")
Qt_MaximizeUsingFullscreenGeometryHint = dec("400000")
Qt_WindowType_Mask = dec("ff")

Qt_Unchecked = 0
Qt_PartiallyChecked = 1
Qt_Checked = 2


QDockWidget_DocWidgetClosable = 1
QDockWidget_DockWidgetMovable = 2
QDockWidget_DockWidgetFloatable = 4
QDockWidget_DockWidgetVerticalTitleBar = 8
QDockWidget_AllDockWidgetFeatures = QDockWidget_DocWidgetClosable | QDockWidget_DockWidgetMovable | QDockWidget_DockWidgetFloatable
QDockWidget_NoDockWidgetFeatures = 0

QTextEdit_NoWrap = 0
QTextEdit_WidgetWidth = 1
QTextEdit_FixedPixelWidth = 2
QTextEdit_FixedColumnWidth = 3

Qt_LeftDockWidgetArea = 1
Qt_RightDockWidgetArea = 2
Qt_TopDockWidgetArea = 4
Qt_BottomDockWidgetArea = 8
Qt_NoDockWidgetArea = 0

Qt_Horizontal = 1
Qt_Vertical = 2

QAbstractItemView_SelectItems = 0
QAbstractItemView_SelectRows = 1
QAbstractItemView_SelectColumns = 2

QFrame_Plain = dec("10")
QFrame_Raised = dec("20")
QFrame_Sunken = dec("30")

QFrame_NoFrame = 0
QFrame_Box = 1
QFrame_Panel = 2
QFrame_StyledPanel = 6
QFrame_HLine = 4
QFrame_VLine = 5
QFrame_WinPanel = 3

Qt_WA_AcceptDrops = 78
Qt_WA_AlwaysShowToolTips = 84
Qt_WA_ContentsPropagated = 3
Qt_WA_CustomWhatsThis = 74
Qt_WA_DeleteOnClose = 55
Qt_WA_Disabled = 0
Qt_WA_DontShowOnScreen = 103
Qt_WA_ForceDisabled = 32
Qt_WA_ForceUpdatesDisabled = 59
Qt_WA_GroupLeader = 72
Qt_WA_Hover = 74
Qt_WA_InputMethodEnabled = 14
Qt_WA_KeyboardFocusChange = 77
Qt_WA_KeyCompression = 33
Qt_WA_LayoutOnEntireRect = 48
Qt_WA_LayoutUsesWidgetRect = 92
Qt_WA_MacNoClickThrough = 12
Qt_WA_MacOpaqueSizeGrip = 85
Qt_WA_MacShowFocusRect = 88
Qt_WA_MacNormalSize = 89
Qt_WA_MacSmallSize = 90
Qt_WA_MacMiniSize = 91
Qt_WA_MacVariableSize = 102
Qt_WA_MacBrushedMetal = 46
Qt_WA_Mapped = 11
Qt_WA_MouseNoMask = 71
Qt_WA_MouseTracking = 2
Qt_WA_Moved = 43
Qt_WA_MSWindowsUseDirect3D = 94
Qt_WA_NoChildEventsForParent = 58
Qt_WA_NoChildEventsFromChildren = 39
Qt_WA_NoMouseReplay = 54
Qt_WA_NoMousePropagation = 73
Qt_WA_TransparentForMouseEvents = 51
Qt_WA_NoSystemBackground = 9
Qt_WA_OpaquePaintEvent = 4
Qt_WA_OutsideWSRange = 49
Qt_WA_PaintOnScreen = 8
Qt_WA_PaintUnclipped = 52
Qt_WA_PendingMoveEvent = 34
Qt_WA_PendingResizeEvent = 35
Qt_WA_QuitOnClose = 76
Qt_WA_Resized = 42
Qt_WA_RightToLeft = 56
Qt_WA_SetCursor = 38
Qt_WA_SetFont = 37
Qt_WA_SetPalette = 36
Qt_WA_SetStyle = 86
Qt_WA_ShowModal = 70
Qt_WA_StaticContents = 5
Qt_WA_StyleSheet = 97
Qt_WA_TranslucentBackground = 120
Qt_WA_UnderMouse = 1
Qt_WA_UpdatesDisabled = 10
Qt_WA_WindowModified = 41
Qt_WA_WindowPropagation = 80
Qt_WA_MacAlwaysShowToolWindow = 96
Qt_WA_SetLocale = 87
Qt_WA_StyledBackground = 93
Qt_WA_ShowWithoutActivating = 98
Qt_WA_NativeWindow = 100
Qt_WA_DontCreateNativeAncestors = 101
Qt_WA_X11NetWmWindowTypeDesktop = 104
Qt_WA_X11NetWmWindowTypeDock = 105
Qt_WA_X11NetWmWindowTypeToolBar = 106
Qt_WA_X11NetWmWindowTypeMenu = 107
Qt_WA_X11NetWmWindowTypeUtility = 108
Qt_WA_X11NetWmWindowTypeSplash = 109
Qt_WA_X11NetWmWindowTypeDialog = 110
Qt_WA_X11NetWmWindowTypeDropDownMenu = 111
Qt_WA_X11NetWmWindowTypePopupMenu = 112
Qt_WA_X11NetWmWindowTypeToolTip = 113
Qt_WA_X11NetWmWindowTypeNotification = 114
Qt_WA_X11NetWmWindowTypeCombo = 115
Qt_WA_X11NetWmWindowTypeDND = 116
Qt_WA_MacFrameworkScaled = 117
Qt_WA_AcceptTouchEvents = 121
Qt_WA_TouchPadAcceptSingleTouchEvents = 123
Qt_WA_X11DoNotAcceptFocus = 126
Qt_WA_AlwaysStackOnTop = 128

QCompleter_PopupCompletion = 0
QCompleter_InlineCompletion = 2
QCompleter_UnfilteredPopupCompletion = 1

QCompleter_UnsortedModel = 0
QCompleter_CaseSensitivelySortedModel = 1
QCompleter_CaseInsensitivelySortedModel = 2

Qt_CaseInsensitive	= 0
Qt_CaseSensitive	= 1

QString_KeepEmptyParts	= 0
QString_SkipEmptyParts	= 1

QProcess_NormalExit = 0
QProcess_CrashExit = 1
QProcess_ManagedInputChannel = 0
QProcess_ForwardedInputChannel = 1
QProcess_StandardOutput = 0
QProcess_StandardError = 1
QProcess_SeparateChannels = 0
QProcess_MergedChannels = 1
QProcess_ForwardedChannels = 1
QProcess_ForwardedErrorChannel = 4
QProcess_ForwardedOutputChannel = 6

QProcess_FailedToStart = 0
QProcess_Crashed = 1
QProcess_Timedout = 2
QProcess_WriteError = 4
QProcess_ReadError = 3
QProcess_UnknownError = 5
QProcess_NotRunning = 0
QProcess_Starting = 1
QProcess_Running = 2

QIODevice_NotOpen = 0
QIODevice_ReadOnly = 1
QIODevice_WriteOnly = 2
QIODevice_ReadWrite = QIODevice_ReadOnly | QIODevice_WriteOnly
QIODevice_Append = 4
QIODevice_Truncate = 8
QIODevice_Text = dec("10")
QIODevice_Unbuffered = dec("20")

Qt_ScrollBarAsNeeded = 0
Qt_ScrollBarAlwaysOff = 1
Qt_ScrollBarAlwaysOn = 2

Qt_ArrowCursor		=	0	  
Qt_UpArrowCursor 	=	1
Qt_CrossCursor		= 	2	  
Qt_WaitCursor 	 	=	3
Qt_IBeamCursor		=	4 
Qt_SizeVerCursor	=	5
Qt_SizeHorCursor	=	6
Qt_SizeBDiagCursor	=	7
Qt_SizeFDiagCursor	=	8
Qt_SizeAllCursor	=	9
Qt_BlankCursor		=	10	
Qt_SplitVCursor		=	11
Qt_SplitHCursor		=	12
Qt_PointingHandCursor	=	13
Qt_ForbiddenCursor	=	14
Qt_OpenHandCursor	=	17
Qt_ClosedHandCursor	=	18
Qt_WhatsThisCursor	=	15
Qt_BusyCursor		=	16	 
Qt_DragMoveCursor	=	20
Qt_DragCopyCursor	=	19
Qt_DragLinkCursor	=	21
Qt_BitmapCursor		=	24	


Qt_Key_Escape = dec("1000000")	 
Qt_Key_Tab = dec("1000001")	 
Qt_Key_Backtab  = dec("1000002")	 
Qt_Key_Backspace= dec("1000003") 
Qt_Key_Return = dec("1000004")
Qt_Key_Enter  = dec("1000005")
Qt_Key_Insert = dec("1000006")	 
Qt_Key_Delete = dec("1000007")	 
Qt_Key_Pause  = dec("1000008")

Qt_Key_Print	= dec("01000009")
Qt_Key_SysReq	= dec("0100000a")
Qt_Key_Clear	= dec("0100000b")	 
Qt_Key_Home	= dec("01000010")
Qt_Key_End	= dec("01000011")
Qt_Key_Left	= dec("01000012")
Qt_Key_Up	= dec("01000013")
Qt_Key_Right	= dec("01000014")
Qt_Key_Down	= dec("01000015")
Qt_Key_PageUp	= dec("01000016")
Qt_Key_PageDown	= dec("01000017")
Qt_Key_Shift	= dec("01000020")
Qt_Key_Control	= dec("01000021")

QAbstractItemView_SingleSelection = 1
QAbstractItemView_ContiguousSelection = 4
QAbstractItemView_ExtendedSelection = 3
QAbstractItemView_MultiSelection = 2
QAbstractItemView_NoSelection = 0

Qt_WA_TransparentForMouseEvents = 51

QItemSelectionModel_NoUpdate = 0
QItemSelectionModel_Clear = 1
QItemSelectionModel_Select = 2
QItemSelectionModel_Deselect = 4
QItemSelectionModel_Toggle = 8
QItemSelectionModel_Current = dec("10")
QItemSelectionModel_Rows = dec("20")
QItemSelectionModel_Columns = dec("40")
QItemSelectionModel_SelectCurrent = QItemSelectionModel_Select | QItemSelectionModel_Current
QItemSelectionModel_ToggleCurrent = QItemSelectionModel_Toggle |  QItemSelectionModel_Current
QItemSelectionModel_ClearAndSelect = QItemSelectionModel_Clear | QItemSelectionModel_Select

QAbstractItemView_NoEditTriggers = 0
QAbstractItemView_CurrentChanged = 1
QAbstractItemView_DoubleClicked = 2
QAbstractItemView_SelectedClicked = 4
QAbstractItemView_EditKeyPressed = 8
QAbstractItemView_AnyKeyPressed = 16
QAbstractItemView_AllEditTriggers = 31

#END qt.rh Constants ===============================================================================

#START objectslib Constants ========================================================================

# List of objects (Windows/Forms)
	$RingQt_ObjectsList = []	# Contains sub lists [object ID , Object]

# The Object ID Counter
	$RingQt_ObjectID = 0

# Variable used for Windows/Forms object name - used for setting events 
	$RingQt_ObjName = ""

# The next constants for the Objects List
	C_RINGQT_OBJECTSLIST_ID 	= 1
	C_RINGQT_OBJECTSLIST_OBJECT 	= 2


#END objectslib Constants ==========================================================================

#START GUILIB Constants and Functions ==============================================================

/*
	The next function create new object, add the object to the $RingQt_ObjectsList
	Then set $RingQt_ObjName to the object in the $RingQt_ObjectsList
	Then call the start() method
*/


GUILib = new GUILib

cDialogIcon = ""

# Constant used by the Sleep() function
	C_SECONDSIZE = ClocksPerSecond()

# Constant used by the ReadLine() function
	C_LINESIZE = 256

# Constants used by SystemSilent()
	C_WINDOWS_NOOUTPUTNOERROR = " >nul 2>nul"
	C_LINUX_NOOUTPUTNOERROR   = " > /dev/null"

func ringvm_give 
	return InputBox("","Enter Data :")

func input x
	return InputBox("","Enter Data (" + x + ")")

func getchar 
	return InputBox("","Get Character :")

func setwinicon pWindow,cImage
	if cImage = NULL return ok		
	pWindow.setWindowIcon(new qicon(new qpixmap(cImage)))
		
func setbtnimage pBtn,cImage
	if cImage = NULL return ok		
	pBtn.setIcon(new qicon(new qpixmap(cImage)))

func SetDialogIcon cFile
	cDialogIcon = cFile
	
func MsgInfo cTitle,cMessage
        new qmessagebox(null)
        {
		setwindowtitle(cTitle)
		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
                setstandardbuttons(QMessageBox_Ok)
                settext(cMessage) 	
		if cDialogIcon != NULL
			setwinicon(self,cDialogIcon)
		ok
		exec()
        }

func confirmMsg cTitle,cMessage
        new qmessagebox(null)
        {
		setwindowtitle(cTitle)
		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
                setstandardbuttons(QMessageBox_Yes | QMessageBox_No)
                settext(cMessage) 
		if cDialogIcon != NULL
			setwinicon(self,cDialogIcon)
		ok
                result = exec()
        }
	if result = QMessageBox_Yes return 1 ok
	return 0
                       
func InputBox cTitle,cMessage
        oInput = new QInputDialog(null)
        {
		setwindowtitle(cTitle)
		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
		setgeometry(100,100,400,50)
		setlabeltext(cMessage)
		if cDialogIcon != NULL
			setwinicon(self,cDialogIcon)
		ok
		lcheck = exec()
        }
	if lCheck return oInput.textvalue() ok

func InputBoxInt cTitle,cMessage
        oInput = new QInputDialog(null)
        {
        	setwindowtitle(cTitle)
		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
                setgeometry(100,100,400,50)
                setlabeltext(cMessage)
		setInputMode(1)	# Accept Number (int)
		if cDialogIcon != NULL
			setwinicon(self,cDialogIcon)
		ok
		lcheck = exec()
        }
	if lCheck return oInput.intvalue() ok


func InputBoxNum cTitle,cMessage
        oInput = new QInputDialog(null)
        {
        	setwindowtitle(cTitle)
		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
                setgeometry(100,100,400,50)
                setlabeltext(cMessage)
		setInputMode(2)	# Accept Number (Double)
		if cDialogIcon != NULL
			setwinicon(self,cDialogIcon)
		ok
		lcheck = exec()
        }
	if lCheck return oInput.doublevalue() ok

func InputBoxPass cTitle,cMessage
        oInput = new QInputDialog(null)
        {
		setwindowtitle(cTitle)
		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
		setgeometry(100,100,400,50)
		setlabeltext(cMessage)
		setTextEchoMode(2)	# Password
		if cDialogIcon != NULL
			setwinicon(self,cDialogIcon)
		ok
		lcheck = exec()
        }
	if lCheck return oInput.textvalue() ok

func AppFile cFile
	cFile = substr(cFile,"\","/")
	if find(cfunctions(),"ismobileqt")
		if ismobileqt()
			cFile = ":/"+substr(cFile,"\","/")
		ok
	ok
	return cFile

func ismobile
	if find(cfunctions(),"ismobileqt")
		if ismobileqt()
			return True
		ok
	ok
	return False


Func GetObjectPointerFromRingObject pObj
     if isobject(pObj)
	if isattribute(pObj,'pObject')
		return pObj.pObject
	else 
		raise('Error, The parameter is not a GUI object!')
	ok
     ok	
     return pObj		

#END GUILIB Constants and Functions ==============================================================

#START OBJECTS LIB Constants and Functions =======================================================

func Open_Window cClass
	cRingQt_ObjName = $RingQt_ObjName	# Save the current Object
	$RingQt_ObjectID++
	$RingQt_ObjectsList + [$RingQt_ObjectID,""]	
	$RingQt_ObjName = "$RingQt_ObjectsList[Get_Window_Pos("+$RingQt_ObjectID+")]" +
			 "[C_RINGQT_OBJECTSLIST_OBJECT]"
	cCode = ""
	if packagename() != NULL {
		cCode += "import " + packagename()  + nl
	}
	cCode += $RingQt_ObjName + " = new " + cClass + nl + 
		  $RingQt_ObjName + ".start()"
	eval(cCode)	
	if cRingQt_ObjName != NULL {
		$RingQt_ObjName = cRingQt_ObjName	# Restore the current Object
	}

/*
	The next function is the same as Open_Window()
	But takes an extra list that determine the packages 
	To import before opening the window.
*/

func Open_WindowInPackages cClass,aPackages
	cRingQt_ObjName = $RingQt_ObjName	# Save the current Object
	$RingQt_ObjectID++
	$RingQt_ObjectsList + [$RingQt_ObjectID,""]	
	$RingQt_ObjName = "$RingQt_ObjectsList[Get_Window_Pos("+$RingQt_ObjectID+")]" +
			 "[C_RINGQT_OBJECTSLIST_OBJECT]"
	cCode = ""
	if packagename() != NULL {
		cCode += "import " + packagename()  + nl
	}
	for cPackage in aPackages {
		cCode += "import " + cPackage  + nl
	}
	cCode += $RingQt_ObjName + " = new " + cClass + nl + 
		  $RingQt_ObjName + ".start()"
	eval(cCode)	
	if cRingQt_ObjName != NULL {
		$RingQt_ObjName = cRingQt_ObjName	# Restore the current Object
	}


/*
	The next function create new object, add the object to the $RingQt_ObjectsList
	Then set $RingQt_ObjName to the object in the $RingQt_ObjectsList
*/

func Open_WindowNoShow cClass
	cRingQt_ObjName = $RingQt_ObjName	# Save the current Object
	$RingQt_ObjectID++
	$RingQt_ObjectsList + [$RingQt_ObjectID,""]	
	$RingQt_ObjName = "$RingQt_ObjectsList[Get_Window_Pos("+$RingQt_ObjectID+")]" +
			 "[C_RINGQT_OBJECTSLIST_OBJECT]"
	cCode = ""
	if packagename() != NULL {
		cCode += "import " + packagename()  + nl
	}
	cCode += $RingQt_ObjName + " = new " + cClass 
	eval(cCode)	
	$RingQt_ObjName = cRingQt_ObjName	# Restore the current Object


/*
	The next function create new object, add the object to the $RingQt_ObjectsList
	Then set $RingQt_ObjName to the object in the $RingQt_ObjectsList
	Then call the start() method
	The function link between the parent window and the child window
	And define methods automatically to use the windows from each other
*/

func Open_WindowAndLink cClass,oParent
	Open_Window(cClass)
	cClass = lower(cClass)
	cParentClass = classname(oParent)
	if  ( right(cClass,10) != "controller" ) or 
		( right(cParentClass,10) != "controller" )
		raise("Error in Open_WindowAndLink() the classes names must end with 'controller'")
	ok

	cClassNameWithoutController = substr(cClass,"controller","")
	cParentClassNameWithoutController = substr(cParentClass,"controller","")
	cCode = `
		# Let the parent know about the child
		if not isattribute(oParent,"n#{f1}ID")
			AddAttribute(oParent,"n#{f1}ID")
		ok
		oParent.n#{f1}ID = last_windowID()
		if not ismethod(oParent,"Is#{f1}")
			AddMethod(oParent,"Is#{f1}", func {
				return n#{f1}ID
			})
		ok
		if not ismethod(oParent,"#{f1}") 
			AddMethod(oParent,"#{f1}", func {
				return GetObjectByID(n#{f1}ID)
			})
		ok
		# Let the child know about the parent
		if not isattribute(last_window(),"n#{f2}ID")
			AddAttribute(last_window(),"n#{f2}ID")
		ok
		last_window().n#{f2}ID = oParent.ObjectID()
		if not ismethod(last_window(),"Is#{f2}")
			AddMethod(last_window(),"Is#{f2}", func {
				return n#{f2}ID
			})
		ok
		if not ismethod(last_window(),"#{f2}") 
			AddMethod(last_window(),"#{f2}", func {
				return GetObjectByID(n#{f2}ID)
			})
		ok
	`
	cCode = SubStr(cCode,"#{f1}",cClassNameWithoutController)
	cCode = SubStr(cCode,"#{f2}",cParentClassNameWithoutController)
	eval(cCode)
	


/*
	The next function return the last window created
*/

func Last_Window
	return $RingQt_ObjectsList[len($RingQt_ObjectsList)][C_RINGQT_OBJECTSLIST_OBJECT]

/*
	The next function return the ID of the last window created
*/

func Last_WindowID
	return $RingQt_ObjectsList[len($RingQt_ObjectsList)][C_RINGQT_OBJECTSLIST_ID]

/*
	The next function for using in GUI controls events
*/

func Method cMethod
	cMethod = Trim(cMethod)
	if right(cMethod,1) != ")" {
		cMethod += "()"
	}
	if $RingQt_objname != NULL {
		return $RingQt_objname+"."+cMethod
	}

/*
	The next function get the Window ID
	Then search in the Objects List to find the Window Item Position
*/

func Get_Window_Pos nID
	return find($RingQt_ObjectsList,nID,C_RINGQT_OBJECTSLIST_ID)

#END OBJECTS LIB Constants and Functions =======================================================

#START STDLIB Constants and Functions ==========================================================

# The Ring Standard Library
# Common Functions and classes for applications
# 2016-2017, Mahmoud Fayed <msfclipper@yahoo.com>
# 2016-2017, CalmoSoft <calmosoft@gmail.com>

/*
	Function Name	: puts
	Usage		: print the value then print new line (nl)
	Parameters	: the value
*/
Func Puts vvalue
	see vvalue
	see nl

/*
	Function Name	: print
	Usage		: print string - support \n \t \r \\ #{variable}
	Parameters	: the string
*/
Func Print vValue
	if isstring(vValue)
		see _Print2Str(vValue,3)
	else
		see vValue 
	ok

/*
	Function Name	: print2str
	Usage		: print to string - support \n \t \r \\ #{variable}
	Parameters	: the string
*/
Func Print2Str vValue
	# Pass Three Scopes 
	if isnumber(vValue)
		vValue = "" + vValue 
	ok
	if isstring(vValue)
		return _Print2Str(vValue,3)
	else 
		raise("Type Error : Print2Str() Accept Strings/Numbers Only!")
	ok

/*
	Function Name	: _print2str
	Usage		: Internal function - print to string 
	Parameters	: the string , Scopes to pass 
*/
Func _Print2Str vValue,nScope
	cString = ""
	for t = 1 to len(vValue)
		switch vValue[t]
		on "\"
			t++
			switch vValue[t]
			on "\"
				cString +=  "\"
			on "n"
				cString +=  nl
			on "t"
				cString +=  char(9)
			on "r" 
				cString +=  char(13)
			off
		on "#"
			if vValue[t+1] = "{"
				cVar = ""
				for r=t+2 to len(vValue)
					if vValue[r] != "}"
						cVar += vValue[r]
					else
						exit
					ok					
				next
				# Access Local Variables in the Caller
				if not find(globals(),lower(cVar))
					aMem = ringvm_memorylist()
					if len(aMem) > 1
						# -2 to avoid two scopes 
						# scope used by ringvm_memorylist() 
						# scope used by _print2str() 
						aList = aMem[len(aMem)-nScope]
						nPos = find(aList,lower(cVar),1)
						if nPos 
							cVar = "aList[nPos][3]"
						ok
					ok
				else 
					aMem = ringvm_memorylist()
					aList = aMem[1]
					nPos = find(aList,lower(cVar),1)
					if nPos 
						cVar = "aList[nPos][3]"
					ok
				ok
				cCode = "cString += " + cVar				
				eval(cCode)
				t = r
			ok
		other
			cString +=  vValue[t]
		off
	next
	return cString


/*
	Function Name	: getstring
	Usage		: get input using the keyboard
	Parameters	: no Parameters
*/
Func GetString
	Give _temp_get_string
	return _temp_get_string


/*
	Function Name	: getnumber
	Usage		: get input using the keyboard - return number
	Parameters	: no Parameters
*/
Func GetNumber
	Give _temp_get_number
	return 0 + _temp_get_number

/*
	Function Name	: apppath
	Usage		: get the path of the application folder
	Parameters	: no Parameters
*/
Func AppPath
	cfile = sysargv[2] # the main file
	update = false
	for x = len(cfile) to 1 step -1
		if cfile[x] = "\" or cfile[x] = "/"
			cfile = left(cfile,x)
			update = true
			exit
		ok
	next
	if update = true
		if cfile[1] != "/" and cfile[2] != ":"
			cpath = currentdir() + "\" + cfile
		else
			cpath = cfile
		ok
	else
		cpath = currentdir()
	ok
	if right(cpath,1) != "\" and right(cpath,1) != "/" cpath += "/" ok
	return cpath

/*
	Function Name	: JustFilePath
	Usage			: get the path of the file only - remove file name
	Parameters		: File Name
*/

func JustFilePath cFile
	for x = len(cfile) to 1 step -1
		if cfile[x] = "\" or cfile[x] = "/"
			cfile = left(cfile,x)
			return cFile
		ok
	next
	return ""

/*
	Function Name	: JustFileName
	Usage			: get the Name of the file only - remove file path
	Parameters		: File Name
*/

func JustFileName cFile
	for x = len(cfile) to 1 step -1
		if cfile[x] = "\" or cfile[x] = "/"
			cfile = substr(cfile,x+1)
			exit
		ok
	next
	return cFile 

/*
	Function Name	: value
	Usage		: create a copy from a list or object
	Parameters	: the list or the object
	output		: the new copy of the list or the object
*/
Func Value vlistorobj
	vlistorobj2 = vlistorobj
	return vlistorobj2

/*
	Function Name	: times
	Usage		: execute a Function ncount times
	Parameters	: the ncount as number and the Function Name as string
*/
Func Times ncount,f
	for x = 1 to ncount 
		call f()
	next

/*
	Function Name	: map
	Usage		: execute a Function on each list item
	Parameters	: the list and the Function as string
	output		: new list after applying the Function to each item
*/
Func Map alist,cFunc
	alist2 = alist
	for x in alist2
		x = call cFunc(x)
	next
	return alist2


/*
	Function Name	: filter
	Usage		: execute a Function on each list item to filter items
	Parameters	: the list and the Function as string
	output		: new list after filtering the items using the Function
*/
Func Filter alist,cFunc
	alist2 = []
	for x in alist
		if call cFunc(x)
			alist2 + x
		ok
	next
	return alist2


/*
	Function Name	: split
	Usage		: convert string words to list items
	Parameters	: the string to be converted , the delimiter
			: delimiter can be char of choice. Example: " "  or  ","   or  "|" 
	output		: new list 
*/

Func Split(cString, delimiter)

    doubleSpace = "  "
    singleSpace = " "
    singleTab   = char(9)
	
    if ( (delimiter = singleTab) or (delimiter = singleSpace) )
        delimiter = singleSpace
    ok

    if ( delimiter = singleSpace )
        do
            cString = substr(cstring, singleTab, singleSpace)   ### Replace Tab with Space
        again substr(cString, singleTab)

        do
            cString = substr(cString, doubleSpace, singleSpace) ### Replace DoubleSpace with Space
        again substr(cString, doubleSpace)
    ok
	
	cString = trim(cString) ### Remove leading and trailing spaces
    cStrList = str2list(substr(cString, delimiter, nl))

return cStrList

/*
	Function Name	: SplitMany
	Usage		: convert string words to list items
	Parameters	: the string to be converted , the delimiter characters
			: delimiter can be many characters written in one string or List 
	output		: new list 
*/

Func SplitMany cString,cCharacters
	for t in cCharacters
		cString = substr(cString,t,nl)
	next 
	return str2list(cString)


/*
	Function Name	: newlist
	Usage		: create a two dimensional list
	Parameters	: number of dimensions
	output		: two dimensional list 
*/

Func NewList x, y
     if isstring(x) x=0+x ok
     if isstring(y) y=0+y ok
     alist = list(x)
     for t in alist
         t = list(y)
     next
     return alist	

/*
	Function Name	: capitalized
	Usage		: return a copy with the first letter capitalized
	Parameters	: string to capitalize
	output		: capitalized string
*/

Func Capitalized str
       return substr(str,left(str,1),upper(left(str,1))) 
       
/*
	Function Name	: isspecial
	Usage		: check whether a character is special or not
	Parameters	: the character to be tested
	output		: the result of the test (0,1)
*/

Func IsSpecial char
       for c in "^'+-/\*~<>=@,%|&?!'"
           if char = c return true ok
       next
       return false 

/*
	Function Name	: isvowel
	Usage		: check whether a character is vowel or not
	Parameters	: the character to be tested
	output		: the result of the test (0,1)
*/

Func IsVowel char
       for c in "aeiou"
           if upper(char) = c return true ok
       next
       return false 
       
/*
	Function Name	: linecount
	Usage		: return the lines count in a text file.
	Parameters	: string contains the file name
	output		: the number of lines (lines count).
*/       
       
Func LineCount text
     number = 0
     fp = fopen(text,"r")
     r = fgetc(fp)
     while isstring(r)
           r = fgetc(fp)
           if r = char(10) number += 1 ok
     end
     fclose(fp)
     return number

/*
	Function Name	: factorial
	Usage		: return the factorial of a number.
	Parameters	: number for factorial.
	output		: factorial of a number.
*/

Func Factorial n if n = 0 return 1 else return n * factorial(n-1) ok

/*
	Function Name	: fibonacci
	Usage		: return the fibonacci number.
	Parameters	: number for fibonacci.
	output		: fibonacci number.
*/

Func Fibonacci n
    if n = 0 return 0 ok
    if n = 1 return 1 ok 
    if n > 1 return fibonacci(n-1) + fibonacci(n-2) ok
    
/*
	Function Name	: isprime
	Usage		: check whether a number is prime or not
	Parameters	: the number to be tested
	output		: the result of the test (0,1)
*/ 

Func IsPrime num
     if (num <= 1) return 0 ok
     if (num % 2 = 0)  and (num != 2)  return 0 ok
     for i = 3 to floor(num / 2) - 1 step 2
         if (num % i = 0) return 0 ok
     next
     return 1
     
/*
	Function Name	: sign
	Usage		: returns an integer value indicating the sign of a number.
	Parameters	: the number to be tested.
	output		: the result of the test (-1,0,1).
*/	
	
Func Sign n
     if n < 0 return -1 ok
     if n = 0 return 0 ok
     if n > 0 return 1 ok 

/*
	Function Name	: List2File
	Usage		: Write list items to text file (each item in new line).
	Parameters	: The list to be written and the file name.
	output		: No Output
*/	

Func List2File aList,cFileName
	for x in aList if isnumber(x) x = "" + x ok next
	cStr = list2str(aList)
	if iswindows() cStr = substr(cStr,nl,windowsnl()) ok
	write(cFileName,cStr)

/*
	Function Name	: File2List
	Usage		: Read text file and convert lines to list items
	Parameters	: The file name.
	output		: The new list.
*/	
Func File2List cFileName
	cStr = read(cFileName)
	aList = str2list(cStr)
	return aList

/*
	Function Name	: Endswith
	Usage		: Returns true if the given string ends with the specified substring. Trailing white spaces are ignored.
	Parameters	: The original and substring
	output		: Returns the result of search (0,1)
*/

Func Endswith str, substr
     str = trim(str)
     if right(str, len(substr)) = substr return 1 else return 0 ok 
     
/*
	Function Name	: Startwith
	Usage		: Returns true if the given string starts with the specified substring. Leading white spaces are ignored.
	Parameters	: The original and substring
	output		: Returns the result of search (0,1)
*/

Func Startswith str, substr
     str = trim(str)
     if left(str, len(substr)) = substr return 1 else return 0 ok   
     
/*
	Function Name	: Gcd
	Usage		: Finding of the greatest common divisor of two integers.
	Parameters	: Two integers for gcd.
	output		: The greatest common divisor.
*/

Func Gcd gcd, b
       while b
             c   = gcd
             gcd = b
             b   = c % b
       end
       return gcd
       
/*
	Function Name	: Lcm
	Usage		: Compute the least common multiple of two integers.
	Parameters	: Two integers to compute.
	output		: The least common multiple.
*/     

Func Lcm m,n
     lcm = m*n / gcd(m,n)
     return lcm
     
/*
	Function Name	: Sumlist
	Usage		: Compute the sum of a list of integers.
	Parameters	: List to compute
	output		: Sum of a list.
*/ 

Func Sumlist bList
     sum = 0
     for n = 1 to len(bList)
         sum += bList[n]
     next
     return sum	
     
/*
	Function Name	: Prodlist
	Usage		: Compute the product of a list of integers.
	Parameters	: List to compute
	output		: Product of a list.
*/

Func Prodlist bList
     prod = 1
     for n = 1 to len(bList)
         prod *= bList[n]
     next
     return prod
     
/*
	Function Name	: Evenorodd
	Usage		: Test whether an integer is even or odd.
	Parameters	: Integer to test.
	output		: Result of test (1=odd 2=even).
*/     

Func Evenorodd n 
     if n % 2 = 1 return 1 ok
     return 2
     
/*
	Function Name	: Factors
	Usage		: Compute the factors of a positive integer.
	Parameters	: Integer to compute.
	output		: Result of compute.
*/  

Func Factors n   
     nArray = []
     j = 0
     for i = 1 to n
         if n % i = 0 j = j + 1 add(nArray, i) ok
     next
     return nArray
     
/*
	Function Name	: Palindrome
	Usage		: Check if a sequence of characters is a palindrome or not. 
	Parameters	: Characters to check.
	output		: Result of check.
*/  

Func Palindrome aString
     bString = ""
     for i=len(aString) to 1 step -1
         bString = bString + aString[i]
     next
     if aString = bString return 1 ok
     return false
     
/*
	Function Name	: Isleapyear
	Usage		: Check whether a given year is a leap year in the Gregorian calendar. 
	Parameters	: Year to check.
	output		: Result of check.
*/

Func Isleapyear year
     if (year % 400) = 0 return true 
        but (year % 100) = 0 return false
        but (year % 4) = 0 return true
        else return false ok  
        
/*
	Function Name	: Binarydigits
	Usage		: Compute the sequence of binary digits for a given non-negative integer. 
	Parameters	: Integer to compute.
	output		: Result of compute.
*/   

Func Binarydigits a
	 cOutput = ""
     n = 0
     while pow(2,n+1) < a
           n = n + 1
     end
     for i = n to 0 step -1
         x = pow(2,i)
         if a >= x cOutput += "1" a = a - x
         else cOutput += "0" ok
     next
	 return cOutput
     
/*
	Function Name	: Matrixmulti
	Usage		: Multiply two matrices together. 
	Parameters	: Two matrices to multiply.
	output		: Result of multiply.
*/     

Func Matrixmulti A, B
	n = len(A)
	C = newlist(n,n)
	for i = 1 to n
		for j = 1 to n
			for k = 1 to n
				C[i][k] += A[i][j] * B[j][k]  
			next
		next
	next
	return C
     
/*
	Function Name	: Matrixtrans
	Usage		: Transpose an arbitrarily sized rectangular Matrix. 
	Parameters	: Two matrices to transpose.
	output		: Result of transpose.
*/     

Func Matrixtrans matrix
	rows = len(matrix)
	cols = len(matrix[1])	
	transpose = newlist(cols,rows)
	for i = 1 to cols
		for j = 1 to rows
			transpose[i][j] = matrix[j][i]             
		next         
	next
	return transpose
	 
/*
	Function Name	: Dayofweek
	Usage		: Return the day of the week of given date. (yyyy-mm-dd)
	Parameters	: Date to compute.
	output		: The day of the week.
*/

Func Dayofweek date
     year = number(substr(date,1,4))
     month = number(substr(date,6,2))
     day = number(substr(date,9,2))
     mo = [4,0,0,3,5,1,3,6,2,4,0,2]
     days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
     if year < 2100 leap = year - 1900 else leap = year - 1904 ok
     m = (((year-1900)%7) + floor(leap/4) + mo[month] + day) % 7
     switch m
            on 1 sday = days[4]
            on 2 sday = days[5]
            on 3 sday = days[6]
            on 4 sday = days[7]
            on 5 sday = days[1]
            on 6 sday = days[2]
            on 0 sday = days[3]
     off
     return sday 
     
/*
	Function Name	: Fridays
	Usage		: Fridays the 13th between start and end year.
	Parameters	: Start and end year.
	output		: Dates of Fridays on 13th.
*/  

Func Fridays year1, year2
     mo = [4,0,0,3,5,1,3,6,2,4,0,2]
     for year = year1 to year2
         if year < 2100 leap = year - 1900 else leap = year - 1904 ok
         for month = 1 to 12
             m = (((year-1900)%7) + floor(leap/4) + mo[month] + 13) % 7
             if month < 10 smonth = "0" + month ok
             if m = 2 see "" + year + "-" + smonth + "-" + "13 is friday" + nl ok
         next
     next
     
/*
	Function Name	: Permutation
	Usage		: Generates all permutations of n different numerals.
	Parameters	: List of numerals to generate.
	output		: Permutations of numerals.
*/     

Func Permutation a
       elementcount = len(a)
       if elementcount < 1 then return ok
       pos = elementcount-1
       while a[pos] >= a[pos+1] 
               pos -= 1
               if pos <= 0 permutationReverse(a, 1, elementcount)
                  return ok
       end
       last = elementcount
       while a[last] <= a[pos]
               last -= 1
       end
       temp = a[pos]
       a[pos] = a[last]
       a[last] = temp
       permutationReverse(a, pos+1, elementcount)

Func permutationReverse a, first, last
        while first < last
                 temp = a[first]
                 a[first] = a[last]
                 a[last] = temp
                 first += 1
                 last -= 1
        end
   
/*
	Function Name	: Sleep
	Usage		: Sleep for the given amount of time.
	Parameters	: Time for sleep.
	output		: Result of sleeping.
*/          
     
Func Sleep x
	nTime = x * C_SECONDSIZE
	nClock = clock()
	while clock() - nClock < nTime end
     
/*
	Function Name	: Readline
	Usage		: Read a file line by line.
	Parameters	: File to read.
	output		: Result of reading.
*/      
      
Func Readline fp
	if not feof(fp) 
		r = fgets(fp,C_LINESIZE) 
		if r != NULL Return r ok
	ok


/*
	Function Name	: IsMainSourceFile
	Usage		: Check if the current file is the main source file
	Parameters	: No Paramters 
	output		: True/False 
*/      
Func IsMainSourceFile
        # Check for Mobile
                cPrev = PrevFileName()
                if lower(JustFileName(cPrev)) = lower(JustFileName($cMainSourceFile))
			return True
		ok	
	if len(sysargv) >= 2
		if PrevFileName() = substr(sysargv[2],"ringo","ring")
			return true
		ok
	else    # We are using Ring2EXE and we have executable code 
		if Prevfilename() = substr(ringvm_fileslist()[1],"ringo","ring")
			return true 
		ok
	ok
	return false

/*
	Function Name	: Substring
	Usage		: Return a position of a substring starting from a given position in a string.
	Parameters	: String, substring, position. 
	output		: Position of substring. 
*/  	
func Substring str,substr,n
       newstr=right(str,len(str)-n+1)
       nr = substr(newstr, substr)
       return n + nr -1
       
/*
	Function Name	: Changestring
	Usage		: Change substring from given position for given position with a substring.
	Parameters	: Original string, position, length, substring
	output		: Result string. 
*/         
func Changestring text, pos1, pos2, str
       string = left(text,pos1-1) + str + substr(text, pos2+1)
       return string


/*
	Function Name	: DirExists
	Usage		: Check if directory exists
	Parameters	: Path
	output		: True/False
*/         

Func DirExists cDir
	try
		dir(cDir)
		return true
	catch
		return false
	done


/*
	Function Name	: MakeDir
	Usage		: Make Directory
	Parameters	: Directory Name
*/         

Func MakeDir cFolder
	if iswindows()
		SystemSilent("mkdir " + cFolder)
	else 
		# -p :  parents, will also create all directories leading up to the given directory that do not exist already. 
		#       If the given directory already exists, ignore the error.
		SystemSilent("mkdir -p " + cFolder)
	ok
	
/*
	Function Name	: sortFirstSecond
	Usage		: Sort a list on first or second index
	Parameters	: list to sort
	output          : sorted list 
*/ 

Func sortFirstSecond aList, ind
        aList = sort(aList,ind)
        for n=1 to len(alist)-1
             for m=n to len(aList)-1 
                   if ind = 1 nr = 2 else nr = 1 ok
                   if alist[m+1][ind] = alist[m][ind] and alist[m+1][nr] < alist[m][nr]
                      temp = alist[m+1]
                      alist[m+1] = alist[m]
                      alist[m] = temp ok
             next
       next
       return aList

Func Fsize(fh)
	Fseek(fh,0,2)
	size = Ftell(fh)
	Fseek(fh,0,0)
	return size

/*------------
 + EpochTime()
 + Example:  EpochSec = EpochTime( Date(), Time() )
 + Format:   EpochSec = EpochTime( "15/07/2016", "10:15:30" )
 + Output:   EpochSec = 1468577730
 +------------
*/

Func EpochTime(Date, Time)

    arrayDate = split(Date, "/")
    arrayTime = split(Time, ":")

    Year = arrayDate[3] ; Month  = arrayDate[2] ; Day    = arrayDate[1]
    Hour = arrayTime[1] ; Minute = arrayTime[2] ; Second = arrayTime[3]

    cDate1    = Day +"/"+ Month +"/"+ Year
    cDate2    = "01/01/" + Year
    DayOfYear = DiffDays( cDate1, cDate2)

    ### Formula
    tm_sec  = Second    * 1
    tm_min  = Minute    * 60
    tm_hour = Hour      * 3600
    tm_yday = DayOfYear * 86400
    tm_year = Year      - 1900

    tm_year1 =         ( tm_year -  70)          * 31536000
    tm_year2 = ( floor(( tm_year -  69) /   4 )) * 86400
    tm_year3 = ( floor(( tm_year -   1) / 100 )) * 86400
    tm_year4 = ( floor(( tm_year + 299) / 400 )) * 86400

    ### Result
    EpochSec = tm_sec + tm_min + tm_hour + tm_yday + tm_year1 + tm_year2 - tm_year3 + tm_year4

return EpochSec

Func TrimLeft(cStr)
  $tab   = char(09)
  $space = char(32)
  index  = 1
      while cStr[index] = $space or cStr[index] = $tab
            index++
      end  
  cStr = substr(cStr, index, len(cStr) - index + 1)
return cStr     


Func TrimRight(cStr)
  $tab   = char(09)
  $space = char(32)
  index  = len(cStr)
      while cStr[index] = $space or cStr[index] = $tab
            index--
      end    
  cStr = substr(cStr, 1, index)
return cStr     


Func TrimAll(cStr)
  $tab   = char(09)
  $space = char(32)
  $empty = ""
    cStr = substr(cStr, $space, $empty)
    cStr = substr(cStr, $tab,   $empty)
return cStr

/*
   Remove NewLine chars
*/

Func chomp(cStr)
   cStr = substr(cStr, nl, "" )
return cStr


/*
   SystemCmd() outputs to Variable
   Example: cYou = SystemCmd("whoami")
   See "SystemCmd: whoami ====="+ nl + cYou +nl
*/

Func SystemCmd(cmd)
   System(cmd + "> cmd.txt")
   cStr = read("cmd.txt")
return cStr

/*
	Get a List of all files in a directory and it's sub directories 
	Parameters : Path as String
					  Extension as String, example "ring"
	Output : List contains the files only 
	Note : (1) Each sub directory will be opened 
			 (2) if the extension is empty, all files will be included

	Examples
			aList = ListAllFiles("b:/ring/ringlibs","ring") # *.ring only
			aList = sort(aList)
			see aList
	Example 
			load "stdlib.ring"
			see listallfiles("b:/ring/ringlibs/weblib","") # All Files
*/

func ListAllFiles cPath,cExt
	if left(cExt,2) = "*."
		cExt = substr(cExt,3)
	ok
	aList = dir(cPath)
	return ListAllFiles_process(cPath,aList,cExt)

func ListAllFiles_Process cPath,aList,cExt
	aOutput = []
	for aSub in aList 
		if aSub[2] # Directory
			cNewPath = cPath + "/" + aSub[1]
			aSubOutput = listAllFiles(cNewPath,cExt)
			for item in aSubOutput 
				aOutput + item
			next
		else		# File
			if cExt != NULL
				if right(aSub[1],len(cExt)+1) = "."+cExt 
					aOutput + ( cPath + "/" + aSub[1] )
				ok
			else
				aOutput + ( cPath + "/" + aSub[1] )
			ok
		ok
	next
	return aOutput

/*
	Function Name	: SystemSilent
	Usage 		: Execute system command without displaying the output 
	Parameters   	: Command as String 
	Output		: None
*/

func SystemSilent cCmd
	if isWindows()
		system(cCmd + C_WINDOWS_NOOUTPUTNOERROR)
	else 
		system(cCmd + C_LINUX_NOOUTPUTNOERROR)
	ok


/*
	Create folder then change the current folder to this new folder 
*/
func OSCreateOpenFolder cFolder
	MakeDir(cFolder)
	chdir(cFolder)

/*
	Copy folder to the current folder 
	Parameters : The path to the parent folder of the Source  and the folder name
*/

func OSCopyFolder cParentFolder,cFolder
	cCurrentFolder = currentdir()
	OSCreateOpenFolder(cFolder)
	if isWindows()
		systemsilent("copy " + cParentFolder + cFolder)
	else 
		systemsilent("cp -R " + cParentFolder + cFolder + " ./")
	ok
	chdir(cCurrentFolder)

/*
	Delete Folder in the current Directory
*/

func OSDeleteFolder cFolder 
	if isWindows() 
		systemSilent("rd /s /q " + cFolder)
	else
		systemSilent("rm -r " + cFolder)
	ok

/*
	Copy File to the current directory
*/
func OSCopyFile cFile
	if isWindows()
		cFile = substr(cFile,"/","\")
		systemSilent("copy " + cFile)
	else 
		systemSilent("cp " + cFile + " .")
	ok

/*
	Delete file 
*/

func OSDeleteFile cFile
	if isWindows() 
		systemSilent("del " + cFile)
	else 
		systemSilent("rm " + cFile)
	ok

/*
	Rename File 
*/
func OSRenameFile cOldFile,cNewFile
	if isWindows()
		systemSilent("rename " + cOldFile + " " + cNewFile)
	but isLinux() or isMacosx()
		systemSilent("mv " + cOldFile + " " + cNewFile)
	ok


#END STDLIB Constants and Functions ==========================================================

#START ObjectsLib Classes ====================================================================

/*
	The next class is the parent class for Windows/Forms Classes
	When you create a new class, just use from WindowsBase
	When you close the window just use Super.Close()
*/

class WindowsControllerBase from ObjectsLibParent

	func Close
		nPos = Get_Window_Pos(RingQt_nID)
		del($RingQt_ObjectsList,nPos)

	func ObjectID
		return RingQt_nID

class ObjectsLibParent

	RingQt_nID = $RingQt_ObjectID

	RingQt_nParentID=0		# Parent Object ID 

	func Method cMethod 
		cMethod = Trim(cMethod)
		if right(cMethod,1) != ")" {
			cMethod += "()"
		}
		cRingQt_ObjName = "$RingQt_ObjectsList[Get_Window_Pos("+RingQt_nID+")]" +
			 "[C_RINGQT_OBJECTSLIST_OBJECT]"
		return cRingQt_objname+"."+cMethod

	func setParentObject oParent
		RingQt_nParentID = oParent.ObjectID()

	func Parent
		return GetObjectByID(RingQt_nParentID)

	func IsParent
		return RingQt_nParentID

	func GetObjectByID nID
		nPos = Get_Window_Pos(nID)
		return $RingQt_ObjectsList[nPos][C_RINGQT_OBJECTSLIST_OBJECT]


/*
**	Project : RingQt - Objects Library
**	File Purpose : Windows Controller Class Parent
**	Date : 2016.12.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class WindowsControllerParent from WindowsControllerBase

	func Start		
		oView.win.Show()

	func CloseAction
		oView.Close()
		Super.Close()

class WindowsViewParent from ObjectsLibParent
	func Close
		win.close()


#END ObjectsLib Classes ==================================================================================
