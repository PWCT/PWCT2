/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  templates Component
**	Date : 2021.08.10
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


T_CT_TEMPLATES_IP_TITLE = "Templates Component"
T_CT_TEMPLATES_IP_VALUE = "Template"
T_CT_TEMPLATES_IP_VALUE2 = "No Comments"
T_CT_TEMPLATES_IP_VALUELIST = [
	"Hello World",
	"Say Hello",
	"Variables",
	"Loop and Condition"
]

T_CT_TEMPLATES_IP_VALUECODENOCOMMENTS = [
`
	? "Hello, World!"
`,
`
	? "Enter your name?" 
	give cName 
	? "Hello " + cName
`,
`
	x = "Hello" 
	? x 
	x = 5                   
	? x 
	x = 1.2                 
	? x 
	x = [1,2,3,4]           
	? x
	x = date()              
	? x 
	x = time()              
	? x 
	x = true                
	? x 
	x = false               
	? x 
	
`,
`
	for t=1 to 10
		? t
		if t=3 
			? "Three"
		ok
	next
`
]


T_CT_TEMPLATES_IP_VALUECODE = [
`
	//
	// Hello
	// Welcome to the Programming World!
	// In this lesson we will create our first program
	// From the Components Browser and using the (Print) Component 
	// We will print a "Hello, World!" message on the Screen
	//
	? "Hello, World!"
`,
`
	//
	// In the next steps we asks the User to enter his/her name
	// Then we print the "Hello" Message then the User Name
	//
	// Using the Components Browser
	// To print messages we will use the (Print) component
	// To get input from the User we will use the (Get Input) component
	//
	? "Enter your name?" 
	give cName 
	? "Hello " + cName
`,
`
	# x is a string
	x = "Hello" 
	? x 
	# x is a number (int)
	x = 5                   
	? x 
	# x is a number (double)
	x = 1.2                 
	? x 
    # x is a list
	x = [1,2,3,4]           
	# print list items
	? x
    # x is a string contains date                   
	x = date()              
	? x 
    # x is a string contains time
	x = time()              
	? x 
    # x is a number (logical value = 1)
	x = true                
	? x 
    # x is a number (logical value = 0)
	x = false               
	? x 
	
`,
`
	//
	// In the next steps we create a loop that count from one to ten
	// We print each number on the Screen 
	// Also we print a special message when we reach number Three
	//
	for t=1 to 10
		? t
		if t=3 
			? "Three"
		ok
	next
`
]
