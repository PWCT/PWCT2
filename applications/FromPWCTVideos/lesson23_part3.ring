while True { 
	? "Enter a number in the range [1,12]"
	give nNumber 
	nNumber = 0 + nNumber
	if checkNumber2(nNumber) { 
		for t= 1 to 12 step 1 { 
			? "" + nNumber + " x " + t + " = " + (nNumber*t)
		}
		else 
			? "The number is outside the range"
			exit 1
	}
}
func checkNumber nNumber
	if (nNumber >= 1) and (nNumber <= 12) { 
		return True
		else 
			return False
	}
func checkNumber2 nNumber
	return (nNumber >= 1) and (nNumber <= 12)
