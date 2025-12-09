#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose : Import Tool - Parser
#**	Date : 2020.02.15
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class ParserClass
	func mainclass  { 
		#/* Statement --> Class Identifier  [ From Identifier ] */
		if iskeyword(K_CLASS) { 
			nFromCounter++
			ClearTextBuffer()
			nexttoken()
			RemoveOpenedBraceFromBuffer()
			AddParameter(:ClassName)
			IGNORENEWLINE()
			ClearTextBuffer()
			if isidentifier() { 
				#/* [From Identifer] */
				nexttoken()
				if iskeyword(K_FROM) OR isoperator2(OP_RANGE) OR isoperator2(OP_LESS) { 
					nexttoken()
					if namedotname() { 
						#/* Generate Code */
						else
							nFromCounter--
							error(ERROR_PRENTCLASSNAME)
							return False
					} 
					RemoveOpenedBraceFromBuffer()
					AddParameter(:ParentClassName)
					ClearTextBuffer()
					else
						#/* Set Parent Class Name In Classes Map */
				} 
				nClassStart = 1
				#We generate BlockEnd Two Times
				#So if we are inside a class
				#We end (Class Attributes) - First Block End
				#And (Class Methods) - Second Block End
				oTarget.GenerateBlockEnd(self)
				if nClassStart { 
					oTarget.GenerateBlockEnd(self)
				} 
				oTarget.GenerateDefineClass(self)
				oTarget.GenerateBlockStart(self)
				nFromCounter--
				return bracesandend(1 , K_ENDCLASS ) 
				else
					nFromCounter--
					error(ERROR_CLASSNAME)
					return False
			} 
		} 
		#/* Statement --> Func|Def Identifier [PARALIST] */
		if iskeyword(K_FUNC) OR iskeyword(K_DEF) OR iskeyword(K_FUNCTION) { 
			ClearTextBuffer()
			nexttoken()
			RemoveOpenedBraceFromBuffer()
			AddParameter(:FunctionName)
			IGNORENEWLINE()
			ClearTextBuffer()
			if isidentifier() { 
				nexttoken()
				ClearTextBuffer()
				if isidentifier() OR isoperator2(OP_FOPEN) { 
					x = paralist()
					else
						x = 1
				} 
				oTarget.GenerateBlockEnd(self)
				RemoveOpenedBraceFromBuffer()
				AddParameterFromSecondBuffer(:FunctionParameters)
				oTarget.GenerateFuncPara(self)
				oTarget.GenerateBlockStart(self)
				if x { 
					#/* Support using { } around the function code and using 'end' after the content */
					x = bracesandend(0,K_ENDFUNC)
				} 
				ClearTextBuffer()
				return x
				else
					error(ERROR_FUNCNAME)
					return False
			} 
		} 
		#/* Statement --> Package Identifier { '.' Identifier } */
		if iskeyword(K_PACKAGE) { 
			ClearTextBuffer()
			nexttoken()
			#/* Generate Code */
			IGNORENEWLINE()
			if namedotname() { 
				oTarget.GenerateBlockEnd(self)
				oTarget.GenerateBlockEnd(self)
				RemoveOpenedBraceFromBuffer()
				AddParameter(:PackageName)
				oTarget.GeneratePackage(self)
				#/* Support using { } around the package code and using 'end' after the content */
				return bracesandend(1 , K_ENDPACKAGE ) 
				else
					return False
			} 
		} 
		#/* Statement --> Private */
		if iskeyword(K_PRIVATE) { 
			clearTextBuffer()
			nexttoken()
			if nClassStart = 1 { 
				oTarget.GeneratePrivate(self)
				return True
				else
					error(ERROR_NOCLASSDEFINED)
					return False
			} 
		} 
		return stmt() 
	} 
private
