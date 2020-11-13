/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Main File
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/
load "guilib.ring"
load "stdlibcore.ring"
load "globals.ring"
load "uilib.ring"
load "scanner.ring"
load "parser.ring"
load "target.ring"
load "generator.ring"

if isMainSourceFile() {
	ImportFile("input/test.ring","output/test.pwct",C_PRINTOUTPUT)
}

func ImportFile cInputFile,cOutputFile,lPrint

	oScanner = new Scanner {
		setFileName(cInputFile)
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
	}
