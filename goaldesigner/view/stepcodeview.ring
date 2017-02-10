/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Step Code View Class
**	Date : 2016.11.20
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class StepCodeView from QTextEdit

	font  nFontSize = 12	# The font object and the font size

	/*
		The next method set the Object Attributes
		Parameters : The Parent Window (QWidget)
		Output : Reference to the self object (Self)
	*/

	func init win
		super.init(win)
		font = new qFont("",0,0,0)
		font.setpixelsize(nFontSize)
		return self

	/*
		The next method increase the font size by 2 points
		Parameters : None
		Output : None
	*/

	func IncreaseFontSize
		if nFontSize >= 72 { return }
		nFontSize += 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

	/*
		The next method decrease the font size by 2 points
		Parameters : None
		Output : None 
	*/

	func DecreaseFontSize
		if nFontSize <= 12 { return }
		nFontSize -= 2	
		font.setpixelsize(nFontSize)
		SetFont(font)

