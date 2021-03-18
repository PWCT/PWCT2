/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Lib
**	Date : 2021.03.18
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

func ImportFile cInputFile,cOutputFile,lPrint

	oScanner = new Scanner {
		setCode(Read(cInputFile))
		Start()
		if lPrint {
			PrintTokens()
		}
	}

	oParser = new Parser {
		setTokens(oScanner.GetTokens())
		Start()
		if lPrint {
			PrintParseTree()
		}
	}

	oGenerator = new Generator {
		setFileName(cOutputFile)
		setParseTree(oParser.GetParseTree())
		Start()
		WriteVisualSourceFile()
	}

func RingCode2PWCT cCode 
	aOutput = []
	oScanner = new Scanner {
		setCode(cCode)
		Start()
	}
	oParser = new Parser {
		setTokens(oScanner.GetTokens())
		Start()
	}
	oGenerator = new Generator {
		setFileName(cOutputFile)
		setParseTree(oParser.GetParseTree())
		Start()
		aOutput[:StepsTreeTable] = GetStepsTreeTable()
		aOutput[:InteractionsTable] = GetInteractionsTable()
		aOutput[:StepsID] = GetStepsID()
		aOutput[:InteractionsID] = GetInteractionsID()		
	}
	return aOutput
