/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  HTML Styles Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class HTMLStyles

	func text cText,cTextColor,cBackColor
		cHTML =  "<span style='background-color:#{backcolor}'><font color='#{textcolor}'>#{text}</font></span>"
		cHTML = substr(cHTML,"#{backcolor}",cBackColor)
		cHTML = substr(cHTML,"#{textcolor}",cTextColor)
		cHTML = substr(cHTML,"#{text}",cText)
		return cHTML

	func image cFile
		return "<img src='"+cFile+"'> "
