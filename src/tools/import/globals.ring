/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Global Variables
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Tokens Table 
	C_TOKENTYPE 	= 1
	C_TOKENVALUE	= 2
	C_TOKENINDEX	= 3

# Token Type
	C_KEYWORD 	= 0
	C_OPERATOR 	= 1
	C_LITERAL 	= 2
	C_NUMBER 	= 3
	C_IDENTIFIER 	= 4
	C_ENDLINE 	= 5
	C_COMMENT	= 6

# Keywords List
	aKEYWORDS = [
		"IF","TO","OR","AND","NOT","FOR","FOREACH","NEW","FUNC", 
		"FROM","NEXT","LOAD","ELSE","SEE","WHILE","OK",
		"CLASS","RETURN","BUT", 
		"END","GIVE","BYE","EXIT","TRY","CATCH","DONE",
		"SWITCH","ON","OTHER","OFF", 
		"IN","LOOP","PACKAGE","IMPORT","PRIVATE","STEP","DO",
		"AGAIN","CALL","ELSEIF", 
		"PUT","GET","CASE","DEF","ENDFUNC","ENDCLASS","ENDPACKAGE",
		"ENDIF","ENDFOR","ENDWHILE","ENDSWITCH","ENDTRY",
		"FUNCTION","ENDFUNCTION","BREAK","CONTINUE", 
		"CHANGERINGKEYWORD","CHANGERINGOPERATOR","LOADSYNTAX"
	]

# Keywords Constants 	
	K_IF 			= 1
	K_TO 			= 2
	K_OR 			= 3
	K_AND 			= 4
	K_NOT 			= 5
	K_FOR 			= 6
	K_FOREACH		= 7
	K_NEW 			= 8
	K_FUNC 			= 9
	K_FROM 			= 10
	K_NEXT 			= 11
	K_LOAD 			= 12
	K_ELSE 			= 13
	K_SEE 			= 14
	K_WHILE 		= 15
	K_OK 			= 16
	K_CLASS 		= 17
	K_RETURN 		= 18
	K_BUT 			= 19
	K_END 			= 20
	K_GIVE 			= 21
	K_BYE 			= 22
	K_EXIT 			= 23
	K_TRY 			= 24
	K_CATCH 		= 25
	K_DONE 			= 26
	K_SWITCH 		= 27
	K_ON 			= 28
	K_OTHER			= 29
	K_OFF 			= 30
	K_IN 			= 31
	K_LOOP 			= 32
	K_PACKAGE 		= 33
	K_IMPORT 		= 34
	K_PRIVATE 		= 35
	K_STEP 			= 36
	K_DO 			= 37
	K_AGAIN 		= 38
	K_CALL 			= 39
	K_ELSEIF 		= 40
	K_PUT 			= 41
	K_GET 			= 42
	K_CASE 			= 43
	K_DEF 			= 44
	K_ENDFUNC 		= 45
	K_ENDCLASS 		= 46
	K_ENDPACKAGE 		= 47
	K_ENDIF			= 48
	K_ENDFOR		= 49
	K_ENDWHILE		= 50
	K_ENDSWITCH		= 51
	K_ENDTRY		= 52
	K_FUNCTION		= 53
	K_ENDFUNCTION		= 54
	K_BREAK			= 55
	K_CONTINUE		= 56
	K_CHANGERINGKEYWORD 	= 57
	K_CHANGERINGOPERATOR 	= 58
	K_LOADSYNTAX 		= 59

# Operators 

	OP_PLUS 	= 1 
	OP_MINUS 	= 2
	OP_MUL 		= 3
	OP_DIV 		= 4
	OP_REM 		= 5
	OP_DOT 		= 6
	OP_FOPEN 	= 7
	OP_FCLOSE 	= 8
	OP_EQUAL 	= 9
	OP_COMMA 	= 10
	OP_NOT 		= 11
	OP_GREATER 	= 12
	OP_LESS 	= 13
	OP_LOPEN 	= 14
	OP_LCLOSE 	= 15
	OP_RANGE 	= 16
	OP_BRACEOPEN 	= 17
	OP_BRACECLOSE 	= 18
	OP_BITAND 	= 19
	OP_BITOR 	= 20
	OP_BITNOT 	= 21
	OP_XOR 		= 22

# Error Messages (Parser)	
	ERROR_PARALIST = "Error (C1) : Error in parameters list, expected identifier"
	ERROR_CLASSNAME = "Error (C2) : Error in class name"
	ERROR_OK = "Error (C3) : Unclosed control strucutre, 'ok' is missing"
	ERROR_END = "Error (C4) : Unclosed control strucutre, 'end' is missing"
	ERROR_NEXT = "Error (C5) : Unclosed control strucutre, next is missing"
	ERROR_FUNCNAME = "Error (C6) : Error in function name"
	ERROR_LISTITEM = "Error (C7) : Error in list items"
	ERROR_MISSPARENTHESES = "Error (C8) : Parentheses ')' is missing "
	ERROR_MISSBRACKETS = "Error (C9) : Brackets ']' is missing "
	ERROR_PRENTCLASSNAME = "Error (C10) : Error in parent class name"
	ERROR_EXPROPERATOR = "Error (C11) : Error in expression operator"
	ERROR_NOCLASSDEFINED = "Error (C12) :No class definition"
	ERROR_VARNAME = "Error (C13) : Error in variable name"
	ERROR_NOCATCH = "Error (C14) : Try/Catch miss the Catch keyword!"
	ERROR_NODONE = "Error (C15) : Try/Catch miss the Done keyword!"
	ERROR_SWITCHEXPR = "Error (C16) : Error in Switch statement expression!"
	ERROR_SWITCHOFF = "Error (C17) : Switch statement without OFF"
	ERROR_BRACESNOTCLOSED = "Error (C18) : Missing closing brace for the block opened!"
	ERROR_NUMERICOVERFLOW = "Error (C19) : Numeric Overflow!"
	ERROR_PACKAGENAME = "Error (C20) : Error in package name"
	ERROR_AGAIN = "Error (C21) : Unclosed control strucutre, 'again' is missing"
	ERROR_FUNCREDEFINE = "Error (C22) : Function redefinition, function is already defined!"
	ERROR_USINGBRACTAFTERNUM = "Error (C23) : Using '(' after number!"
	ERROR_PARENTLIKESUBCLASS = "Error (C24) : The parent class name is identical to the subclass name"
	ERROR_ACCESSSELFREF = "Error (C25) : Trying to access the self reference after the object name"
	ERROR_CLASSREDEFINE = "Error (C26) : Class redefinition, class is already defined!"
	RING_PARSER_WARNING_EXITOUTSIDELOOP = "Warning (W6) : Using the EXIT command outside loop!"
	RING_PARSER_WARNING_LOOPOUTSIDELOOP = "Warning (W7) : Using the LOOP command outside loop"

# Instruction Parameters Buffer 

	C_CLEARBUFFER = True 
	C_KEEPBUFFER  = False

# Print Output 
	
	C_PRINTOUTPUT  = True
	C_IGNOREOUTPUT = False  
