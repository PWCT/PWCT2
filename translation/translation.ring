/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Translation
**	Date : 2019.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "english.ring"

# Check Arabic Translation
	for item in sysargv item = lower(item) next 
	if find(sysargv, :arabic) {
		eval( ' load "arabic.ring" ' )
	}
