/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qvboxlayoutclass Component
**	Date : 2017.12.14
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class qvboxlayoutclassComponentController from ComponentControllerParent 

	oView = new qvboxlayoutclassComponentView

	aAllowEmptyValue = [:value3,:value4]

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
			case 33 cFunc = "objectpointer"
			case 34 cFunc = "parent"
			case 35 cFunc = "parentwidget"
			case 36 cFunc = "property"
			case 37 cFunc = "removeeventfilter"
			case 38 cFunc = "removeitem"
			case 39 cFunc = "removewidget"
			case 40 cFunc = "setalignment"
			case 41 cFunc = "setalignment_2"
			case 42 cFunc = "setalignment_3"
			case 43 cFunc = "setcontentsmargins"
			case 44 cFunc = "setcontentsmargins_2"
			case 45 cFunc = "setdirection"
			case 46 cFunc = "setenabled"
			case 47 cFunc = "setmenubar"
			case 48 cFunc = "setobjectname"
			case 49 cFunc = "setparent"
			case 50 cFunc = "setproperty"
			case 51 cFunc = "setproperty_2"
			case 52 cFunc = "setproperty_3"
			case 53 cFunc = "setproperty_4"
			case 54 cFunc = "setproperty_5"
			case 55 cFunc = "setproperty_double"
			case 56 cFunc = "setproperty_float"
			case 57 cFunc = "setproperty_int"
			case 58 cFunc = "setproperty_string"
			case 59 cFunc = "setsizeconstraint"
			case 60 cFunc = "setspacing"
			case 61 cFunc = "setstretch"
			case 62 cFunc = "setstretchfactor"
			case 63 cFunc = "setstretchfactor_2"
			case 64 cFunc = "signalsblocked"
			case 65 cFunc = "sizeconstraint"
			case 66 cFunc = "spacing"
			case 67 cFunc = "starttimer"
			case 68 cFunc = "stretch"
			case 69 cFunc = "thread"
			case 70 cFunc = "update"
		
		}
		
		# Get the function Name 
			cFuncName = T_CT_QVBOXLAYOUTCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
		# Generate Step and Code using common method 
			common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class qvboxlayoutclassComponentView from ComponentViewParent
	 
		Title( T_CT_QVBOXLAYOUTCLASS_IP_TITLE )	
		TextBox( T_CT_QVBOXLAYOUTCLASS_IP_VALUE , :value)
		ListBox( T_CT_QVBOXLAYOUTCLASS_IP_VALUE2 , :value2, 
				T_CT_QVBOXLAYOUTCLASS_IP_VALUE2LIST )
		TextBox( T_CT_QVBOXLAYOUTCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_QVBOXLAYOUTCLASS_IP_VALUE4 , :value4)
		PageButtons()
