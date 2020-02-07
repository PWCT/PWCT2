load "../vsfgenerator/generator.ring"

load "globals.ring"
load "general.ring"
load "scanner.ring"

func main
	oScanner = new Scanner {
		setFileName("test.ring")
		GenTokens()
		PrintTokens()
	}
	
