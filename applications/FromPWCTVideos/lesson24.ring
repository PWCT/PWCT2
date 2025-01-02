load "lesson24_mylib.ring"
title("Main Menu")
aOptions = ["1 - Say Hello","2 - About","3 - Exit"]
while True { 
	nOption = menu(aOptions)
	switch nOption { 
		case 1
			line()
			sayHello()
			line()
		case 2
			? "Using Libraries "
		case 3
			exit 1
	}
}
