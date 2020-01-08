/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  TreeViewControl Class
**	Date : 2020.01.08
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TreeViewControl from qtreeview

	font  nFontSize = 12	

	func init win
		super.init(win)
		font = new qFont("arial",0,0,0)
		font.setpixelsize(nFontSize)
		setUniformRowHeights(True)
		setAnimated(False)
		return self

	func IncreaseFontSize
		if nFontSize >= 72 { return }
		nFontSize += 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

	func DecreaseFontSize
		if nFontSize <= 12 { return }
		nFontSize -= 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

	func PrepareFont
		font.setpixelsize(nFontSize)
		SetFont(font)

	func UpdateFontSize 
		font.setpixelsize(nFontSize)
		SetFont(font)
		show()
