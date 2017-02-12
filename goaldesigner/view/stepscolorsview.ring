/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Steps Colors View Class
**	Date : 2017.02.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class StepsColorsView from WindowsViewParent

	win = new qWidget() {
	
		setWindowTitle(T_SC_WINDOWTITLE) # "Steps Colors Window"

		# Step Type : Comment 

		labelComment =  new qlabel(win) {
			setText(" This is a comment! ")
			setFixedWidth(300)
		}
		btnCommentText = new qpushbutton(win) {
			setText("TextColor")
		}
		btnCommentbackcolor = new qpushbutton(win) {
			setText("BackColor")
		}

		LayoutHComment = new qHboxlayout() {
			Addwidget(labelcomment)
			Addwidget(btncommentText)
			Addwidget(btnCommentbackcolor)			
		}

		# Step Type : Root 

		labelRoot =  new qlabel(win) {
			setText(" The first step generated from Interaction ")
			setFixedWidth(300)
		}
		btnRootText = new qpushbutton(win) {
			setText("TextColor")
		}
		btnRootbackcolor = new qpushbutton(win) {
			setText("BackColor")
		}

		LayoutHRoot = new qHboxlayout() {
			Addwidget(labelRoot)
			Addwidget(btnRootText)
			Addwidget(btnRootbackcolor)			
		}

							
		LayoutAll = new qVBoxlayout() {
			Addlayout(layoutHComment)
			Addlayout(layoutHRoot)
		}
		
		setLayout(layoutAll)

		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
	}
