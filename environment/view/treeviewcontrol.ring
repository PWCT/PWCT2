/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  TreeViewControl Class
**	Date : 2020.01.08
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TreeViewControl from qtreeview

	font  nFontSize = 12	

	lUseFontObject = False

	func init win
		super.init(win)
		if lUseFontObject {
			font = new qFont("arial",0,0,0)
			font.setpixelsize(nFontSize)
		}
		setUniformRowHeights(True)
		setAnimated(False)
		UpdateFontSize()
		return self

	func IncreaseFontSize
		if nFontSize >= 72 { return }
		nFontSize += 2	
		UpdateFontSize()

	func DecreaseFontSize
		if nFontSize <= 12 { return }
		nFontSize -= 2	
		UpdateFontSize()

	func UpdateFontSize 
		nRealFontSize = nFontSize
		if PWCTISMobile(:TreeViewFont) {
			nRealFontSize += 4
		}
		if lUseFontObject {
			font.setpixelsize(nRealFontSize)
			SetFont(font)
		}
		setStyleSheet('font-size: '+nRealFontSize+'pt;' )
		show()
