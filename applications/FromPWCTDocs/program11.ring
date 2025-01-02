while True { 
	? ""
	? "Main Menu"
	? "--------------"
	? "(1) Say Hello"
	? "(2) About"
	? "(3) Exit"
	? ""
	give nOption
	switch nOption { 
		case 1
			? "Hello!"
		case 2
			? "Just a simple program!"
		case 3
			? "End of program!"
			shutdown(0)
		else
			? "bad option..."
	} 
} 
