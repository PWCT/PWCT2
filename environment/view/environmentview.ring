/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment View Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class EnvironmentView from WindowsViewParent

	# Attributes
	Tree1   oFile  oDock1 oDock2

	# Create the window and the Controls
		win = new qMainWindow()
		{
			setLayoutDirection(T_LAYOUTDIRECTION)
			setWindowTitle("Programming Without Coding Technology")
			self.CreateMenuBar(win)
			self.CreateToolbar(win)
			self.CreateStatusBar(win)
			self.CreateFilesManager(win)
			oDock2 = self.CreateGoalDesigner(win)
			setwinicon(win,"images/pwct.png")
			showmaximized()	
		}

	func CreateMenuBar win
		menu1 = new qmenubar(win) {		
			subFile = addmenu(T_ENV_MENU_FILE) # "File"
			subEdit = addmenu(T_ENV_MENU_EDIT) # "Edit"
			subView = addmenu(T_ENV_MENU_VIEW) # "View"
			subProgram = addmenu(T_ENV_MENU_PROGRAM) # "Program"
			subHelp = addmenu(T_ENV_MENU_HELP) # "Help"
			subFile { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+n"))
					setbtnimage(self,"images/new.png")
					settext(T_ENV_MENU_NEW) # "New"
					setclickevent(Method(:NewAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+o"))
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
					setShortcut(new QKeySequence("Ctrl+e"))
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
					setShortcut(new QKeySequence("Ctrl+i"))
					setbtnimage(self,"images/font.png")
					settext(T_ENV_MENU_FONT) # "Font"
					setclickevent(Method(:FontAction))
				}
				addseparator()
				addaction(oAction)
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
					setShortcut(new QKeySequence("Ctrl+j"))
					setbtnimage(self,"images/project.png")
					settext(T_ENV_MENU_PROJECTFILES ) # "Project Files"
					setclickevent(Method(:ProjectAction))
				}
				addaction(oAction)			
				addseparator()	
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+u"))
					setbtnimage(self,"images/source.png")
					setclickevent(Method(:GoalDesignerAction))
					settext(T_ENV_MENU_GOALDESIGNER) # "Goal Designer"
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
		oDock1 = new qdockwidget(win,0) {
			setGeometry(00,00,200,200)
			setwindowtitle("Project Files")
			setwidget(this.tree1)
		}
		win.adddockwidget(2,oDock1,2)

	func CreateGoalDesigner win
		Open_Window(:GoalDesignerController)		
		oDock = new qdockwidget(win,0) {
			setwidget(last_window().oView.win)
			setwindowtitle("Goal Designer")			
		}
		win.adddockwidget(1,oDock,1)	
		return oDock

	func CreateStatusBar win
		status1 = new qstatusbar(win) {
			showmessage("Ready!",0)
		}
		win.setstatusbar(status1) 
