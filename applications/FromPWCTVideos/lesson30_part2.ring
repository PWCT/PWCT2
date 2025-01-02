? checkChar("a")
? checkChar("A")
? checkChar(" ")
? checkChar("5")
? checkChar("abc")
? checkChar("abcABC")
func checkChar value
	lAlpha = isalpha(value)
	lDigit = isdigit(value)
	lLower = islower(value)
	lSpace = isspace(value)
	lUpper = isupper(value)
	? lAlpha
	? lDigit
	? lLower
	? lSpace
	? lUpper
