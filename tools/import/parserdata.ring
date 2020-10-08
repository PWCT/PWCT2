/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Parser
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class Parser

	# All Tokens Data
		aTokens 	= []
		nActiveToken 	= 0
		nTokensCount	= 0

	# The Current Token Data	
		aActiveToken	= []	
		nTokenType 	= 0
		cTokenValue	= ""
		nTokenIndex 	= 0

	# Parsing Output (List of Instructions) 	
		aParseTree	= []

	# Buffer for Instruction Data (Merge data from many tokens)
		cBuffer		= ""
		# Flag (Add token value to the buffer)
			# We disable this flag when we use IGNORENEWLINE
			lBufferFlag	= True
		# List of instructions parameters 
			aInstructionParameters	= []

	# More Data (Useful for Parsing State)
		nLineNumber 	= 1 
		nAssignmentFlag = 1 
		nClassStart 	= 0 
		nBraceFlag 	= 0 
		nNewObject 	= 0 
		nFuncCallOnly 	= 0 
		nControlStructureExpr 	= 0 
		nControlStructureBrace 	= 0 

	# Object provide methods determines what to generate (Instructions)	
		oTarget = new Target 

