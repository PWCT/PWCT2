/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qdatetimeeditclass Component
**	Date : 2018.03.14
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class qdatetimeeditclassComponentController from ComponentControllerParent 

	oView = new qdatetimeeditclassComponentView

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "acceptdrops"
					case 2 cFunc = "accessibledescription"
					case 3 cFunc = "accessiblename"
					case 4 cFunc = "activatewindow"
					case 5 cFunc = "addaction"
					case 6 cFunc = "adjustsize"
					case 7 cFunc = "alignment"
					case 8 cFunc = "autofillbackground"
					case 9 cFunc = "backgroundrole"
					case 10 cFunc = "basesize"
					case 11 cFunc = "blocksignals"
					case 12 cFunc = "buttonsymbols"
					case 13 cFunc = "calendarpopup"
					case 14 cFunc = "calendarwidget"
					case 15 cFunc = "childat"
					case 16 cFunc = "children"
					case 17 cFunc = "childrenrect"
					case 18 cFunc = "childrenregion"
					case 19 cFunc = "clear"
					case 20 cFunc = "clearfocus"
					case 21 cFunc = "clearmask"
					case 22 cFunc = "clearmaximumdate"
					case 23 cFunc = "clearmaximumdatetime"
					case 24 cFunc = "clearmaximumtime"
					case 25 cFunc = "clearminimumdate"
					case 26 cFunc = "clearminimumdatetime"
					case 27 cFunc = "clearminimumtime"
					case 28 cFunc = "close"
					case 29 cFunc = "contentsmargins"
					case 30 cFunc = "contentsrect"
					case 31 cFunc = "contextmenupolicy"
					case 32 cFunc = "correctionmode"
					case 33 cFunc = "currentsection"
					case 34 cFunc = "currentsectionindex"
					case 35 cFunc = "cursor"
					case 36 cFunc = "date"
					case 37 cFunc = "datetime"
					case 38 cFunc = "delete"
					case 39 cFunc = "deletelater"
					case 40 cFunc = "displayedsections"
					case 41 cFunc = "displayformat"
					case 42 cFunc = "dumpobjectinfo"
					case 43 cFunc = "dumpobjecttree"
					case 44 cFunc = "effectivewinid"
					case 45 cFunc = "ensurepolished"
					case 46 cFunc = "find"
					case 47 cFunc = "focuspolicy"
					case 48 cFunc = "focusproxy"
					case 49 cFunc = "focuswidget"
					case 50 cFunc = "font"
					case 51 cFunc = "fontinfo"
					case 52 cFunc = "foregroundrole"
					case 53 cFunc = "framegeometry"
					case 54 cFunc = "framesize"
					case 55 cFunc = "geometry"
					case 56 cFunc = "getcontentsmargins"
					case 57 cFunc = "grab"
					case 58 cFunc = "grabgesture"
					case 59 cFunc = "grabkeyboard"
					case 60 cFunc = "grabmouse"
					case 61 cFunc = "grabshortcut"
					case 62 cFunc = "graphicseffect"
					case 63 cFunc = "graphicsproxywidget"
					case 64 cFunc = "hasacceptableinput"
					case 65 cFunc = "hasfocus"
					case 66 cFunc = "hasframe"
					case 67 cFunc = "hasmousetracking"
					case 68 cFunc = "height"
					case 69 cFunc = "heightforwidth"
					case 70 cFunc = "hide"
					case 71 cFunc = "inherits"
					case 72 cFunc = "init"
					case 73 cFunc = "inputmethodhints"
					case 74 cFunc = "inputmethodquery"
					case 75 cFunc = "insertaction"
					case 76 cFunc = "installeventfilter"
					case 77 cFunc = "interprettext"
					case 78 cFunc = "isaccelerated"
					case 79 cFunc = "isactivewindow"
					case 80 cFunc = "isancestorof"
					case 81 cFunc = "isenabled"
					case 82 cFunc = "isenabledto"
					case 83 cFunc = "isfullscreen"
					case 84 cFunc = "ishidden"
					case 85 cFunc = "ismaximized"
					case 86 cFunc = "isminimized"
					case 87 cFunc = "ismodal"
					case 88 cFunc = "isreadonly"
					case 89 cFunc = "isvisible"
					case 90 cFunc = "isvisibleto"
					case 91 cFunc = "iswidgettype"
					case 92 cFunc = "iswindow"
					case 93 cFunc = "iswindowmodified"
					case 94 cFunc = "keyboardgrabber"
					case 95 cFunc = "keyboardtracking"
					case 96 cFunc = "killtimer"
					case 97 cFunc = "layout"
					case 98 cFunc = "layoutdirection"
					case 99 cFunc = "locale"
					case 100 cFunc = "lower"
					case 101 cFunc = "mapfrom"
					case 102 cFunc = "mapfromglobal"
					case 103 cFunc = "mapfromparent"
					case 104 cFunc = "mapto"
					case 105 cFunc = "maptoglobal"
					case 106 cFunc = "maptoparent"
					case 107 cFunc = "mask"
					case 108 cFunc = "maximumdate"
					case 109 cFunc = "maximumdatetime"
					case 110 cFunc = "maximumheight"
					case 111 cFunc = "maximumsize"
					case 112 cFunc = "maximumtime"
					case 113 cFunc = "maximumwidth"
					case 114 cFunc = "minimumdate"
					case 115 cFunc = "minimumdatetime"
					case 116 cFunc = "minimumheight"
					case 117 cFunc = "minimumsize"
					case 118 cFunc = "minimumtime"
					case 119 cFunc = "minimumwidth"
					case 120 cFunc = "mousegrabber"
					case 121 cFunc = "move"
					case 122 cFunc = "movetothread"
					case 123 cFunc = "nativeparentwidget"
					case 124 cFunc = "nextinfocuschain"
					case 125 cFunc = "normalgeometry"
					case 126 cFunc = "objectname"
					case 127 cFunc = "overridewindowflags"
					case 128 cFunc = "palette"
					case 129 cFunc = "parent"
					case 130 cFunc = "parentwidget"
					case 131 cFunc = "pos"
					case 132 cFunc = "previousinfocuschain"
					case 133 cFunc = "property"
					case 134 cFunc = "raise"
					case 135 cFunc = "rect"
					case 136 cFunc = "releasekeyboard"
					case 137 cFunc = "releasemouse"
					case 138 cFunc = "releaseshortcut"
					case 139 cFunc = "removeaction"
					case 140 cFunc = "removeeventfilter"
					case 141 cFunc = "render"
					case 142 cFunc = "repaint"
					case 143 cFunc = "resize"
					case 144 cFunc = "restoregeometry"
					case 145 cFunc = "savegeometry"
					case 146 cFunc = "scroll"
					case 147 cFunc = "sectionat"
					case 148 cFunc = "sectioncount"
					case 149 cFunc = "sectiontext"
					case 150 cFunc = "selectall"
					case 151 cFunc = "setaccelerated"
					case 152 cFunc = "setacceptdrops"
					case 153 cFunc = "setaccessibledescription"
					case 154 cFunc = "setaccessiblename"
					case 155 cFunc = "setalignment"
					case 156 cFunc = "setattribute"
					case 157 cFunc = "setautofillbackground"
					case 158 cFunc = "setbackgroundrole"
					case 159 cFunc = "setbasesize"
					case 160 cFunc = "setbuttonsymbols"
					case 161 cFunc = "setcalendarpopup"
					case 162 cFunc = "setcalendarwidget"
					case 163 cFunc = "setcontentsmargins"
					case 164 cFunc = "setcontextmenupolicy"
					case 165 cFunc = "setcorrectionmode"
					case 166 cFunc = "setcurrentsection"
					case 167 cFunc = "setcurrentsectionindex"
					case 168 cFunc = "setcursor"
					case 169 cFunc = "setdate"
					case 170 cFunc = "setdaterange"
					case 171 cFunc = "setdatetime"
					case 172 cFunc = "setdatetimerange"
					case 173 cFunc = "setdisabled"
					case 174 cFunc = "setdisplayformat"
					case 175 cFunc = "setenabled"
					case 176 cFunc = "setfixedheight"
					case 177 cFunc = "setfixedsize"
					case 178 cFunc = "setfixedwidth"
					case 179 cFunc = "setfocus"
					case 180 cFunc = "setfocuspolicy"
					case 181 cFunc = "setfocusproxy"
					case 182 cFunc = "setfont"
					case 183 cFunc = "setforegroundrole"
					case 184 cFunc = "setframe"
					case 185 cFunc = "setgeometry"
					case 186 cFunc = "setgraphicseffect"
					case 187 cFunc = "sethidden"
					case 188 cFunc = "setinputmethodhints"
					case 189 cFunc = "setkeyboardtracking"
					case 190 cFunc = "setlayout"
					case 191 cFunc = "setlayoutdirection"
					case 192 cFunc = "setlocale"
					case 193 cFunc = "setmask"
					case 194 cFunc = "setmaximumdate"
					case 195 cFunc = "setmaximumdatetime"
					case 196 cFunc = "setmaximumheight"
					case 197 cFunc = "setmaximumsize"
					case 198 cFunc = "setmaximumtime"
					case 199 cFunc = "setmaximumwidth"
					case 200 cFunc = "setminimumdate"
					case 201 cFunc = "setminimumdatetime"
					case 202 cFunc = "setminimumheight"
					case 203 cFunc = "setminimumsize"
					case 204 cFunc = "setminimumtime"
					case 205 cFunc = "setminimumwidth"
					case 206 cFunc = "setmousetracking"
					case 207 cFunc = "setobjectname"
					case 208 cFunc = "setpalette"
					case 209 cFunc = "setparent"
					case 210 cFunc = "setproperty"
					case 211 cFunc = "setreadonly"
					case 212 cFunc = "setselectedsection"
					case 213 cFunc = "setshortcutautorepeat"
					case 214 cFunc = "setshortcutenabled"
					case 215 cFunc = "setsizeincrement"
					case 216 cFunc = "setsizepolicy"
					case 217 cFunc = "setspecialvaluetext"
					case 218 cFunc = "setstatustip"
					case 219 cFunc = "setstyle"
					case 220 cFunc = "setstylesheet"
					case 221 cFunc = "settaborder"
					case 222 cFunc = "settime"
					case 223 cFunc = "settimerange"
					case 224 cFunc = "settimespec"
					case 225 cFunc = "settooltip"
					case 226 cFunc = "setupdatesenabled"
					case 227 cFunc = "setwhatsthis"
					case 228 cFunc = "setwindowfilepath"
					case 229 cFunc = "setwindowflags"
					case 230 cFunc = "setwindowicon"
					case 231 cFunc = "setwindowicontext"
					case 232 cFunc = "setwindowmodality"
					case 233 cFunc = "setwindowmodified"
					case 234 cFunc = "setwindowopacity"
					case 235 cFunc = "setwindowrole"
					case 236 cFunc = "setwindowstate"
					case 237 cFunc = "setwindowtitle"
					case 238 cFunc = "setwrapping"
					case 239 cFunc = "show"
					case 240 cFunc = "showfullscreen"
					case 241 cFunc = "showmaximized"
					case 242 cFunc = "showminimized"
					case 243 cFunc = "shownormal"
					case 244 cFunc = "signalsblocked"
					case 245 cFunc = "size"
					case 246 cFunc = "sizeincrement"
					case 247 cFunc = "sizepolicy"
					case 248 cFunc = "specialvaluetext"
					case 249 cFunc = "stackunder"
					case 250 cFunc = "starttimer"
					case 251 cFunc = "statustip"
					case 252 cFunc = "stepby"
					case 253 cFunc = "stepdown"
					case 254 cFunc = "stepup"
					case 255 cFunc = "style"
					case 256 cFunc = "stylesheet"
					case 257 cFunc = "testattribute"
					case 258 cFunc = "text"
					case 259 cFunc = "thread"
					case 260 cFunc = "time"
					case 261 cFunc = "timespec"
					case 262 cFunc = "tooltip"
					case 263 cFunc = "undermouse"
					case 264 cFunc = "ungrabgesture"
					case 265 cFunc = "unsetcursor"
					case 266 cFunc = "unsetlayoutdirection"
					case 267 cFunc = "unsetlocale"
					case 268 cFunc = "update"
					case 269 cFunc = "updategeometry"
					case 270 cFunc = "updatesenabled"
					case 271 cFunc = "visibleregion"
					case 272 cFunc = "whatsthis"
					case 273 cFunc = "width"
					case 274 cFunc = "window"
					case 275 cFunc = "windowfilepath"
					case 276 cFunc = "windowflags"
					case 277 cFunc = "windowhandle"
					case 278 cFunc = "windowicon"
					case 279 cFunc = "windowicontext"
					case 280 cFunc = "windowmodality"
					case 281 cFunc = "windowopacity"
					case 282 cFunc = "windowrole"
					case 283 cFunc = "windowstate"
					case 284 cFunc = "windowtitle"
					case 285 cFunc = "windowtype"
					case 286 cFunc = "winid"
					case 287 cFunc = "wrapping"
					case 288 cFunc = "x"
					case 289 cFunc = "y"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_QDATETIMEEDITCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class qdatetimeeditclassComponentView from ComponentViewParent
	 
		Title( T_CT_QDATETIMEEDITCLASS_IP_TITLE )	
		TextBox( T_CT_QDATETIMEEDITCLASS_IP_VALUE , :value)
		ListBox( T_CT_QDATETIMEEDITCLASS_IP_VALUE2 , :value2, 
				T_CT_QDATETIMEEDITCLASS_IP_VALUE2LIST )
		TextBox( T_CT_QDATETIMEEDITCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_QDATETIMEEDITCLASS_IP_VALUE4 , :value4)
		PageButtons()