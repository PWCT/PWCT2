load "../vsfgenerator/generator.ring"

load "globals.ring"
load "general.ring"
load "scanner.ring"

func main
	aList = GetTokens("test.ring")
	PrintTokens(aList)
	
