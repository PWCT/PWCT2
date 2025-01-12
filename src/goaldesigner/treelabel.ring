/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Label Class for the Steps Tree Control 
**	Date : 2024.05.03
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TreeLabel from Qwidget 

	oDoc = new QTextDocument()
	
	aIcons = T_GD_STEPSTREEICONS

	oPad    = new QLabel(self)
	oLabel  = new QLabel(self)

	oLayout = new QHBoxLayout()
	oLayout.addwidget(oLabel)
	oLayout.addWidget(oPad)
	oLayout.setSpacing(0)
	oLayout.setContentsmargins(0,0,0,0)
	
	func init oParent
		super.init()
		setenabled(false)
		oPad.setText("")
		setLayout(oLayout)
		return self

	func setStyleSheet cStyle 
 		oLabel.setStyleSheet(cStyle)

	func styleSheet 
		return oLabel.stylesheet()

	func setText cText 
		oLabel.setText(cText)
		setWindowTitle(oLabel.pObject[1])

	func text 
		return oLabel.text()

	func setFont cFont 
		oLabel.setFont(cFont)

	func font 
		return oLabel.font()

	func setWidth nWidth 
		oLabel.setWidth(nWidth)

	func width 
		return oLabel.width() 

	func resize w,h
		oLabel.resize(w,h)

	func adjustsize 
		return oLabel.adjustsize()

	func setMaximumWidth nWidth 
		oLabel.setMaximumWidth(nWidth)

	func wrapIcon cText 
		return `<span style="background-color:rgb(235,235,235)">`+ cText +`</span> `

	func addIcon cText
		if ! C_STEPSTREE_NODEICON { return cText }
		oDoc.setHtml(cText)
		cPlainText = oDoc.toPlainText()
		lIcon = False
		for cRule in aIcons {
			if substr(cText,cRule[2]) and substr(cPlainText,cRule[2]) {
				if ! substr(cText, cRule[1]) {
					cText =  wrapIcon(cRule[1]) + cText
				}
				lIcon = True
				exit 
			}
		}
		if ! lIcon {
			if ! SubStr(cText,"⚙️") {
				cText = wrapIcon("⚙️") + cText
			}
		}
		return cText 

	func removeIcon cText
		if ! C_STEPSTREE_NODEICON { return cText }
		for cRule in aIcons {
			if substr(cText,cRule[1]) {
				cText = substr(cText,cRule[1],"")
				exit
			}
		}
		return cText

