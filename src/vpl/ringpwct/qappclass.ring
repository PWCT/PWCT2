/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qappclass Component
**	Date : 2017.12.14
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class qappclassComponentController from ComponentControllerParent 

	oView = new qappclassComponentView

	aAllowEmptyValue = [:value3,:value4]

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "addlibrarypath"
					case 2 cFunc = "allwindows"
					case 3 cFunc = "applicationdirpath"
					case 4 cFunc = "applicationdisplayname"
					case 5 cFunc = "applicationfilepath"
					case 6 cFunc = "applicationname"
					case 7 cFunc = "applicationpid"
					case 8 cFunc = "applicationstate"
					case 9 cFunc = "applicationversion"
					case 10 cFunc = "arguments"
					case 11 cFunc = "blocksignals"
					case 12 cFunc = "changeoverridecursor"
					case 13 cFunc = "children"
					case 14 cFunc = "clipboard"
					case 15 cFunc = "closeallwindows"
					case 16 cFunc = "closingdown"
					case 17 cFunc = "delete"
					case 18 cFunc = "deletelater"
					case 19 cFunc = "desktopsettingsaware"
					case 20 cFunc = "devicepixelratio"
					case 21 cFunc = "dumpobjectinfo"
					case 22 cFunc = "dumpobjecttree"
					case 23 cFunc = "eventdispatcher"
					case 24 cFunc = "exec"
					case 25 cFunc = "exitfromapplication"
					case 26 cFunc = "focusobject"
					case 27 cFunc = "focuswindow"
					case 28 cFunc = "font"
					case 29 cFunc = "getapplicationdisplaynamechangedevent"
					case 30 cFunc = "getapplicationstatechangedevent"
					case 31 cFunc = "getcommitdatarequestevent"
					case 32 cFunc = "getfocusobjectchangedevent"
					case 33 cFunc = "getfocuswindowchangedevent"
					case 34 cFunc = "getfontdatabasechangedevent"
					case 35 cFunc = "getlastwindowclosedevent"
					case 36 cFunc = "getlayoutdirectionchangedevent"
					case 37 cFunc = "getpalettechangedevent"
					case 38 cFunc = "getprimaryscreenchangedevent"
					case 39 cFunc = "getsavestaterequestevent"
					case 40 cFunc = "getscreenaddedevent"
					case 41 cFunc = "getscreenremovedevent"
					case 42 cFunc = "inherits"
					case 43 cFunc = "init"
					case 44 cFunc = "inputmethod"
					case 45 cFunc = "installeventfilter"
					case 46 cFunc = "installnativeeventfilter"
					case 47 cFunc = "installtranslator"
					case 48 cFunc = "instance"
					case 49 cFunc = "islefttoright"
					case 50 cFunc = "isquitlockenabled"
					case 51 cFunc = "isrighttoleft"
					case 52 cFunc = "issavingsession"
					case 53 cFunc = "issessionrestored"
					case 54 cFunc = "iswidgettype"
					case 55 cFunc = "keyboardmodifiers"
					case 56 cFunc = "killtimer"
					case 57 cFunc = "layoutdirection"
					case 58 cFunc = "librarypaths"
					case 59 cFunc = "modalwindow"
					case 60 cFunc = "mousebuttons"
					case 61 cFunc = "movetothread"
					case 62 cFunc = "objectname"
					case 63 cFunc = "organizationdomain"
					case 64 cFunc = "organizationname"
					case 65 cFunc = "overridecursor"
					case 66 cFunc = "palette"
					case 67 cFunc = "parent"
					case 68 cFunc = "platformname"
					case 69 cFunc = "platformnativeinterface"
					case 70 cFunc = "postevent"
					case 71 cFunc = "primaryscreen"
					case 72 cFunc = "processevents"
					case 73 cFunc = "processevents_2"
					case 74 cFunc = "property"
					case 75 cFunc = "querykeyboardmodifiers"
					case 76 cFunc = "quit"
					case 77 cFunc = "quitonlastwindowclosed"
					case 78 cFunc = "removeeventfilter"
					case 79 cFunc = "removelibrarypath"
					case 80 cFunc = "removenativeeventfilter"
					case 81 cFunc = "removepostedevents"
					case 82 cFunc = "removetranslator"
					case 83 cFunc = "restoreoverridecursor"
					case 84 cFunc = "screens"
					case 85 cFunc = "sendevent"
					case 86 cFunc = "sendpostedevents"
					case 87 cFunc = "sessionid"
					case 88 cFunc = "sessionkey"
					case 89 cFunc = "setapplicationdisplayname"
					case 90 cFunc = "setapplicationdisplaynamechangedevent"
					case 91 cFunc = "setapplicationname"
					case 92 cFunc = "setapplicationstatechangedevent"
					case 93 cFunc = "setapplicationversion"
					case 94 cFunc = "setattribute"
					case 95 cFunc = "setcommitdatarequestevent"
					case 96 cFunc = "setdesktopsettingsaware"
					case 97 cFunc = "seteventdispatcher"
					case 98 cFunc = "setfocusobjectchangedevent"
					case 99 cFunc = "setfocuswindowchangedevent"
					case 100 cFunc = "setfont"
					case 101 cFunc = "setfontdatabasechangedevent"
					case 102 cFunc = "setlastwindowclosedevent"
					case 103 cFunc = "setlayoutdirection"
					case 104 cFunc = "setlayoutdirectionchangedevent"
					case 105 cFunc = "setlibrarypaths"
					case 106 cFunc = "setobjectname"
					case 107 cFunc = "setorganizationdomain"
					case 108 cFunc = "setorganizationname"
					case 109 cFunc = "setoverridecursor"
					case 110 cFunc = "setpalette"
					case 111 cFunc = "setpalettechangedevent"
					case 112 cFunc = "setparent"
					case 113 cFunc = "setprimaryscreenchangedevent"
					case 114 cFunc = "setproperty"
					case 115 cFunc = "setquitlockenabled"
					case 116 cFunc = "setquitonlastwindowclosed"
					case 117 cFunc = "setsavestaterequestevent"
					case 118 cFunc = "setscreenaddedevent"
					case 119 cFunc = "setscreenremovedevent"
					case 120 cFunc = "signalsblocked"
					case 121 cFunc = "startingup"
					case 122 cFunc = "starttimer"
					case 123 cFunc = "stylefusion"
					case 124 cFunc = "stylefusionblack"
					case 125 cFunc = "stylefusioncustom"
					case 126 cFunc = "stylehints"
					case 127 cFunc = "stylewindows"
					case 128 cFunc = "stylewindowsvista"
					case 129 cFunc = "sync"
					case 130 cFunc = "testattribute"
					case 131 cFunc = "thread"
					case 132 cFunc = "toplevelat"
					case 133 cFunc = "toplevelwindows"
					case 134 cFunc = "translate"
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_QAPPCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class qappclassComponentView from ComponentViewParent
	 
		Title( T_CT_QAPPCLASS_IP_TITLE )	
		TextBox( T_CT_QAPPCLASS_IP_VALUE , :value)
		ListBox( T_CT_QAPPCLASS_IP_VALUE2 , :value2, 
				T_CT_QAPPCLASS_IP_VALUE2LIST )
		TextBox( T_CT_QAPPCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_QAPPCLASS_IP_VALUE4 , :value4)
		PageButtons()
