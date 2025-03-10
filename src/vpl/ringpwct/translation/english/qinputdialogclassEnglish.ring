/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qinputdialogclass Component
**	Date : 2021.08.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

T_CT_QINPUTDIALOGCLASS_IP_TITLE = "QInputDialog Class Component"
T_CT_QINPUTDIALOGCLASS_IP_VALUE = "Object"
T_CT_QINPUTDIALOGCLASS_IP_VALUE2 = "Method"
T_CT_QINPUTDIALOGCLASS_IP_VALUE2LIST = [
	"accept(void) --> void",
	"acceptDrops(void) --> bool",
	"accessibleDescription(void) --> QString",
	"accessibleName(void) --> QString",
	"activateWindow(void) --> void",
	"addAction(QAction *action) --> void",
	"adjustSize(void) --> void",
	"autoFillBackground(void) --> bool",
	"backgroundRole(void) --> int",
	"baseSize(void) --> QSize",
	"blockSignals(bool block) --> bool",
	"cancelButtonText(void) --> QString",
	"childAt(int x, int y) --> QWidget",
	"children(void) --> QObjectList",
	"childrenRect(void) --> QRect",
	"childrenRegion(void) --> QRegion",
	"clearFocus(void) --> void",
	"clearMask(void) --> void",
	"close(void) --> bool",
	"comboBoxItems(void) --> QStringList",
	"contentsMargins(void) --> QMargins",
	"contentsRect(void) --> QRect",
	"contextMenuPolicy(void) --> int",
	"createWindowContainer(QWindow *window, QWidget *parent, Qt::WindowFlags flags) --> QWidget",
	"cursor(void) --> QCursor",
	"delete(void) --> void",
	"deleteLater(void) --> void",
	"donedialog(int r) --> void",
	"doubleDecimals(void) --> int",
	"doubleMaximum(void) --> double",
	"doubleMinimum(void) --> double",
	"doubleValue(void) --> double",
	"dumpObjectInfo(void) --> void",
	"dumpObjectTree(void) --> void",
	"effectiveWinId(void) --> int",
	"ensurePolished(void) --> void",
	"exec(void) --> int",
	"find(int id) --> QWidget",
	"focusPolicy(void) --> int",
	"focusProxy(void) --> QWidget",
	"focusWidget(void) --> QWidget",
	"font(void) --> QFont",
	"fontInfo(void) --> QFontInfo",
	"foregroundRole(void) --> int",
	"frameGeometry(void) --> QRect",
	"frameSize(void) --> QSize",
	"geometry(void) --> QRect",
	"getContentsMargins(int *left, int *top, int *right, int *bottom) --> void",
	"getDouble(QWidget *parent,QString,QString, double value, double min, double max , int decimals, bool *ok, Qt::WindowType flags) --> double",
	"getInt(QWidget *parent,QString,QString, int value, int min, int max, int step, bool *ok, Qt::WindowType flags) --> int",
	"grab(QRect) --> QPixmap",
	"grabGesture(Qt::GestureType gesture, Qt::GestureFlag flags) --> void",
	"grabKeyboard(void) --> void",
	"grabMouse(void) --> void",
	"grabShortcut(QKeySequence , Qt::ShortcutContext context) --> int",
	"graphicsEffect(void) --> QGraphicsEffect",
	"graphicsProxyWidget(void) --> QGraphicsProxyWidget",
	"hasFocus(void) --> bool",
	"hasMouseTracking(void) --> bool",
	"height(void) --> int",
	"heightForWidth(int w) --> int",
	"hide(void) --> void",
	"inherits(char *className) --> bool",
	"init(parent) --> object",
	"inputMethodHints(void) --> int",
	"inputMethodQuery(Qt::InputMethodQuery query) --> QVariant",
	"inputMode(void) --> int",
	"insertAction(QAction *before, QAction *action) --> void",
	"installEventFilter(QObject *filterObj) --> void",
	"intMaximum(void) --> int",
	"intMinimum(void) --> int",
	"intStep(void) --> int",
	"intValue(void) --> int",
	"isActiveWindow(void) --> bool",
	"isAncestorOf(QWidget *child) --> bool",
	"isComboBoxEditable(void) --> bool",
	"isEnabled(void) --> bool",
	"isEnabledTo(QWidget *ancestor) --> bool",
	"isFullScreen(void) --> bool",
	"isHidden(void) --> bool",
	"isMaximized(void) --> bool",
	"isMinimized(void) --> bool",
	"isModal(void) --> bool",
	"isSizeGripEnabled(void) --> bool",
	"isVisible(void) --> bool",
	"isVisibleTo(QWidget *ancestor) --> bool",
	"isWidgetType(void) --> bool",
	"isWindow(void) --> bool",
	"isWindowModified(void) --> bool",
	"keyboardGrabber(void) --> QWidget",
	"killTimer(int id) --> void",
	"labelText(void) --> QString",
	"layout(void) --> QLayout",
	"layoutDirection(void) --> int",
	"locale(void) --> QLocale",
	"lower(void) --> void",
	"mapFrom(QWidget *parent, QPoint) --> QPoint",
	"mapFromGlobal(QPoint) --> QPoint",
	"mapFromParent(QPoint) --> QPoint",
	"mapTo(QWidget *parent, QPoint) --> QPoint",
	"mapToGlobal(QPoint pos) --> QPoint",
	"mapToParent(QPoint pos) --> QPoint",
	"mask(void) --> QRegion",
	"maximumHeight(void) --> int",
	"maximumSize(void) --> QSize",
	"maximumWidth(void) --> int",
	"minimumHeight(void) --> int",
	"minimumSize(void) --> QSize",
	"minimumWidth(void) --> int",
	"mouseGrabber(void) --> QWidget",
	"move(int x, int y) --> void",
	"moveToThread(QThread *targetThread) --> void",
	"nativeParentWidget(void) --> QWidget",
	"nextInFocusChain(void) --> QWidget",
	"normalGeometry(void) --> QRect",
	"objectName(void) --> QString",
	"objectpointer(void) --> pointer",
	"okButtonText(void) --> QString",
	"open(QObject *receiver, char *member) --> void",
	"options(void) --> int",
	"overrideWindowFlags(Qt::WindowType flags) --> void",
	"palette(void) --> QPalette",
	"parent(void) --> QObject",
	"parentWidget(void) --> QWidget",
	"pos(void) --> QPoint",
	"previousInFocusChain(void) --> QWidget",
	"property(char *name) --> QVariant",
	"raise(void) --> void",
	"rect(void) --> QRect",
	"reject(void) --> void",
	"releaseKeyboard(void) --> void",
	"releaseMouse(void) --> void",
	"releaseShortcut(int id) --> void",
	"removeAction(QAction *action) --> void",
	"removeEventFilter(QObject *obj) --> void",
	"render(QPaintDevice *target, QPoint,QRegion, QWidget::RenderFlag) --> void",
	"repaint(void) --> void",
	"resize(int w, int h) --> void",
	"restoreGeometry(QByteArray) --> bool",
	"result(void) --> int",
	"saveGeometry(void) --> QByteArray",
	"scroll(int dx, int dy) --> void",
	"setAcceptDrops(bool on) --> void",
	"setAccessibleDescription(QString) --> void",
	"setAccessibleName(QString) --> void",
	"setAttribute(Qt::WidgetAttribute attribute, bool on) --> void",
	"setAutoFillBackground(bool enabled) --> void",
	"setBackgroundRole(QPalette::ColorRole role) --> void",
	"setBaseSize(int basew, int baseh) --> void",
	"setCancelButtonText(QString) --> void",
	"setComboBoxEditable(bool editable) --> void",
	"setComboBoxItems(QStringList) --> void",
	"setContentsMargins(int left, int top, int right, int bottom) --> void",
	"setContextMenuPolicy(Qt::ContextMenuPolicy policy) --> void",
	"setCursor(QCursor) --> void",
	"setDisabled(bool disable) --> void",
	"setDoubleDecimals(int decimals) --> void",
	"setDoubleMaximum(double max) --> void",
	"setDoubleMinimum(double min) --> void",
	"setDoubleRange(double min, double max) --> void",
	"setDoubleValue(double value) --> void",
	"setEnabled(bool) --> void",
	"setFixedHeight(int h) --> void",
	"setFixedSize(int w, int h) --> void",
	"setFixedWidth(int w) --> void",
	"setFocus(Qt::FocusReason reason) --> void",
	"setFocusPolicy(Qt::FocusPolicy policy) --> void",
	"setFocusProxy(QWidget *w) --> void",
	"setFont(QFont) --> void",
	"setForegroundRole(QPalette::ColorRole role) --> void",
	"setGeometry(int x, int y, int w, int h) --> void",
	"setGraphicsEffect(QGraphicsEffect *effect) --> void",
	"setHidden(bool hidden) --> void",
	"setInputMethodHints(Qt::InputMethodHint hints) --> void",
	"setInputMode(QInputDialog::InputMode mode) --> void",
	"setIntMaximum(int max) --> void",
	"setIntMinimum(int min) --> void",
	"setIntRange(int min, int max) --> void",
	"setIntStep(int step) --> void",
	"setIntValue(int value) --> void",
	"setLabelText(QString) --> void",
	"setLayout(QLayout *layout) --> void",
	"setLayoutDirection(Qt::LayoutDirection direction) --> void",
	"setLocale(QLocale) --> void",
	"setMask(QBitmap) --> void",
	"setMaximumHeight(int maxh) --> void",
	"setMaximumSize(int maxw, int maxh) --> void",
	"setMaximumWidth(int maxw) --> void",
	"setMinimumHeight(int minh) --> void",
	"setMinimumSize(int minw, int minh) --> void",
	"setMinimumWidth(int minw) --> void",
	"setModal(bool modal) --> void",
	"setMouseTracking(bool enable) --> void",
	"setObjectName(QString) --> void",
	"setOkButtonText(QString) --> void",
	"setOption(QInputDialog::InputDialogOption option, bool on) --> void",
	"setOptions(QInputDialog::InputDialogOption options) --> void",
	"setPalette(QPalette) --> void",
	"setParent(QWidget *parent) --> void",
	"setProperty(char *name, QVariant) --> bool",
	"setProperty_2(char *name, int) --> bool",
	"setProperty_3(char *name, float) --> bool",
	"setProperty_4(char *name, double) --> bool",
	"setProperty_5(char *name, QString) --> bool",
	"setProperty_double(char *name, double) --> bool",
	"setProperty_float(char *name, float) --> bool",
	"setProperty_int(char *name, int) --> bool",
	"setProperty_string(char *name, QString) --> bool",
	"setResult(int i) --> void",
	"setShortcutAutoRepeat(int id, bool enable) --> void",
	"setShortcutEnabled(int id, bool enable) --> void",
	"setSizeGripEnabled(bool) --> void",
	"setSizeIncrement(int w, int h) --> void",
	"setSizePolicy(QSizePolicy::Policy horizontal, QSizePolicy::Policy vertical) --> void",
	"setStatusTip(QString) --> void",
	"setStyle(QStyle *style) --> void",
	"setStyleSheet(QString) --> void",
	"setTabOrder(QWidget *first, QWidget *second) --> void",
	"setTextEchoMode(QLineEdit::EchoMode mode) --> void",
	"setTextValue(QString) --> void",
	"setToolTip(QString) --> void",
	"setUpdatesEnabled(bool enable) --> void",
	"setWhatsThis(QString) --> void",
	"setWindowFilePath(QString) --> void",
	"setWindowFlags(Qt::WindowType type) --> void",
	"setWindowIcon(QIcon) --> void",
	"setWindowIconText(QString) --> void",
	"setWindowModality(Qt::WindowModality windowModality) --> void",
	"setWindowModified(bool) --> void",
	"setWindowOpacity(double level) --> void",
	"setWindowRole(QString) --> void",
	"setWindowState(Qt::WindowState windowState) --> void",
	"setWindowTitle(QString) --> void",
	"show(void) --> void",
	"showFullScreen(void) --> void",
	"showMaximized(void) --> void",
	"showMinimized(void) --> void",
	"showNormal(void) --> void",
	"signalsBlocked(void) --> bool",
	"size(void) --> QSize",
	"sizeIncrement(void) --> QSize",
	"sizePolicy(void) --> QSizePolicy",
	"stackUnder(QWidget *w) --> void",
	"startTimer(int interval) --> int",
	"statusTip(void) --> QString",
	"style(void) --> QStyle",
	"styleSheet(void) --> QString",
	"testAttribute(Qt::WidgetAttribute attribute) --> bool",
	"testOption(QInputDialog::InputDialogOption option) --> bool",
	"textEchoMode(void) --> int",
	"textValue(void) --> QString",
	"thread(void) --> QThread",
	"toolTip(void) --> QString",
	"underMouse(void) --> bool",
	"ungrabGesture(Qt::GestureType gesture) --> void",
	"unsetCursor(void) --> void",
	"unsetLayoutDirection(void) --> void",
	"unsetLocale(void) --> void",
	"update(int x, int y, int w, int h) --> void",
	"updateGeometry(void) --> void",
	"updatesEnabled(void) --> bool",
	"visibleRegion(void) --> QRegion",
	"whatsThis(void) --> QString",
	"width(void) --> int",
	"window(void) --> QWidget",
	"windowFilePath(void) --> QString",
	"windowFlags(void) --> int",
	"windowHandle(void) --> QWindow",
	"windowIcon(void) --> QIcon",
	"windowIconText(void) --> QString",
	"windowModality(void) --> int",
	"windowOpacity(void) --> double",
	"windowRole(void) --> QString",
	"windowState(void) --> int",
	"windowTitle(void) --> QString",
	"windowType(void) --> int",
	"winId(void) --> int",
	"x(void) --> int",
	"y(void) --> int"
]
T_CT_QINPUTDIALOGCLASS_IP_VALUE3 = "Parameters"
T_CT_QINPUTDIALOGCLASS_IP_VALUE4 = "Output"
T_CT_QINPUTDIALOGCLASS_IP_VALUE2FUNC = [
	"accept",
	"acceptdrops",
	"accessibledescription",
	"accessiblename",
	"activatewindow",
	"addaction",
	"adjustsize",
	"autofillbackground",
	"backgroundrole",
	"basesize",
	"blocksignals",
	"cancelbuttontext",
	"childat",
	"children",
	"childrenrect",
	"childrenregion",
	"clearfocus",
	"clearmask",
	"close",
	"comboboxitems",
	"contentsmargins",
	"contentsrect",
	"contextmenupolicy",
	"createwindowcontainer",
	"cursor",
	"delete",
	"deletelater",
	"donedialog",
	"doubledecimals",
	"doublemaximum",
	"doubleminimum",
	"doublevalue",
	"dumpobjectinfo",
	"dumpobjecttree",
	"effectivewinid",
	"ensurepolished",
	"exec",
	"find",
	"focuspolicy",
	"focusproxy",
	"focuswidget",
	"font",
	"fontinfo",
	"foregroundrole",
	"framegeometry",
	"framesize",
	"geometry",
	"getcontentsmargins",
	"getdouble",
	"getint",
	"grab",
	"grabgesture",
	"grabkeyboard",
	"grabmouse",
	"grabshortcut",
	"graphicseffect",
	"graphicsproxywidget",
	"hasfocus",
	"hasmousetracking",
	"height",
	"heightforwidth",
	"hide",
	"inherits",
	"init",
	"inputmethodhints",
	"inputmethodquery",
	"inputmode",
	"insertaction",
	"installeventfilter",
	"intmaximum",
	"intminimum",
	"intstep",
	"intvalue",
	"isactivewindow",
	"isancestorof",
	"iscomboboxeditable",
	"isenabled",
	"isenabledto",
	"isfullscreen",
	"ishidden",
	"ismaximized",
	"isminimized",
	"ismodal",
	"issizegripenabled",
	"isvisible",
	"isvisibleto",
	"iswidgettype",
	"iswindow",
	"iswindowmodified",
	"keyboardgrabber",
	"killtimer",
	"labeltext",
	"layout",
	"layoutdirection",
	"locale",
	"lower",
	"mapfrom",
	"mapfromglobal",
	"mapfromparent",
	"mapto",
	"maptoglobal",
	"maptoparent",
	"mask",
	"maximumheight",
	"maximumsize",
	"maximumwidth",
	"minimumheight",
	"minimumsize",
	"minimumwidth",
	"mousegrabber",
	"move",
	"movetothread",
	"nativeparentwidget",
	"nextinfocuschain",
	"normalgeometry",
	"objectname",
	"objectpointer",
	"okbuttontext",
	"open",
	"options",
	"overridewindowflags",
	"palette",
	"parent",
	"parentwidget",
	"pos",
	"previousinfocuschain",
	"property",
	"raise",
	"rect",
	"reject",
	"releasekeyboard",
	"releasemouse",
	"releaseshortcut",
	"removeaction",
	"removeeventfilter",
	"render",
	"repaint",
	"resize",
	"restoregeometry",
	"result",
	"savegeometry",
	"scroll",
	"setacceptdrops",
	"setaccessibledescription",
	"setaccessiblename",
	"setattribute",
	"setautofillbackground",
	"setbackgroundrole",
	"setbasesize",
	"setcancelbuttontext",
	"setcomboboxeditable",
	"setcomboboxitems",
	"setcontentsmargins",
	"setcontextmenupolicy",
	"setcursor",
	"setdisabled",
	"setdoubledecimals",
	"setdoublemaximum",
	"setdoubleminimum",
	"setdoublerange",
	"setdoublevalue",
	"setenabled",
	"setfixedheight",
	"setfixedsize",
	"setfixedwidth",
	"setfocus",
	"setfocuspolicy",
	"setfocusproxy",
	"setfont",
	"setforegroundrole",
	"setgeometry",
	"setgraphicseffect",
	"sethidden",
	"setinputmethodhints",
	"setinputmode",
	"setintmaximum",
	"setintminimum",
	"setintrange",
	"setintstep",
	"setintvalue",
	"setlabeltext",
	"setlayout",
	"setlayoutdirection",
	"setlocale",
	"setmask",
	"setmaximumheight",
	"setmaximumsize",
	"setmaximumwidth",
	"setminimumheight",
	"setminimumsize",
	"setminimumwidth",
	"setmodal",
	"setmousetracking",
	"setobjectname",
	"setokbuttontext",
	"setoption",
	"setoptions",
	"setpalette",
	"setparent",
	"setproperty",
	"setproperty_2",
	"setproperty_3",
	"setproperty_4",
	"setproperty_5",
	"setproperty_double",
	"setproperty_float",
	"setproperty_int",
	"setproperty_string",
	"setresult",
	"setshortcutautorepeat",
	"setshortcutenabled",
	"setsizegripenabled",
	"setsizeincrement",
	"setsizepolicy",
	"setstatustip",
	"setstyle",
	"setstylesheet",
	"settaborder",
	"settextechomode",
	"settextvalue",
	"settooltip",
	"setupdatesenabled",
	"setwhatsthis",
	"setwindowfilepath",
	"setwindowflags",
	"setwindowicon",
	"setwindowicontext",
	"setwindowmodality",
	"setwindowmodified",
	"setwindowopacity",
	"setwindowrole",
	"setwindowstate",
	"setwindowtitle",
	"show",
	"showfullscreen",
	"showmaximized",
	"showminimized",
	"shownormal",
	"signalsblocked",
	"size",
	"sizeincrement",
	"sizepolicy",
	"stackunder",
	"starttimer",
	"statustip",
	"style",
	"stylesheet",
	"testattribute",
	"testoption",
	"textechomode",
	"textvalue",
	"thread",
	"tooltip",
	"undermouse",
	"ungrabgesture",
	"unsetcursor",
	"unsetlayoutdirection",
	"unsetlocale",
	"update",
	"updategeometry",
	"updatesenabled",
	"visibleregion",
	"whatsthis",
	"width",
	"window",
	"windowfilepath",
	"windowflags",
	"windowhandle",
	"windowicon",
	"windowicontext",
	"windowmodality",
	"windowopacity",
	"windowrole",
	"windowstate",
	"windowtitle",
	"windowtype",
	"winid",
	"x",
	"y"
]
T_CT_QINPUTDIALOGCLASS_IP_VALUE2STEPFUNC = T_CT_QINPUTDIALOGCLASS_IP_VALUE2FUNC