x = 0
y = 10
? "Test 1"
if (x = 0 AND nice()) AND (y = 10 AND nice()) { 
	? "Great"
} 
? "Test 2"
if (x = 1 AND nice()) AND (y = 10 AND nice()) { 
	? "Great"
} 
? "Test 3"
if (x = 0 AND nice()) OR (y = 10 AND nice()) { 
	? "Great"
} 
func nice  { 
	? "Nice"
	return 1
} 
