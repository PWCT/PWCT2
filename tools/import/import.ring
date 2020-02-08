load "../vsfgenerator/generator.ring"

load "globals.ring"
load "uilib.ring"
load "scanner.ring"
load "parser.ring"

func main

	oScanner = new Scanner {
		setFileName("test.ring")
		Start()
		PrintTokens()
	}

	oParser = new Parser {
		setTokens(oScanner.GetTokens())
	}
