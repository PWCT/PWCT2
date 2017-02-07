/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment View Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class EnvironmentView from WindowsViewParent

	# Attributes
	Tree1   oFile 

	# Create the window and the Controls
		win = new qMainWindow()
		{
			setLayoutDirection(T_LAYOUTDIRECTION)
			setWindowTitle("Programming Without Coding Technology")
			self.CreateMenuBar(win)
			self.CreateToolbar(win)
			self.CreateStatusBar(win)
			self.CreateFilesManager(win)
			self.CreateGoalDesigner(win)
			setwinicon(win,"images/pwct.png")
			showmaximized()	
		}

	func CreateMenuBar win
		menu1 = new qmenubar(win) {		
			subFile = addmenu("File")
			subEdit = addmenu("Edit")
			subView = addmenu("View")
			subProgram = addmenu("Program")
			subHelp = addmenu("Help")
			subFile { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+n"))
					setbtnimage(self,"images/new.png")
					settext("New")
					setclickevent(Method(:NewAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+o"))
					setbtnimage(self,"images/open.png") 
					settext("Open")
					setclickevent(Method(:OpenAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+s"))
					setbtnimage(self,"images/save.png")
					settext("Save")
					setclickevent(Method(:SaveAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+e"))
					setbtnimage(self,"images/saveas.png")
					settext("Save As")
					setclickevent(Method(:SaveAsAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+p"))
					setbtnimage(self,"images/print.png")
					settext("Print to PDF")
					setclickevent(Method(:PrintAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qaction(win) {
					setShortcut(new QKeySequence("Ctrl+q"))
					setbtnimage(self,"images/close.png") 
					settext("Exit")
					setstatustip("Exit")
					setclickevent(Method(:CloseAction))
				}
				addaction(oAction)
			}
			subEdit { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+x"))
					setbtnimage(self,"images/cut.png")
					settext("Cut")
					setclickevent(Method(:CutAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+c"))
					setbtnimage(self,"images/copy.png")
					settext("Copy")
					setclickevent(Method(:CopyAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+v"))
					setbtnimage(self,"images/paste.png")
					settext("Paste")
					setclickevent(Method(:PasteAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+i"))
					setbtnimage(self,"images/font.png")
					settext("Font")
					setclickevent(Method(:FontAction))
				}
				addseparator()
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+f"))
					setbtnimage(self,"images/search.png")
					settext("Find and Replace")
					setclickevent(Method(:FindAction))
				}
				addaction(oAction)
			}				
			subView {
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+j"))
					setbtnimage(self,"images/project.png")
					settext("Project Files")
					setclickevent(Method(:ProjectAction))
				}
				addaction(oAction)			
				addseparator()	
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+u"))
					setbtnimage(self,"images/source.png")
					setclickevent(Method(:GoalDesignerAction))
					settext("Goal Designer")
				}
				addaction(oAction)	
			}
			subProgram { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+d"))
					setbtnimage(self,"images/debug.png")
					settext("Debug (Run then wait!)")
					setclickevent(Method(:DebugAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+r"))
					setbtnimage(self,"images/run.png")
					settext("Run")
					setclickevent(Method(:RunAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+F5"))
					setbtnimage(self,"images/run.png")
					settext("Run GUI Application (No Console)")
					setclickevent(Method(:RunGUIAction))
				}
				addaction(oAction)	
			}
			subHelp { 

				subHelpLF = addmenu("Language Reference")
				subHelpLF { 
					oAction = new qAction(win) {
						settext("CHM File")
						setclickevent(Method(:CHMAction))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						settext("PDF File")
						setclickevent(Method(:PDFAction))
					}
					addaction(oAction)
				}
				addseparator()
				subHelpTools = addmenu("Development Tools")
				subHelpTools { 

					oAction = new qAction(win) {
						settext("Programming Language")
						setclickevent(Method(:LanguageAction))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						settext("GUI Library")
						setclickevent(Method(:GUIAction))
					}
					addaction(oAction)
				}
				addseparator()
					oAction = new qAction(win) {
						settext("About")
						setclickevent(Method(:AboutAction))
					}
					addaction(oAction)			
			}
		}
		win.setmenubar(menu1)

	func CreateToolbar win
		aBtns = [
				new qpushbutton(win) { 
					setbtnimage(self,"images/new.png") 
					setclickevent(Method(:NewAction))
					settooltip("New File")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/open.png") 
					setclickevent(Method(:OpenAction))
					settooltip("Open File")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/save.png")
					setclickevent(Method(:SaveAction))
					settooltip("Save")
				 } ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/saveas.png")
					setclickevent(Method(:SaveAsAction))
					settooltip("Save As")
				 } ,
				
				new qpushbutton(win) { 
					setbtnimage(self,"images/debug.png") 
					setclickevent(Method(:DebugAction))
					settooltip("Debug (Run then wait!)")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/run.png") 
					setclickevent(Method(:RunAction))
					settooltip("Run the program")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/rungui.bmp") 
					setclickevent(Method(:RunGUIAction))
					settooltip("Run GUI Application (No Console)")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/close.png") 
					setclickevent(Method(:CloseAction))
					settooltip("Quit")
				} 
			]
		win {
			tool1 = addtoolbar("files")  {
	  			for x in aBtns { 
					addwidget(x) addseparator()
				}
			}
		}

	func CreateFilesManager win
		tree1 = new qtreeview(win) {
			setclickedevent(Method(:ChangeFileAction))
			setmaximumwidth(300)			
			oDir = new QDir()					
			this.ofile = new QFileSystemModel() {
				setrootpath(oDir.currentpath())				
				myfiles = new qstringlist()
				myfiles.append("*.pwct")
				setnamefilters(myfiles)	
				setNameFilterDisables(false)
			}
			setmodel(this.ofile)
			myindex = this.ofile.index(oDir.currentpath(),0)
			for x = 1 to this.ofile.columncount() {
				hidecolumn(x)
			}
			setcurrentindex(myindex)
			setexpanded(myindex,true)
			header().hide()			
		}
		oDock1 = new qdockwidget(win,0) {
			setGeometry(00,00,200,200)
			setwindowtitle("Project Files")
			setwidget(this.tree1)
		}
		win.adddockwidget(2,oDock1,2)

	func CreateGoalDesigner win
		Open_Window(:GoalDesignerController)		
		oDock2 = new qdockwidget(win,0) {
			setwidget(last_window().oView.win)
			setwindowtitle("Goal Designer")			
		}
		win.adddockwidget(1,oDock2,1)		

	func CreateStatusBar win
		status1 = new qstatusbar(win) {
			showmessage("Ready!",0)
		}
		win.setstatusbar(status1) 
