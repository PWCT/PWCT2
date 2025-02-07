#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  Auto-complete
#**	Date : 2019.10.21
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class AutoComplete
	lAddCommonStrings = True
	lAddLanguageItems = True
	lAddRingFunctions = True
	oList = new qStringList()
	AddDefaultItems()
	nSize = oList.count()
	lSupportAutoComplete = True
	if PWCTIsMobile(:AutoComplete) { 
		lSupportAutoComplete = False
	} 
	func AddDefaultItems  { 
		#Add Common Strings
		if lAddCommonStrings { 
			AddCommonStrings()
		} 
		#Add GUI Items
		if lAddLanguageItems { 
			AddLanguageItems()
		} 
		#Add Constants
		#Add Ring Functions
		AddConstants()
		if lAddRingFunctions { 
			AddFunctions()
		} 
	} 
	func AddCommonStrings  { 
		AddItems(["Hello","World","Welcome","Enter","your","name","What","is","zero","one","two","three","four","five","six","seven","eight","nine","ten","True","False","nX","nY","nZ","cName"])
	} 
	func AddLanguageItems  { 
		AddItems(["oView","oView {}","self","this"])
	} 
	func AddConstants  { 
		cConstants = "qt_alignleft
		qt_alignright
		qt_alignhcenter
		qt_alignjustify
		qt_aligntop
		qt_alignbottom
		qt_alignvcenter
		qmessagebox_ok
		qmessagebox_open
		qmessagebox_save
		qmessagebox_cancel
		qmessagebox_close
		qmessagebox_discard
		qmessagebox_apply
		qmessagebox_reset
		qmessagebox_restoredefaults
		qmessagebox_help
		qmessagebox_saveall
		qmessagebox_yes
		qmessagebox_yestoall
		qmessagebox_no
		qmessagebox_notoall
		qmessagebox_abort
		qmessagebox_retry
		qmessagebox_ignore
		qmessagebox_nobutton
		qt_widget
		qt_window
		qt_dialog
		qt_sheet
		qt_drawer
		qt_popup
		qt_tool
		qt_tooltip
		qt_splashscreen
		qt_desktop
		qt_subwindow
		qt_foreignwindow
		qt_coverwindow
		qt_customizewindowhint
		qt_windowtitlehint
		qt_windowsystemmenuhint
		qt_windowminimizebuttonhint
		qt_windowmaximizebuttonhint
		qt_windowminmaxbuttonshint
		qt_windowclosebuttonhint
		qt_windowcontexthelpbuttonhint
		qt_macwindowtoolbarbuttonhint
		qt_windowfullscreenbuttonhint
		qt_bypassgraphicsproxywidget
		qt_windowshadebuttonhint
		qt_windowstaysontophint
		qt_windowstaysonbottomhint
		qt_windowokbuttonhint
		qt_windowcancelbuttonhint
		qt_windowtransparentforinput
		qt_windowoverridessystemgestures
		qt_windowdoesnotacceptfocus
		qt_maximizeusingfullscreengeometryhint
		qt_windowtype_mask
		qt_unchecked
		qt_partiallychecked
		qt_checked
		qdockwidget_docwidgetclosable
		qdockwidget_dockwidgetmovable
		qdockwidget_dockwidgetfloatable
		qdockwidget_dockwidgetverticaltitlebar
		qdockwidget_alldockwidgetfeatures
		qdockwidget_nodockwidgetfeatures
		qtextedit_nowrap
		qtextedit_widgetwidth
		qtextedit_fixedpixelwidth
		qtextedit_fixedcolumnwidth
		qt_leftdockwidgetarea
		qt_rightdockwidgetarea
		qt_topdockwidgetarea
		qt_bottomdockwidgetarea
		qt_nodockwidgetarea
		qt_horizontal
		qt_vertical
		qabstractitemview_selectitems
		qabstractitemview_selectrows
		qabstractitemview_selectcolumns
		qframe_plain
		qframe_raised
		qframe_sunken
		qframe_noframe
		qframe_box
		qframe_panel
		qframe_styledpanel
		qframe_hline
		qframe_vline
		qframe_winpanel
		qt_wa_acceptdrops
		qt_wa_alwaysshowtooltips
		qt_wa_contentspropagated
		qt_wa_customwhatsthis
		qt_wa_deleteonclose
		qt_wa_disabled
		qt_wa_dontshowonscreen
		qt_wa_forcedisabled
		qt_wa_forceupdatesdisabled
		qt_wa_groupleader
		qt_wa_hover
		qt_wa_inputmethodenabled
		qt_wa_keyboardfocuschange
		qt_wa_keycompression
		qt_wa_layoutonentirerect
		qt_wa_layoutuseswidgetrect
		qt_wa_macnoclickthrough
		qt_wa_macopaquesizegrip
		qt_wa_macshowfocusrect
		qt_wa_macnormalsize
		qt_wa_macsmallsize
		qt_wa_macminisize
		qt_wa_macvariablesize
		qt_wa_macbrushedmetal
		qt_wa_mapped
		qt_wa_mousenomask
		qt_wa_mousetracking
		qt_wa_moved
		qt_wa_mswindowsusedirect3d
		qt_wa_nochildeventsforparent
		qt_wa_nochildeventsfromchildren
		qt_wa_nomousereplay
		qt_wa_nomousepropagation
		qt_wa_transparentformouseevents
		qt_wa_nosystembackground
		qt_wa_opaquepaintevent
		qt_wa_outsidewsrange
		qt_wa_paintonscreen
		qt_wa_paintunclipped
		qt_wa_pendingmoveevent
		qt_wa_pendingresizeevent
		qt_wa_quitonclose
		qt_wa_resized
		qt_wa_righttoleft
		qt_wa_setcursor
		qt_wa_setfont
		qt_wa_setpalette
		qt_wa_setstyle
		qt_wa_showmodal
		qt_wa_staticcontents
		qt_wa_stylesheet
		qt_wa_translucentbackground
		qt_wa_undermouse
		qt_wa_updatesdisabled
		qt_wa_windowmodified
		qt_wa_windowpropagation
		qt_wa_macalwaysshowtoolwindow
		qt_wa_setlocale
		qt_wa_styledbackground
		qt_wa_showwithoutactivating
		qt_wa_nativewindow
		qt_wa_dontcreatenativeancestors
		qt_wa_x11netwmwindowtypedesktop
		qt_wa_x11netwmwindowtypedock
		qt_wa_x11netwmwindowtypetoolbar
		qt_wa_x11netwmwindowtypemenu
		qt_wa_x11netwmwindowtypeutility
		qt_wa_x11netwmwindowtypesplash
		qt_wa_x11netwmwindowtypedialog
		qt_wa_x11netwmwindowtypedropdownmenu
		qt_wa_x11netwmwindowtypepopupmenu
		qt_wa_x11netwmwindowtypetooltip
		qt_wa_x11netwmwindowtypenotification
		qt_wa_x11netwmwindowtypecombo
		qt_wa_x11netwmwindowtypednd
		qt_wa_macframeworkscaled
		qt_wa_accepttouchevents
		qt_wa_touchpadacceptsingletouchevents
		qt_wa_x11donotacceptfocus
		qt_wa_alwaysstackontop
		qcompleter_popupcompletion
		qcompleter_inlinecompletion
		qcompleter_unfilteredpopupcompletion
		qcompleter_unsortedmodel
		qcompleter_casesensitivelysortedmodel
		qcompleter_caseinsensitivelysortedmodel
		qt_caseinsensitive
		qt_casesensitive
		qstring_keepemptyparts
		qstring_skipemptyparts
		qprocess_normalexit
		qprocess_crashexit
		qprocess_managedinputchannel
		qprocess_forwardedinputchannel
		qprocess_standardoutput
		qprocess_standarderror
		qprocess_separatechannels
		qprocess_mergedchannels
		qprocess_forwardedchannels
		qprocess_forwardederrorchannel
		qprocess_forwardedoutputchannel
		qprocess_failedtostart
		qprocess_crashed
		qprocess_timedout
		qprocess_writeerror
		qprocess_readerror
		qprocess_unknownerror
		qprocess_notrunning
		qprocess_starting
		qprocess_running
		qiodevice_notopen
		qiodevice_readonly
		qiodevice_writeonly
		qiodevice_readwrite
		qiodevice_append
		qiodevice_truncate
		qiodevice_text
		qiodevice_unbuffered
		qt_scrollbarasneeded
		qt_scrollbaralwaysoff
		qt_scrollbaralwayson
		qt_arrowcursor
		qt_uparrowcursor
		qt_crosscursor
		qt_waitcursor
		qt_ibeamcursor
		qt_sizevercursor
		qt_sizehorcursor
		qt_sizebdiagcursor
		qt_sizefdiagcursor
		qt_sizeallcursor
		qt_blankcursor
		qt_splitvcursor
		qt_splithcursor
		qt_pointinghandcursor
		qt_forbiddencursor
		qt_openhandcursor
		qt_closedhandcursor
		qt_whatsthiscursor
		qt_busycursor
		qt_dragmovecursor
		qt_dragcopycursor
		qt_draglinkcursor
		qt_bitmapcursor
		qt_key_escape
		qt_key_tab
		qt_key_backtab
		qt_key_backspace
		qt_key_return
		qt_key_enter
		qt_key_insert
		qt_key_delete
		qt_key_pause
		qt_key_print
		qt_key_sysreq
		qt_key_clear
		qt_key_home
		qt_key_end
		qt_key_left
		qt_key_up
		qt_key_right
		qt_key_down
		qt_key_pageup
		qt_key_pagedown
		qt_key_shift
		qt_key_control
		qabstractitemview_singleselection
		qabstractitemview_contiguousselection
		qabstractitemview_extendedselection
		qabstractitemview_multiselection
		qabstractitemview_noselection
		qitemselectionmodel_noupdate
		qitemselectionmodel_clear
		qitemselectionmodel_select
		qitemselectionmodel_deselect
		qitemselectionmodel_toggle
		qitemselectionmodel_current
		qitemselectionmodel_rows
		qitemselectionmodel_columns
		qitemselectionmodel_selectcurrent
		qitemselectionmodel_togglecurrent
		qitemselectionmodel_clearandselect
		qabstractitemview_noedittriggers
		qabstractitemview_currentchanged
		qabstractitemview_doubleclicked
		qabstractitemview_selectedclicked
		qabstractitemview_editkeypressed
		qabstractitemview_anykeypressed
		qabstractitemview_alledittriggers
		qsizepolicy_growflag
		qsizepolicy_expandflag
		qsizepolicy_shrinkflag
		qsizepolicy_ignoreflag
		qsizepolicy_fixed
		qsizepolicy_minimum
		qsizepolicy_maximum
		qsizepolicy_preferred
		qsizepolicy_expanding
		qsizepolicy_minimumexpanding
		qsizepolicy_ignored
		qtextcursor_moveanchor
		qtextcursor_keepanchor
		qfiledialog_lookin
		qfiledialog_filename
		qfiledialog_filetype
		qfiledialog_accept
		qfiledialog_reject
		qfiledialog_acceptopen
		qfiledialog_acceptsave
		qfiledialog_anyfile
		qfiledialog_existingfile
		qfiledialog_directory
		qfiledialog_existingfiles
		qfiledialog_directoryonly
		qfiledialog_showdirsonly
		qfiledialog_dontresolvesymlinks
		qfiledialog_dontconfirmoverwrite
		qfiledialog_dontusenativedialog
		qfiledialog_readonly
		qfiledialog_hidenamefilterdetails
		qfiledialog_dontusesheet
		qfiledialog_dontusecustomdirectoryicons
		qfiledialog_detail
		qfiledialog_list
		qdir_dirs
		qdir_alldirs
		qdir_files
		qdir_drives
		qdir_nosymlinks
		qdir_nodot
		qdir_nodotdot
		qdir_nodotanddotdot
		qdir_allentries
		qdir_readable
		qdir_writable
		qdir_executable
		qdir_modified
		qdir_hidden
		qdir_system
		qdir_casesensitive
		qmessagebox_noicon
		qmessagebox_question
		qmessagebox_information
		qmessagebox_warning
		qmessagebox_critical
		qt_lefttoolbararea
		qt_righttoolbararea
		qt_toptoolbararea
		qt_bottomtoolbararea
		qt_alltoolbarareas
		qt_notoolbararea"
		AddItems(str2List(cConstants))
	} 
	func AddItems aList { 
		for cItem in aList step 1 { 
			oList.append(cItem)
		} 
	} 
	func DeleteExtraItems  { 
		nMax = oList.count()
		for t = nSize+1 to nMax step 1 { 
			oList.removelast()
		} 
	} 
	func loadExtraItems oGoalDesigner { 
		if CheckUsingAutoCompleteCache(oGoalDesigner) { 
			return 
		} 
		#Delete Extra (Dynamic) Items
		#Add the Dynamic Items
		DeleteExtraItems()
		AddItems(getAutoCompleteItems(oGoalDesigner))
		#Remove Duplication
		oList.removeDuplicates()
	} 
	func supportControl oGoalDesigner,oGUIControl { 
		return supportControlImplementation( oGoalDesigner, oGUIControl, True ) 
	} 
	func supportControlWithoutSettingItAsParent oGoalDesigner,oGUIControl { 
		return supportControlImplementation( oGoalDesigner, oGUIControl, False ) 
	} 
	func supportControlImplementation oGoalDesigner,oGUIControl,lSetParent { 
		if  NOT lSupportAutoComplete { 
			return 
		} 
		loadExtraItems(oGoalDesigner)
		#Create the Completer Object
		if lSetParent { 
			oCompleter = new qCompleter4(oList,oGUIControl)
			else
				oCompleter = new qCompleter4(oList,NULL)
		} 
		oCompleter.setCaseSensitivity(Qt_CaseInsensitive)
		#Use the Completer Object
		oGUIControl.setCompleter(oCompleter)
	} 
	func AddFunctions  { 
		AddItems(cfunctions())
		#/*
		#		Get Autocomplete Items
		#	*/
	} 
	func getAutoCompleteItems oGoalDesigner { 
		aItems = []
		#Add objects from the Form Designer
		aObjects = oGoalDesigner.parent().formdesigner().oModel.getObjects()
		nAutoCompleteFormObjectsCache = len(aObjects)
		for oObj in aObjects step 1 { 
			if oObj[1] = "Window" { 
				oObj[1] = "win"
			} 
			if  NOT find(aItems,oObj[1]) { 
				aItems+oObj[1]
			} 
			if  NOT find(aItems,"oView."+oObj[1]) { 
				aItems+("oView."+oObj[1])
			} 
			cClass = classname(oObj[2])
			lKnown = True
			switch cClass { 
				case "formdesigner_qwidget"
					oMyObj = new qwidget
				case "formdesigner_qlabel"
					oMyObj = new qlabel
				case "formdesigner_qpushbutton"
					oMyObj = new qpushbutton
				case "formdesigner_qlineedit"
					oMyObj = new qlineedit
				case "formdesigner_qtextedit"
					oMyObj = new qtextedit
				case "formdesigner_qlistwidget"
					oMyObj = new qlistwidget
				case "formdesigner_qcheckbox"
					oMyObj = new qcheckbox
				case "formdesigner_qimage"
					oMyObj = new qlabel
				case "formdesigner_qslider"
					oMyObj = new qslider
				case "formdesigner_qprogressbar"
					oMyObj = new qprogressbar
				case "formdesigner_qspinbox"
					oMyObj = new qspinbox
				case "formdesigner_qcombobox"
					oMyObj = new qcombobox
				case "formdesigner_qdatetimeedit"
					oMyObj = new qdatetimeedit
				case "formdesigner_qtablewidget"
					oMyObj = new qtablewidget
				case "formdesigner_qtreewidget"
					oMyObj = new qtreewidget
				case "formdesigner_qradiobutton"
					oMyObj = new qradiobutton
				case "formdesigner_qwebview"
					oMyObj = new qwebview
				case "formdesigner_qdial"
					oMyObj = new qdial
				case "formdesigner_qvideowidget"
					oMyObj = new qvideowidget
				case "formdesigner_qframe"
					oMyObj = new qframe
				case "formdesigner_qlcdnumber"
					oMyObj = new qlcdnumber
				case "formdesigner_qhyperlink"
					oMyObj = new qlabel
				case "formdesigner_qtimer"
					oMyObj = new qtimer
				case "formdesigner_qallevents"
					oMyObj = new qallevents
				case "formdesigner_qlayout"
					oMyObj = new qvboxlayout
				case "formdesigner_qtabwidget"
					oMyObj = new qtabwidget
				case "formdesigner_qstatusbar"
					oMyObj = new qstatusbar
				case "formdesigner_qtoolbar"
					oMyObj = new qtoolbar
				else
					lKnown = False
			} 
			if lKnown { 
				aMethodsList = methods(oMyObj)
				for cMethod in aMethodsList step 1 { 
					aItems+(oObj[1]+"."+cMethod+"()")
					aItems+("oView."+oObj[1]+"."+cMethod+"()")
				} 
			} 
		} 
		#Get Steps Tree Data
		aTree = oGoalDesigner.oModel.oStepsTreeModel.GetData()
		nAutoCompleteStepsTreeCache = len(aTree)
		#Add words from Steps Tree
		cCode = ""
		for item in aTree step 1 { 
			aContent = item[C_TREEMODEL_CONTENT]
			cCode += aContent[:code]+nl
		} 
		aWords = sort(split(cCode," "))
		#Remove Duplication
		cLast = ""
		for word in aWords step 1 { 
			if word! = cLast { 
				aItems+word
				cLast = word
			} 
		} 
		return aItems
	} 
	func CheckUsingAutoCompleteCache oGoalDesigner { 
		return (len( oGoalDesigner. oModel. oStepsTreeModel. aList ) = oGoalDesigner. nAutoCompleteStepsTreeCache )  and ( len( oGoalDesigner. parent() . formdesigner() . oModel. getObjects() ) = oGoalDesigner. nAutoCompleteFormObjectsCache ) 
	} 
private
