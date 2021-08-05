/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  weblib_webpage Component
**	Date : 2018.03.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class weblib_webpageComponentController from ComponentControllerParent 

	oView = new weblib_webpageComponentView

	aAllowEmptyValue = [:value,:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "braceend"
					case 2 cFunc = "cookie"
					case 3 cFunc = "decode"
					case 4 cFunc = "decodestring"
					case 5 cFunc = "getaudio"
					case 6 cFunc = "getbutton"
					case 7 cFunc = "getcookies"
					case 8 cFunc = "getdiv"
					case 9 cFunc = "getfilename"
					case 10 cFunc = "getform"
					case 11 cFunc = "geth1"
					case 12 cFunc = "geth2"
					case 13 cFunc = "geth3"
					case 14 cFunc = "geth4"
					case 15 cFunc = "geth5"
					case 16 cFunc = "geth6"
					case 17 cFunc = "gethtmlstart"
					case 18 cFunc = "getimage"
					case 19 cFunc = "getinput"
					case 20 cFunc = "getli"
					case 21 cFunc = "getlink"
					case 22 cFunc = "getnav"
					case 23 cFunc = "getnewline"
					case 24 cFunc = "getoption"
					case 25 cFunc = "getp"
					case 26 cFunc = "getselect"
					case 27 cFunc = "getspan"
					case 28 cFunc = "gettable"
					case 29 cFunc = "gettabs"
					case 30 cFunc = "gettd"
					case 31 cFunc = "gettextarea"
					case 32 cFunc = "getth"
					case 33 cFunc = "gettr"
					case 34 cFunc = "getul"
					case 35 cFunc = "getvideo"
					case 36 cFunc = "html"
					case 37 cFunc = "nooutput"
					case 38 cFunc = "output"
					case 39 cFunc = "print"
					case 40 cFunc = "script"
					case 41 cFunc = "scriptfunc"
					case 42 cFunc = "scriptfuncajax"
					case 43 cFunc = "scriptfuncalert"
					case 44 cFunc = "scriptfuncclean"
					case 45 cFunc = "scriptfuncselect"
					case 46 cFunc = "scriptlibs"
					case 47 cFunc = "scriptredirection"
					case 48 cFunc = "scriptscrollfixed"
					case 49 cFunc = "setcookie"
					case 50 cFunc = "starthtml"
					case 51 cFunc = "style"
					case 52 cFunc = "styleabsolute"
					case 53 cFunc = "stylebackcolor"
					case 54 cFunc = "stylecolor"
					case 55 cFunc = "styledivcenter"
					case 56 cFunc = "stylefixed"
					case 57 cFunc = "stylefloatleft"
					case 58 cFunc = "stylefloatright"
					case 59 cFunc = "stylefontsize"
					case 60 cFunc = "stylegradient"
					case 61 cFunc = "styleheight"
					case 62 cFunc = "stylehorizontalcenter"
					case 63 cFunc = "styleleft"
					case 64 cFunc = "stylemarginleft"
					case 65 cFunc = "stylemarginright"
					case 66 cFunc = "stylemargintop"
					case 67 cFunc = "stylepos"
					case 68 cFunc = "stylesize"
					case 69 cFunc = "stylesizefull"
					case 70 cFunc = "styletable"
					case 71 cFunc = "styletablenoborder"
					case 72 cFunc = "styletablerows"
					case 73 cFunc = "styletextcenter"
					case 74 cFunc = "styletextleft"
					case 75 cFunc = "styletextright"
					case 76 cFunc = "styletop"
					case 77 cFunc = "stylewidth"
					case 78 cFunc = "stylezindex"
					case 79 cFunc = "tabmlstring"
					case 80 cFunc = "tabpop"
					case 81 cFunc = "tabpush"
					case 82 cFunc = "text"
					case 83 cFunc = "urlencode"
					case 84 cFunc = "webprint"
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_WEBLIB_WEBPAGE_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class weblib_webpageComponentView from ComponentViewParent
	 
		Title( T_CT_WEBLIB_WEBPAGE_IP_TITLE )	
		TextBox( T_CT_WEBLIB_WEBPAGE_IP_VALUE , :value)
		ListBox( T_CT_WEBLIB_WEBPAGE_IP_VALUE2 , :value2, 
				T_CT_WEBLIB_WEBPAGE_IP_VALUE2LIST )
		TextBox( T_CT_WEBLIB_WEBPAGE_IP_VALUE3 , :value3)
		TextBox( T_CT_WEBLIB_WEBPAGE_IP_VALUE4 , :value4)
		PageButtons()
