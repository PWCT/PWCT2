/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Main File
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "globals.ring"
load "uilib.ring"
load "scanner.ring"
load "parser.ring"
load "target.ring"
load "generator.ring"

func main

	oScanner = new Scanner {
		setFileName("test.ring")
		Start()
		PrintTokens()
	}

	oParser = new Parser {
		setTokens(oScanner.GetTokens())
		Start()
		PrintParseTree()
	}

	oGenerator = new Generator {
		setParseTree(oParser.GetParseTree())
		Start()
	}
