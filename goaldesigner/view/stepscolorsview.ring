/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Steps Colors View Class
**	Date : 2017.02.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class StepsColorsView from WindowsViewParent

	win = new qWidget() {
	
		setWindowTitle(T_SC_WINDOWTITLE) # "Steps Colors Window"

		# Titles

		labelType =  new qlabel(win) {
			setText("Step Type")
			setFixedWidth(300)
		}

		labelTextColor =  new qlabel(win) {
			setText("Text Color")
		}

		labelBackColor =  new qlabel(win) {
			setText("Back Color")
		}

		LayoutTitles = new qHboxlayout() {
			Addwidget(labelType)
			Addwidget(LabelTextColor)
			Addwidget(labelbackColor)		
		}

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

		# Step Type : Allow Interaction

		labelAllowInteraction =  new qlabel(win) {
			setText(" The generated step Allows Interaction ")
			setFixedWidth(300)
		}
		btnAllowInteractionText = new qpushbutton(win) {
			setText("TextColor")
		}
		btnAllowInteractionbackcolor = new qpushbutton(win) {
			setText("BackColor")
		}

		LayoutHAllowInteraction = new qHboxlayout() {
			Addwidget(labelAllowInteraction)
			Addwidget(btnAllowInteractionText)
			Addwidget(btnAllowInteractionbackcolor)			
		}

		# Step Type : GeneratedLeaf

		labelLeaf =  new qlabel(win) {
			setText(" The generated step is Leaf")
			setFixedWidth(300)
		}
		btnLeafText = new qpushbutton(win) {
			setText("TextColor")
		}
		btnLeafbackcolor = new qpushbutton(win) {
			setText("BackColor")
		}

		LayoutHLeaf = new qHboxlayout() {
			Addwidget(labelLeaf)
			Addwidget(btnLeafText)
			Addwidget(btnLeafbackcolor)			
		}

		# Step Type : Written Data

		labelData =  new qlabel(win) {
			setText(" Written Data In Interaction Pages")
			setFixedWidth(300)
		}
		btnDataText = new qpushbutton(win) {
			setText("TextColor")
		}
		btnDatabackcolor = new qpushbutton(win) {
			setText("BackColor")
		}

		LayoutHData = new qHboxlayout() {
			Addwidget(labelData)
			Addwidget(btnDataText)
			Addwidget(btnDatabackcolor)			
		}

		btnClose = new qpushbutton(win) {
			setText("Close")
			setclickevent(Method(:closeAction))
		}

		LayoutAll = new qVBoxlayout() {
			Addlayout(layouttitles)
			Addlayout(layoutHComment)
			Addlayout(layoutHRoot)
			Addlayout(layoutHAllowInteraction)
			Addlayout(layoutHLeaf)
			Addlayout(layoutHData)
			AddWidget(btnClose)
		}
		
		setLayout(layoutAll)

		setwindowflags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint) 
	}
