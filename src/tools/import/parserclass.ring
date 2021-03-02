/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Parser
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ParserClass

	func mainclass
		/* Statement --> Class Identifier  [ From Identifier ] */
		if iskeyword(K_CLASS) {
			ClearTextBuffer()
			nexttoken()
			RemoveOpenedBraceFromBuffer()
			AddParameter(:ClassName)		
			IGNORENEWLINE() 
			ClearTextBuffer()
			if isidentifier() {
				nexttoken()
				/* [From Identifer] */
				if iskeyword(K_FROM) or isoperator2(OP_RANGE) or isoperator2(OP_LESS) {
					nexttoken()
					if namedotname() {
						/* Generate Code */
					else
						error(ERROR_PRENTCLASSNAME)
						return 0 
					}
					RemoveOpenedBraceFromBuffer()
					AddParameter(:ParentClassName)		
					ClearTextBuffer()
				else
					/* Set Parent Class Name In Classes Map */
				}
				nClassStart = 1 
				# We generate BlockEnd Two Times 
				# So if we are inside a class 
				# We end (Class Attributes) - First Block End
				# And (Class Methods) - Second Block End
				oTarget.GenerateBlockEnd(self)
				if nClassStart {
					oTarget.GenerateBlockEnd(self)
				}
				oTarget.GenerateDefineClass(self)
				oTarget.GenerateBlockStart(self)

				return bracesandend(1,K_ENDCLASS) 
			else
				error(ERROR_CLASSNAME)
				return 0 
			}
		}
		/* Statement --> Func|Def Identifier [PARALIST] */
		if iskeyword(K_FUNC) or iskeyword(K_DEF) {
			ClearTextBuffer()
			nexttoken()
			RemoveOpenedBraceFromBuffer()
			AddParameter(:FunctionName)		
			IGNORENEWLINE() 
			ClearTextBuffer()
			if isidentifier() {
				nexttoken()
				if isidentifier() or isoperator2(OP_FOPEN) {
					x = paralist()
				else
					x = 1 
				}
				oTarget.GenerateBlockEnd(self)
				RemoveOpenedBraceFromBuffer()
				AddParameter(:FunctionParameters)		
				oTarget.GenerateFuncPara(self)
				oTarget.GenerateBlockStart(self)
				if x {
					/* Support using { } around the function code and using 'end' after the content */
					x = bracesandend(0,K_ENDFUNC) 
				}
				return x 
			else
				error(ERROR_FUNCNAME)
				return 0 
			}
		}
		/* Statement --> Package Identifier { '.' Identifier } */
		if iskeyword(K_PACKAGE) {
			ClearTextBuffer()
			nexttoken()
			IGNORENEWLINE() 
			/* Generate Code */
			if namedotname() {
				oTarget.GenerateBlockEnd(self)
				oTarget.GenerateBlockEnd(self)
				RemoveOpenedBraceFromBuffer()
				AddParameter(:PackageName)		
				oTarget.GeneratePackage(self)
				/* Support using { } around the package code and using 'end' after the content */
				return bracesandend(1,K_ENDPACKAGE) 
			else
				return 0 
			}
		}
		/* Statement --> Private */
		if iskeyword(K_PRIVATE) {
			clearTextBuffer()
			nexttoken()
			if nClassStart = 1 {
				oTarget.GeneratePrivate(self)
				return 1 
			else
				error(ERROR_NOCLASSDEFINED)
				return 0 
			}
		}
		return stmt() 
	
