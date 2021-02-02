/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  fileclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class fileclassComponentController from ComponentControllerParent 

	oView = new fileclassComponentView

	func GenerateAction 

		 
				switch Variable(:Value2) {
					
					case 1 cFunc = "clearerr"
					case 2 cFunc = "close"
					case 3 cFunc = "dir"
					case 4 cFunc = "eof"
					case 5 cFunc = "error"
					case 6 cFunc = "exists"
					case 7 cFunc = "flush"
					case 8 cFunc = "fread"
					case 9 cFunc = "fwrite"
					case 10 cFunc = "getc"
					case 11 cFunc = "getpos"
					case 12 cFunc = "gets"
					case 13 cFunc = "open"
					case 14 cFunc = "perror"
					case 15 cFunc = "putc"
					case 16 cFunc = "puts"
					case 17 cFunc = "read"
					case 18 cFunc = "remove"
					case 19 cFunc = "rename"
					case 20 cFunc = "reopen"
					case 21 cFunc = "rewind"
					case 22 cFunc = "seek"
					case 23 cFunc = "setpos"
					case 24 cFunc = "tell"
					case 25 cFunc = "tempfile"
					case 26 cFunc = "ungetc"
					case 27 cFunc = "write"
		
		
				}
		
				# Get the function Name 
					cFuncName = T_CT_FILECLASS_IP_VALUE2LIST [Variable(:Value2)]
		
				# Generate Step and Code using common method 
					common_callobjectmethod(cFunc,cFuncName)
				

		return True 

class fileclassComponentView from ComponentViewParent
	 
		Title( T_CT_FILECLASS_IP_TITLE )	
		TextBox( T_CT_FILECLASS_IP_VALUE , :value)
		ListBox( T_CT_FILECLASS_IP_VALUE2 , :value2, 
				T_CT_FILECLASS_IP_VALUE2LIST )
		TextBox( T_CT_FILECLASS_IP_VALUE3 , :value3)
		TextBox( T_CT_FILECLASS_IP_VALUE4 , :value4)
		PageButtons()
