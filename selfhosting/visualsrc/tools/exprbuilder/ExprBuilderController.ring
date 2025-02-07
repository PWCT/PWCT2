load "ExprBuilderView.ring"
import System.GUI
if isMainSourceFile() { 
	new App
	{
		StyleFusion()
		open_window(:ExprBuilderController)
		exec()
	}
	else
		if T_LAYOUTDIRECTION { 
			load "arabic.ring"
			else
				load "english.ring"
		} 
} 
class ExprBuilderController from WindowsControllerParent
	oView = new ExprBuilderView
	aOperators = ["","+","-","*","/","%",">","<",">=","<=","=","!=","&&","||","!"]
	lError = False
	cVariableName = ""
	oView.win.setwindowmodality(2)
	func processOperand cOperand,nType { 
		if cOperand = NULL { 
			return cOperand
		} 
		switch nType { 
			case 1
				lDigit = isdigit(cOperand)
				if !lDigit { 
					msginfo("Alert","Operand is not a number: "+cOperand)
					lError = True
				} 
			case 2
				if !substr(cOperand,'"') { 
					cOperand = '"'+cOperand+'"'
					elseif !substr(cOperand,"'")
						cOperand = "'"+cOperand+"'"
					elseif !substr(cOperand,"`")
						cOperand = "`"+cOperand+"`"
					else
						msginfo("Alert","Literal is not supported: "+cOperand)
						lError = True
				} 
		} 
		return cOperand
	} 
	func getOperand1  { 
		cOperand1 = oView.txtOperand1.text()
		nType = oView.comboOperand1Type.currentindex()
		cOperand1 = processOperand(cOperand1,nType)
		return cOperand1
	} 
	func getOperand2  { 
		cOperand2 = oView.txtOperand2.text()
		nType = oView.comboOperand2Type.currentindex()
		cOperand2 = processOperand(cOperand2,nType)
		return cOperand2
	} 
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
				this.setTextAllowUndo(editExpression.toplaintext()+cOperand1+" "+cOperator+" "+cOperand2)
				else
					this.setTextAllowUndo(editExpression.toplaintext()+cOperand1)
			} 
		}
	} 
	func brackets  { 
		oView {
			oCursor = editExpression.textcursor()
			if oCursor.HasSelection() { 
				cSelected = oCursor.SelectedText()
				nStart = oCursor.selectionStart()
				nEnd = oCursor.selectionEnd()
				cStr = editExpression.toplaintext()
				oString = this.ToQString(cStr)
				if left(cSelected,1) = "(" AND right(cSelected,1) = ")" { 
					cStr = oString.mid(0,nStart)+substr(cSelected,2,len(cSelected)-2)+oString.mid(nEnd,-1)
					else
						cStr = oString.mid(0,nStart)+"("+cSelected+")"+oString.mid(nEnd,-1)
				} 
				this.setTextAllowUndo(cStr)
				return 
			} 
			this.setTextAllowUndo("( "+editExpression.toplaintext()+" )")
		}
	} 
	func bracketsAtEnd  { 
		oView {
			this.setTextAllowUndo(editExpression.toplaintext()+"( )")
		}
	} 
	func clearExpression  { 
		oView {
			editExpression.settext("")
		}
	} 
	func clearOperands  { 
		oView {
			txtOperand1.settext("")
			txtOperand2.settext("")
			lstOperator.setcurrentrow(1,3)
			comboOperand1Type.setcurrentindex(3)
			comboOperand2Type.setcurrentindex(3)
		}
	} 
	func toQString cStr { 
		oString = new QString2()
		oString.append(cStr)
		return oString
	} 
	func okEvent  { 
		if isParent() { 
			parent().oView.getVariableObject(cVariableName).setText(oView.editExpression.toplaintext())
		} 
		cancelEvent()
	} 
	func cancelEvent  { 
		closeAction()
	} 
	func UTF8Size cStr { 
		oString = ToQString(cStr)
		return oString. count() 
	} 
	func cursorPosition  { 
		oCursor = oView.editExpression.textcursor()
		return oCursor. Position() 
	} 
	func setCursorPosition nIndex,lFlag { 
		oCursor = oView.editExpression.textcursor()
		oCursor.setposition(nIndex,lFlag)
		oView.editExpression.settextcursor(oCursor)
	} 
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
	func undo  { 
		oView {
			editExpression.undo()
		}
	} 
	func translateUI  { 
		oView {
			win.setwindowtitle(T_EXPRBUILDER_EXPRESSIONBUILDER)
			lblOperand1.settext(T_EXPRBUILDER_OPERAND1)
			lblOperator.settext(T_EXPRBUILDER_OPERATOR)
			lblOperand2.settext(T_EXPRBUILDER_OPERAND2)
			lblExpression.settext(T_EXPRBUILDER_EXPRESSION)
			btnAdd.settext(T_EXPRBUILDER_ADD)
			btnClearOperands.settext(T_EXPRBUILDER_CLEAROPERANDS)
			btnBrackets.settext(T_EXPRBUILDER_BRACKETSAROUNDEXPRESSION)
			btnBracketsAtEnd.settext(T_EXPRBUILDER_EXPRESSIONBRACKETS)
			btnUndo.settext(T_EXPRBUILDER_UNDO)
			btnOk.settext(T_EXPRBUILDER_OK)
			btnCancel.settext(T_EXPRBUILDER_CANCEL)
			btnClear.settext(T_EXPRBUILDER_CLEAREXPRESSION)
			lstOperator.clear()
			lstOperator.addList(T_EXPRBUILDER_OPERATORS)
			comboOperand1Type.clear()
			comboOperand2Type.clear()
			for t in T_EXPRBUILDER_OPERANDTYPE step 1 { 
				comboOperand1Type.additem(t,0)
				comboOperand2Type.additem(t,0)
			} 
			comboOperand1Type.setcurrentindex(3)
			comboOperand2Type.setcurrentindex(3)
			lstOperator.setcurrentrow(2,2)
		}
	} 
private
