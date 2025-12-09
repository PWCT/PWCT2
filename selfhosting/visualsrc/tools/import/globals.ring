#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose : Import Tool - Global Variables
#**	Date : 2020.02.15
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
#Error Messages (Parser)	
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
#Instruction Parameters Buffer
C_CLEARBUFFER = True
C_KEEPBUFFER = False
#Print Output
C_PRINTOUTPUT = True
C_IGNOREOUTPUT = False
#Logical Operators Text
T_RING2PWCT_LOT_AND = " AND "
T_RING2PWCT_LOT_OR = " OR "
T_RING2PWCT_LOT_NOT = " NOT "
