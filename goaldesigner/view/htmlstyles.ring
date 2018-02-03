/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  HTML Styles Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class HTMLStyles

	/*
		The next method return HTMLStyle for text with color and backcolor
		Parameters : Text, Color, BackColor as strings
		Output : HTML Style Code
	*/

	func text cText,cTextColor,cBackColor
		cHTML =  `<span style="background-color:#{backcolor}"><font color="#{textcolor}">#{text}</font></span>`
		cHTML = substr(cHTML,"#{backcolor}",cBackColor)
		cHTML = substr(cHTML,"#{textcolor}",cTextColor)
		cHTML = substr(cHTML,"#{text}",cText)
		return cHTML

	/*
		The next method return the HTML code for displaying an Image
		Parameters : The File Name
		Output : HTML code to display the Image file
	*/

	func image cFile
		return "<img src='"+cFile+"'> "



