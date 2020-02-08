load "../vsfgenerator/generator.ring"

load "globals.ring"
load "uilib.ring"
load "scanner.ring"
load "parser.ring"

func main
	oScanner = new Scanner {
		setFileName("test.ring")
		GenTokens()
		PrintTokens()
	}
