/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment View Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class EnvironmentView from WindowsViewParent

	# Attributes
	Tree1   oFile  oDockFilesManager oDockGoalDesigner  

	# Process Window
	oDockOutputWindow	oProcess oProcessText   oProcessEditbox

	nGoalDesignerWindowID

	# Create the window and the Controls
		win = new qMainWindow()
		{
			setLayoutDirection(T_LAYOUTDIRECTION)
			setWindowTitle(T_ENV_TITLE) # "Programming Without Coding Technology"
			self.CreateMenuBar(win)
			self.CreateToolbar(win)
			self.CreateStatusBar(win)
			self.CreateFilesManager(win)
			oDockGoalDesigner = self.CreateGoalDesigner(win)
			self.CreateOutputWindow(win)
			setwinicon(win,"images/pwct.png")
			showmaximized()	
			oFilter = new qAllevents(win) {
				setcloseevent("PWCT_APP.Quit()")
			}
			installeventfilter(oFilter)
		}

	/*
		Purpose : Create the Menubar
		Parameters : The window Object
		Output : None
	*/

	func CreateMenuBar win
		menu1 = new qmenubar(win) {		
			subFile = addmenu(T_ENV_MENU_FILE) # "File"
			subEdit = addmenu(T_ENV_MENU_EDIT) # "Edit"
			subView = addmenu(T_ENV_MENU_VIEW) # "View"
			subProgram = addmenu(T_ENV_MENU_PROGRAM) # "Program"
			subHelp = addmenu(T_ENV_MENU_HELP) # "Help"
			subFile { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+Alt+n"))
					setbtnimage(self,"images/new.png")
					settext(T_ENV_MENU_NEW) # "New"
					setclickevent(Method(:NewAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+Alt+o"))
					setbtnimage(self,"images/open.png") 
					settext(T_ENV_MENU_OPEN) # "Open"
					setclickevent(Method(:OpenAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+s"))
					setbtnimage(self,"images/save.png")
					settext(T_ENV_MENU_SAVE) # "Save"
					setclickevent(Method(:SaveAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+Alt+s"))
					setbtnimage(self,"images/saveas.png")
					settext(T_ENV_MENU_SAVEAS) # "Save As"
					setclickevent(Method(:SaveAsAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+p"))
					setbtnimage(self,"images/print.png")
					settext(T_ENV_MENU_PRINT) # "Print to PDF"
					setclickevent(Method(:PrintAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qaction(win) {
					setShortcut(new QKeySequence("Ctrl+q"))
					setbtnimage(self,"images/close.png") 
					settext(T_ENV_MENU_EXIT) # "Exit"
					setclickevent(Method(:CloseAction))
				}
				addaction(oAction)
			}
			subEdit { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+x"))
					setbtnimage(self,"images/cut.png")
					settext(T_ENV_MENU_CUT) # "Cut"
					setclickevent(Method(:CutAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+c"))
					setbtnimage(self,"images/copy.png")
					settext(T_ENV_MENU_COPY) # "Copy"
					setclickevent(Method(:CopyAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+v"))
					setbtnimage(self,"images/paste.png")
					settext(T_ENV_MENU_PASTE) # "Paste"
					setclickevent(Method(:PasteAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+f"))
					setbtnimage(self,"images/font.png")
					settext(T_ENV_MENU_FONT) # "Font"
					setclickevent(Method(:FontAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+c"))
					setbtnimage(self,"images/colors.png")
					settext(T_ENV_MENU_COLORS) # "Colors"
					setclickevent(Method(:ColorsAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+f"))
					setbtnimage(self,"images/search.png")
					settext(T_ENV_MENU_FINDREPLACE) # "Find and Replace"
					setclickevent(Method(:FindAction))
				}
				addaction(oAction)
			}				
			subView {
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+p"))
					setbtnimage(self,"images/project.png")
					settext(T_ENV_MENU_PROJECTFILES ) # "Project Files"
					setclickevent(Method(:ProjectAction))
				}
				addaction(oAction)			
				addseparator()	
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+g"))
					setbtnimage(self,"images/source.png")
					setclickevent(Method(:GoalDesignerAction))
					settext(T_ENV_MENU_GOALDESIGNER) # "Goal Designer"
				}
				addaction(oAction)	
				addseparator()	
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+o"))
					setbtnimage(self,"images/source.png")
					setclickevent(Method(:OutputWindowAction))
					settext(T_ENV_MENU_OUTPUTWINDOW) # "Output Window"
				}
				addaction(oAction)
			}
			subProgram { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+d"))
					setbtnimage(self,"images/debug.png")
					settext(T_ENV_MENU_DEBUG) # "Debug (Run then wait!)"
					setclickevent(Method(:DebugAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+r"))
					setbtnimage(self,"images/run.png")
					settext(T_ENV_MENU_RUN) # "Run"
					setclickevent(Method(:RunAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+F5"))
					setbtnimage(self,"images/run.png")
					settext(T_ENV_MENU_RUNNOCONSOLE) # "Run GUI Application (No Console)"
					setclickevent(Method(:RunGUIAction))
				}
				addaction(oAction)	
			}
			subHelp { 

				subHelpLF = addmenu(T_ENV_MENU_LANGREF) # "Language Reference"
				subHelpLF { 
					oAction = new qAction(win) {
						settext(T_ENV_MENU_CHM) # "CHM File"
						setclickevent(Method(:CHMAction))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						settext(T_ENV_MENU_PDF)
						setclickevent(Method(:PDFAction))
					}
					addaction(oAction)
				}
				addseparator()
				subHelpTools = addmenu(T_ENV_MENU_DEVTOOLS) # "Development Tools"
				subHelpTools { 

					oAction = new qAction(win) {
						settext(T_ENV_MENU_PROGLANG) # "Programming Language"
						setclickevent(Method(:LanguageAction))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						settext(T_ENV_MENU_GUILIB) # "GUI Library"
						setclickevent(Method(:GUIAction))
					}
					addaction(oAction)
				}
				addseparator()
					oAction = new qAction(win) {
						settext(T_ENV_MENU_ABOUT) # "About"
						setclickevent(Method(:AboutAction))
					}
					addaction(oAction)			
			}
		}
		win.setmenubar(menu1)

	/*
		Purpose : Create the toolbar
		Parameters : The Window Object
		Output : None
	*/

	func CreateToolbar win
		aBtns = [
				new qpushbutton(win) { 
					setbtnimage(self,"images/new.png") 
					setclickevent(Method(:NewAction))
					settooltip(T_ENV_MENU_NEW) # "New File"
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/open.png") 
					setclickevent(Method(:OpenAction))
					settooltip(T_ENV_MENU_OPEN) # "Open File"
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/save.png")
					setclickevent(Method(:SaveAction))
					settooltip(T_ENV_MENU_SAVE) # "Save"
				 } ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/saveas.png")
					setclickevent(Method(:SaveAsAction))
					settooltip(T_ENV_MENU_SAVEAS) # "Save As"
				 } ,
				
				new qpushbutton(win) { 
					setbtnimage(self,"images/debug.png") 
					setclickevent(Method(:DebugAction))
					settooltip(T_ENV_MENU_DEBUG) # "Debug (Run then wait!)"
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/run.png") 
					setclickevent(Method(:RunAction))
					settooltip(T_ENV_MENU_RUN) # "Run the program"
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/rungui.bmp") 
					setclickevent(Method(:RunGUIAction))
					settooltip(T_ENV_MENU_RUNNOCONSOLE) # "Run GUI Application (No Console)"
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/close.png") 
					setclickevent(Method(:CloseAction))
					settooltip(T_ENV_MENU_EXIT) # "Exit"
				} 
			]
		win {
			tool1 = addtoolbar("files")  {
	  			for x in aBtns { 
					addwidget(x) addseparator()
				}
			}
		}

	/*
		Purpose : Create the Files Manager Window
		Parameters : The Window Object
		Output : None
	*/

	func CreateFilesManager win
		tree1 = new qtreeview(win) {
			setclickedevent(Method(:ChangeFileAction))
			setactivatedevent(Method(:ChangeFileAction))
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
		oDockFilesManager = new qdockwidget(win,0) {
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setGeometry(00,00,200,200)
			setwindowtitle(T_ENV_DOCK_PROJECTFILES) # "Project Files"
			setwidget(this.tree1)
		}
		win.adddockwidget(1,oDockFilesManager,1)

	/*
		Purpose : Create the goal designer window
		Parameters : The window object
		Output : None
	*/

	func CreateGoalDesigner win
		Open_Window(:GoalDesignerController)		
		nGoalDesignerWindowID = Last_WindowID()
		oDock = new qdockwidget(win,0) {
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwidget(last_window().oView.win)
			setwindowtitle(T_ENV_DOCK_GOALDESIGNER) # "Goal Designer"		 
		}
		win.adddockwidget(1,oDock,1)	
		return oDock

	/*
		Purpose : Create Dockable window
		Parameters : The Widget, Window title and the dock position
		Output : None
	*/

	func CreateDockableWindow oWidget,cTitle,nPos
		oDock = new qdockwidget(win,0) {
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwidget(oWidget)
			setwindowtitle(cTitle)  	 
		}
		win.adddockwidget(1,oDock,nPos)	


	/*
		Purpose : Create the Status bar
		Parameters : The Window object
		Output : None
	*/

	func CreateStatusBar win
		status1 = new qstatusbar(win) {
			showmessage(T_ENV_STATUSBAR_READY,0)
		}
		win.setstatusbar(status1) 

	/*
		Purpose : Create the Output Window 
		Parameters : The Window Object 
		Output : None
	*/

	func createOutputWindow win
		oProcessWindow = new qWidget()
		oProcessLabel = new qLabel(oProcessWindow) {
			setText("Input :")
		}
		oProcessText = new qlineEdit(oProcessWindow) {
			setreturnPressedEvent(Method(:SendDataAction))
		}
		oProcessbtnSend = new qpushbutton(oProcessWindow) {
			setText("Send")
			setClickevent(Method(:SendDataAction))
		}
		oProcessLayout1 = new qhboxlayout() {
			AddWidget(oProcessLabel)
			AddWidget(this.oProcessText)
			Addwidget(oProcessbtnSend)
		}
		oProcessEditbox = new qPlaintextedit(oProcessWindow) 
		oProcessLayout2 = new qvboxlayout() {
			addWidget(this.oProcesseditbox)
			addlayout(oProcesslayout1)
		}
		oProcessWindow.setlayout(oProcessLayout2)			
		oDockOutputWindow = new qDockWidget(win,0) {
			setwidget( oProcessWindow )		
			setwindowtitle("Output Window")
		}
		win.adddockwidget(2,oDockOutputWindow,1)
