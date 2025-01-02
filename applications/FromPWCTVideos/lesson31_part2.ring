# Get a random number from 1 to 20
	nNumber = random(19)
	nNumber++
nChoice = -1
while nChoice != nNumber { 
	? "Guess a number from 1 to 20"
	give nChoice 
	nChoice = 0 + nChoice
	if nChoice < nNumber  { 
		? "Enter a larger number"
		elseif nChoice > nNumber
			? "Enter a smaller number"
	}
}
if nChoice = nNumber  { 
	? "You guessed the correct number"
}
