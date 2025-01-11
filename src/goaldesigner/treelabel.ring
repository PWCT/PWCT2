/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Label Class for the Steps Tree Control 
**	Date : 2024.05.03
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TreeLabel from QLabel 

	
	oDoc = new QTextDocument()
	
	aIcons = T_GD_STEPSTREEICONS

	func init oParent
		super.init(oParent)
		setenabled(false)
		return self

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

	func setText cText
		super.setText(cText)
