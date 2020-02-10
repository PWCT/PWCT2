load "globals.ring"
load "uilib.ring"
load "scanner.ring"
load "parser.ring"
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
