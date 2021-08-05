/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  weblib_bootstrappage Component
**	Date : 2018.03.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class weblib_bootstrappageComponentController from ComponentControllerParent 

	oView = new weblib_bootstrappageComponentView

	aAllowEmptyValue = [:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "addattributes"
					case 2 cFunc = "audio"
					case 3 cFunc = "boxend"
					case 4 cFunc = "boxstart"
					case 5 cFunc = "braceend"
					case 6 cFunc = "button"
					case 7 cFunc = "buttonlink"
					case 8 cFunc = "cellend"
					case 9 cFunc = "cellstart"
					case 10 cFunc = "checkbox"
					case 11 cFunc = "combobox"
					case 12 cFunc = "cookie"
					case 13 cFunc = "decode"
					case 14 cFunc = "decodestring"
					case 15 cFunc = "divend"
					case 16 cFunc = "divstart"
					case 17 cFunc = "editbox"
					case 18 cFunc = "formend"
					case 19 cFunc = "formpost"
					case 20 cFunc = "formstart"
					case 21 cFunc = "formupload"
					case 22 cFunc = "getcolor"
					case 23 cFunc = "getcookies"
					case 24 cFunc = "getfilename"
					case 25 cFunc = "gethtmlstart"
					case 26 cFunc = "gettabs"
					case 27 cFunc = "h1"
					case 28 cFunc = "h2"
					case 29 cFunc = "h3"
					case 30 cFunc = "h4"
					case 31 cFunc = "h5"
					case 32 cFunc = "h6"
					case 33 cFunc = "headerend"
					case 34 cFunc = "headerstart"
					case 35 cFunc = "hidden"
					case 36 cFunc = "html"
					case 37 cFunc = "image"
					case 38 cFunc = "liend"
					case 39 cFunc = "link"
					case 40 cFunc = "list2ul"
					case 41 cFunc = "listart"
					case 42 cFunc = "listbox"
					case 43 cFunc = "navend"
					case 44 cFunc = "navstart"
					case 45 cFunc = "newline"
					case 46 cFunc = "nooutput"
					case 47 cFunc = "output"
					case 48 cFunc = "p"
					case 49 cFunc = "print"
					case 50 cFunc = "radio"
					case 51 cFunc = "rowend"
					case 52 cFunc = "rowstart"
					case 53 cFunc = "script"
					case 54 cFunc = "scriptfunc"
					case 55 cFunc = "scriptfuncajax"
					case 56 cFunc = "scriptfuncalert"
					case 57 cFunc = "scriptfuncclean"
					case 58 cFunc = "scriptfuncselect"
					case 59 cFunc = "scriptlibs"
					case 60 cFunc = "scriptredirection"
					case 61 cFunc = "scriptscrollfixed"
					case 62 cFunc = "setcookie"
					case 63 cFunc = "slider"
					case 64 cFunc = "spanend"
					case 65 cFunc = "spanstart"
					case 66 cFunc = "spinner"
					case 67 cFunc = "starthtml"
					case 68 cFunc = "style"
					case 69 cFunc = "styleabsolute"
					case 70 cFunc = "stylebackcolor"
					case 71 cFunc = "stylecolor"
					case 72 cFunc = "styledivcenter"
					case 73 cFunc = "stylefixed"
					case 74 cFunc = "stylefloatleft"
					case 75 cFunc = "stylefloatright"
					case 76 cFunc = "stylefontsize"
					case 77 cFunc = "stylegradient"
					case 78 cFunc = "styleheight"
					case 79 cFunc = "stylehorizontalcenter"
					case 80 cFunc = "styleleft"
					case 81 cFunc = "stylemarginleft"
					case 82 cFunc = "stylemarginright"
					case 83 cFunc = "stylemargintop"
					case 84 cFunc = "stylepos"
					case 85 cFunc = "stylesize"
					case 86 cFunc = "stylesizefull"
					case 87 cFunc = "styletable"
					case 88 cFunc = "styletablenoborder"
					case 89 cFunc = "styletablerows"
					case 90 cFunc = "styletextcenter"
					case 91 cFunc = "styletextleft"
					case 92 cFunc = "styletextright"
					case 93 cFunc = "styletop"
					case 94 cFunc = "stylewidth"
					case 95 cFunc = "stylezindex"
					case 96 cFunc = "submit"
					case 97 cFunc = "tableend"
					case 98 cFunc = "tablestart"
					case 99 cFunc = "tabmlstring"
					case 100 cFunc = "tabpop"
					case 101 cFunc = "tabpush"
					case 102 cFunc = "tagend"
					case 103 cFunc = "tagstart"
					case 104 cFunc = "text"
					case 105 cFunc = "textbox"
					case 106 cFunc = "ulend"
					case 107 cFunc = "ulstart"
					case 108 cFunc = "uploadfile"
					case 109 cFunc = "urlencode"
					case 110 cFunc = "video"
					case 111 cFunc = "webprint"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_WEBLIB_BOOTSTRAPPAGE_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class weblib_bootstrappageComponentView from ComponentViewParent
	 
		Title( T_CT_WEBLIB_BOOTSTRAPPAGE_IP_TITLE )	
		TextBox( T_CT_WEBLIB_BOOTSTRAPPAGE_IP_VALUE , :value)
		ListBox( T_CT_WEBLIB_BOOTSTRAPPAGE_IP_VALUE2 , :value2, 
				T_CT_WEBLIB_BOOTSTRAPPAGE_IP_VALUE2LIST )
		TextBox( T_CT_WEBLIB_BOOTSTRAPPAGE_IP_VALUE3 , :value3)
		TextBox( T_CT_WEBLIB_BOOTSTRAPPAGE_IP_VALUE4 , :value4)
		PageButtons()
