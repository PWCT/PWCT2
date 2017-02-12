/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Steps Colors View Class
**	Date : 2017.02.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class StepsColorsView from WindowsViewParent

	win = new qWidget() {
		resize(400,400)
		setWindowTitle(T_SC_WINDOWTITLE) # "Steps Colors Window"

		labelComment =  new qlabel(win) {
			setText(" This is a comment! ")
		}
		btnCommentText = new qpushbutton(win) {
			setText("TextColor")
		}
		btnCommentbackcolor = new qpushbutton(win) {
			setText("BackColor")
		}

		LayoutH = new qHboxlayout() {
			Addwidget(labelcomment)
			Addwidget(btncommentText)
			Addwidget(btnCommentbackcolor)			
		}

		LayoutAll = new qVBoxlayout() {
			Addlayout(layoutH)
		}
		
		setLayout(layoutAll)
	}
