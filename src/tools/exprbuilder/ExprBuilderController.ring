load "ExprBuilderView.ring"
import System.GUI
if isMainSourceFile() { 
	new App
	{
		StyleFusion()
		open_window(:ExprBuilderController)
		exec()
	}
}
class ExprBuilderController from WindowsControllerParent
	oView = new ExprBuilderView
	aOperators = ["","+","-","*","/","%",">","<",">=","<=","=","!=","&&","||","!"]
	lError = False
	oView.win.setfixedwidth(oView.win.width())
	oView.win.setfixedheight(oView.win.height())
	cVariableName = ""
	oView.win.setwindowmodality(2)
	func processOperand cOperand,nType 
		if cOperand =NULL { 
			return cOperand 
		}
		switch nType { 
			case 1
				lDigit = isdigit(cOperand)
				if ! lDigit { 
					msginfo("Alert","Operand is not a number: " + cOperand)
					lError = True
				}
			case 2
				if ! substr(cOperand,'"') { 
					cOperand = '"' + cOperand + '"'
					elseif ! substr(cOperand,"'")
						cOperand = "'" + cOperand + "'"
					elseif ! substr( cOperand,"`")
						cOperand = "`" + cOperand + "`"
					else 
						msginfo("Alert","Literal is not supported: " + cOperand)
						lError = True
				}
		}
	return cOperand
	func getOperand1
		cOperand1 = oView.txtOperand1.text()
		nType = oView.comboOperand1Type.currentindex()
		cOperand1 = processOperand(cOperand1,nType)
	return cOperand1
	func getOperand2
		cOperand2 = oView.txtOperand2.text()
		nType = oView.comboOperand2Type.currentindex()
		cOperand2 = processOperand(cOperand2,nType)
	return cOperand2
	func addEvent  { 
		lError = False
		oView {
			cOperand1 = this.getOperand1()
			cOperand2 = this.getOperand2()
			if this.lError { 
				return 
			}
			nOperator = lstOperator.currentrow()
			cOperator = this.aOperators[nOperator]
			if nOperator > 1 { 
				this.setTextAllowUndo(editExpression.toplaintext() + cOperand1 + " " + cOperator + " " + cOperand2)
				else 
					this.setTextAllowUndo(editExpression.toplaintext() + cOperand1)
			}
		}
	} 
	func brackets  { 
		oView {
			oCursor = editExpression.textcursor()
			if oCursor.HasSelection( ) { 
				cSelected = oCursor.SelectedText()
				nStart = oCursor.selectionStart()
				nEnd = oCursor.selectionEnd()
				cStr = editExpression.toplaintext()
				oString  = this.ToQString(cStr)
				if left(cSelected,1) = "(" and right(cSelected,1) = ")" { 
					cStr = oString.mid(0,nStart)+substr(cSelected,2,len(cSelected)-2)+oString.mid(nEnd,-1)
					else 
						cStr = oString.mid(0,nStart)+"("+cSelected+")"+oString.mid(nEnd,-1)
				}
				this.setTextAllowUndo(cStr)
				return 
			}
			this.setTextAllowUndo("( " + editExpression.toplaintext() + " )")
		}
	} 
	func bracketsAtEnd  { 
		oView {
			this.setTextAllowUndo(editExpression.toplaintext() + "( )")
		}
	} 
	func clearExpression
		oView {
			editExpression.settext("")
		}
	func clearOperands  { 
		oView {
			txtOperand1.settext("")
			txtOperand2.settext("")
			lstOperator.setcurrentrow(1,3)
			comboOperand1Type.setcurrentindex(1)
			comboOperand2Type.setcurrentindex(1)
		}
	} 
	func toQString cStr
		oString = new QString2()
		oString.append(cStr)
		return oString
	func okEvent  { 
		if isParent() { 
			parent().oView.getVariableObject(cVariableName).setText(oView.editExpression.toplaintext())
		}
		cancelEvent()
	} 
	func cancelEvent  { 
		oView {
			win.close()
		}
	} 
	func UTF8Size cStr { 
		oString = ToQString(cStr)
		return oString. count() 
	} 
	func cursorPosition
		oCursor = oView.editExpression.textcursor()
		return oCursor.Position() 
	func setCursorPosition nIndex,lFlag
		oCursor = oView.editExpression.textcursor()
		oCursor.setposition(nIndex,lFlag)
		oView.editExpression.settextcursor(oCursor)
	func setTextAllowUndo cText { 
		#Get the Text Size
		nTextSize = UTF8Size(oView.editExpression.toplaintext())
		#Select All of the Text
		#Save the current position
		nPosStart = CursorPosition()
		SetCursorPosition(0,0)
		SetCursorPosition(nTextSize,1)
		#Set the new text using InsertPlainText() that support the Undo process
		oView.editExpression.InsertPlainText(cText)
		#Restore the Cursor Position
		SetCursorPosition(nPosStart,0)
	} 
	func undo
		oView {
			editExpression.undo()
		}
