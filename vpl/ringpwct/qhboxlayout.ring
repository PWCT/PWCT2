/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qhboxlayout Component
**	Date : 2017.12.14
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class qhboxlayoutComponentController from ComponentControllerParent 

	oView = new qhboxlayoutComponentView

	func GenerateAction 

		
				switch Variable(:Value2) {
					
					case 1 cFunc = "activate"
					case 2 cFunc = "addlayout"
					case 3 cFunc = "addspaceritem"
					case 4 cFunc = "addspacing"
					case 5 cFunc = "addstretch"
					case 6 cFunc = "addstrut"
					case 7 cFunc = "addwidget"
					case 8 cFunc = "blocksignals"
					case 9 cFunc = "children"
					case 10 cFunc = "closestacceptablesize"
					case 11 cFunc = "contentsmargins"
					case 12 cFunc = "contentsrect"
					case 13 cFunc = "delete"
					case 14 cFunc = "deletelater"
					case 15 cFunc = "direction"
					case 16 cFunc = "dumpobjectinfo"
					case 17 cFunc = "dumpobjecttree"
					case 18 cFunc = "getcontentsmargins"
					case 19 cFunc = "inherits"
					case 20 cFunc = "init"
					case 21 cFunc = "insertlayout"
					case 22 cFunc = "insertspaceritem"
					case 23 cFunc = "insertspacing"
					case 24 cFunc = "insertstretch"
					case 25 cFunc = "insertwidget"
					case 26 cFunc = "installeventfilter"
					case 27 cFunc = "isenabled"
					case 28 cFunc = "iswidgettype"
					case 29 cFunc = "killtimer"
					case 30 cFunc = "menubar"
					case 31 cFunc = "movetothread"
					case 32 cFunc = "objectname"
					case 33 cFunc = "parent"
					case 34 cFunc = "parentwidget"
					case 35 cFunc = "property"
					case 36 cFunc = "removeeventfilter"
					case 37 cFunc = "removeitem"
					case 38 cFunc = "removewidget"
					case 39 cFunc = "setalignment"
					case 40 cFunc = "setalignment_2"
					case 41 cFunc = "setalignment_3"
					case 42 cFunc = "setcontentsmargins"
					case 43 cFunc = "setcontentsmargins_2"
					case 44 cFunc = "setdirection"
					case 45 cFunc = "setenabled"
					case 46 cFunc = "setmenubar"
					case 47 cFunc = "setobjectname"
					case 48 cFunc = "setparent"
					case 49 cFunc = "setproperty"
					case 50 cFunc = "setsizeconstraint"
					case 51 cFunc = "setspacing"
					case 52 cFunc = "setstretch"
					case 53 cFunc = "setstretchfactor"
					case 54 cFunc = "setstretchfactor_2"
					case 55 cFunc = "signalsblocked"
					case 56 cFunc = "sizeconstraint"
					case 57 cFunc = "spacing"
					case 58 cFunc = "starttimer"
					case 59 cFunc = "stretch"
					case 60 cFunc = "thread"
					case 61 cFunc = "update"
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_QHBOXLAYOUT_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class qhboxlayoutComponentView from ComponentViewParent
	 
		Title( T_CT_QHBOXLAYOUT_IP_TITLE )	
		TextBox( T_CT_QHBOXLAYOUT_IP_VALUE , :value)
		ListBox( T_CT_QHBOXLAYOUT_IP_VALUE2 , :value2, 
				T_CT_QHBOXLAYOUT_IP_VALUE2LIST )
		TextBox( T_CT_QHBOXLAYOUT_IP_VALUE3 , :value3)
		TextBox( T_CT_QHBOXLAYOUT_IP_VALUE4 , :value4)
		PageButtons()
