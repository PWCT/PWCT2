/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  weblib_stylefunctionsclass Component
**	Date : 2018.03.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class weblib_stylefunctionsclassComponentController from ComponentControllerParent 

	oView = new weblib_stylefunctionsclassComponentView

	aAllowEmptyValue = [:value3,:value4]

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "styleabsolute"
					case 2 cFunc = "stylebackcolor"
					case 3 cFunc = "stylecolor"
					case 4 cFunc = "styledivcenter"
					case 5 cFunc = "stylefixed"
					case 6 cFunc = "stylefloatleft"
					case 7 cFunc = "stylefloatright"
					case 8 cFunc = "stylefontsize"
					case 9 cFunc = "stylegradient"
					case 10 cFunc = "styleheight"
					case 11 cFunc = "stylehorizontalcenter"
					case 12 cFunc = "styleleft"
					case 13 cFunc = "stylemarginleft"
					case 14 cFunc = "stylemarginright"
					case 15 cFunc = "stylemargintop"
					case 16 cFunc = "stylepos"
					case 17 cFunc = "stylesize"
					case 18 cFunc = "stylesizefull"
					case 19 cFunc = "styletable"
					case 20 cFunc = "styletablenoborder"
					case 21 cFunc = "styletablerows"
					case 22 cFunc = "styletextcenter"
					case 23 cFunc = "styletextleft"
					case 24 cFunc = "styletextright"
					case 25 cFunc = "styletop"
					case 26 cFunc = "stylewidth"
					case 27 cFunc = "stylezindex"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_WEBLIB_STYLEFUNCTIONSCLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class weblib_stylefunctionsclassComponentView from ComponentViewParent
	 
		Title( T_CT_WEBLIB_STYLEFUNCTIONSCLASS_IP_TITLE )	
		TextBox( T_CT_WEBLIB_STYLEFUNCTIONSCLASS_IP_VALUE , :value)
		ListBox( T_CT_WEBLIB_STYLEFUNCTIONSCLASS_IP_VALUE2 , :value2, 
				T_CT_WEBLIB_STYLEFUNCTIONSCLASS_IP_VALUE2LIST )
		TextBox( T_CT_WEBLIB_STYLEFUNCTIONSCLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_WEBLIB_STYLEFUNCTIONSCLASS_IP_VALUE4 , :value4)
		PageButtons()
