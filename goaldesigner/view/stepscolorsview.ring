/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Steps Colors View Class
**	Date : 2017.02.12
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class StepsColorsView from WindowsViewParent

	win = new qWidget() {
	
		setLayoutDirection(T_LAYOUTDIRECTION)
		setWindowTitle(T_SC_WINDOWTITLE) # "Steps Colors Window"

		# Titles

		labelType =  new qlabel(win) {
			setText(T_SC_STEPTYPE) # "Step Type"
			setFixedWidth(300)
		}

		labelTextColor =  new qlabel(win) {
			setText(T_SC_TEXTCOLOR) # "Text Color"
		}

		labelBackColor =  new qlabel(win) {
			setText(T_SC_BACKCOLOR) # "Back Color"
		}

		LayoutTitles = new qHboxlayout() {
			Addwidget(labelType)
			Addwidget(LabelTextColor)
			Addwidget(labelbackColor)		
		}

		# Step Type : Comment 

		labelComment =  new qlabel(win) {
			setText(T_SC_TYPECOMMENT) # " This is a comment! "
			setFixedWidth(300)
		}
		btnCommentText = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_COMMENT_TEXT )
			setClickevent(Method("ColorAction(1)"))
		}
		btnCommentbackcolor = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_COMMENT_BACKCOLOR )
			setClickevent(Method("ColorAction(2)"))
		}

		LayoutHComment = new qHboxlayout() {
			Addwidget(labelcomment)
			Addwidget(btncommentText)
			Addwidget(btnCommentbackcolor)			
		}

		# Step Type : Root 

		labelRoot =  new qlabel(win) {
			setText(T_SC_TYPEROOT) # " The first step generated from Interaction "
			setFixedWidth(300)
		}
		btnRootText = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_ROOT_TEXT )
			setClickevent(Method("ColorAction(3)"))
		}
		btnRootbackcolor = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_ROOT_BACKCOLOR )
			setClickevent(Method("ColorAction(4)"))
		}

		LayoutHRoot = new qHboxlayout() {
			Addwidget(labelRoot)
			Addwidget(btnRootText)
			Addwidget(btnRootbackcolor)			
		}

		# Step Type : Allow Interaction

		labelAllowInteraction =  new qlabel(win) {
			setText(T_SC_TYPEALLOW) # "The generated step Allows Interaction"
			setFixedWidth(300)
		}
		btnAllowInteractionText = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_ALLOWINTERACTION_TEXT )
			setClickevent(Method("ColorAction(5)"))
		}
		btnAllowInteractionbackcolor = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_ALLOWINTERACTION_BACKCOLOR )
			setClickevent(Method("ColorAction(6)"))
		}

		LayoutHAllowInteraction = new qHboxlayout() {
			Addwidget(labelAllowInteraction)
			Addwidget(btnAllowInteractionText)
			Addwidget(btnAllowInteractionbackcolor)			
		}

		# Step Type : GeneratedLeaf

		labelLeaf =  new qlabel(win) {
			setText(T_SC_TYPELEAF) # "The generated step is Leaf"
			setFixedWidth(300)
		}
		btnLeafText = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_INFO_TEXT )
			setClickevent(Method("ColorAction(7)"))
		}
		btnLeafbackcolor = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_INFO_BACKCOLOR )
			setClickevent(Method("ColorAction(8)"))
		}

		LayoutHLeaf = new qHboxlayout() {
			Addwidget(labelLeaf)
			Addwidget(btnLeafText)
			Addwidget(btnLeafbackcolor)			
		}

		# Step Type : Written Data

		labelData =  new qlabel(win) {
			setText(T_SC_TYPEDATA) # "Written Data In Interaction Pages"
			setFixedWidth(300)
		}
		btnDataText = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_DATA_TEXT )
			setClickevent(Method("ColorAction(9)"))
		}
		btnDatabackcolor = new qpushbutton(win) {
			setText(" :: ")
			setStyleSheet("background-color:" + C_STEPCOLOR_DATA_BACKCOLOR )
			setClickevent(Method("ColorAction(10)"))
		}

		LayoutHData = new qHboxlayout() {
			Addwidget(labelData)
			Addwidget(btnDataText)
			Addwidget(btnDatabackcolor)			
		}

		btnClose = new qpushbutton(win) {
			setText(T_SC_CLOSE) # "Close"
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
