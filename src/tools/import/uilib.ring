/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - User Interface Lib
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

C_WIDTH	= 12

func Width cText,nWidth
	return cText+Copy(" ",nWidth-len(cText))
