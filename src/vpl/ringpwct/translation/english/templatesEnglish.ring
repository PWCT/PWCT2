/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  templates Component
**	Date : 2021.08.10
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


T_CT_TEMPLATES_IP_TITLE = "Templates Component"
T_CT_TEMPLATES_IP_VALUE = "Template"
T_CT_TEMPLATES_IP_VALUELIST = [
	"Hello World (Console)",
	"Say Hello (Console)",
	"Loop and Condition (Console)"
]
T_CT_TEMPLATES_IP_VALUECODE = [
`
	? "Hello, World!"
`,
`
	? "Enter your name?" 
	give cName 
	? "Hello " + cName
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
