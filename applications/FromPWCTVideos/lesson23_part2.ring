while True { 
	? "Enter a number in the range [1,12]"
	give nNumber 
	nNumber = 0 + nNumber
	if (nNumber >= 1) and (nNumber <= 12) { 
		for t= 1 to 12 step 1 { 
			? "" + nNumber + " x " + t + " = " + (nNumber*t)
		}
		else 
			? "The number is outside the range"
			exit 1
	}
}
