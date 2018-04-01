/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment View Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class EnvironmentView from WindowsViewParent

	# Attributes
	Tree1   oFile  oDockFilesManager oDockGoalDesigner
	oDockComponentsBrowser  oStatusbar

	# Process Window
	oDockOutputWindow	oProcess oProcessText   oProcessEditbox
	oDockFormDesigner

	nGoalDesignerWindowID

	if PWCTIsMobile(:DockForComponentsBrowser) {
		lDockForComponentsBrowser = False
		lDockForFormDesigner	  = False
	else 
		lDockForComponentsBrowser = True
		lDockForFormDesigner	  = True
	}

	# Create the window and the Controls
		win = new qMainWindow()
		{
			if not PWCTIsMobile(:WindowDimensions) {
				move(-10,0)
				resize(1000,1000)
			}
			setLayoutDirection(T_LAYOUTDIRECTION)
			setWindowTitle(T_ENV_TITLE) # "Programming Without Coding Technology"
			self.CreateMenuBar(win)
			self.CreateToolbar(win)
			self.CreateStatusBar(win)
			if T_LAYOUTDIRECTION = 0 {
				self.CreateFilesManager(win)
				oDockGoalDesigner = self.CreateGoalDesigner(win)
				self.CreateOutputWindow(win)
			else 
				self.CreateOutputWindow(win)
				oDockGoalDesigner = self.CreateGoalDesigner(win)
				self.CreateFilesManager(win)
			}
			if lDockForComponentsBrowser {
				self.CreateComponentsBrowser(win)
			}
			if lDockForFormDesigner {
				self.CreateFormDesigner(win)
			}
			setwinicon(win,AppFile("images/pwct.png"))	
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
			subFile 	= addmenu(T_ENV_MENU_FILE) # "File"
			subEdit 	= addmenu(T_ENV_MENU_EDIT) # "Edit"
			subView 	= addmenu(T_ENV_MENU_VIEW) # "View"
			subProgram 	= addmenu(T_ENV_MENU_PROGRAM) # "Program"
			subTools 	= addmenu("Tools")
			subDistribute   = addmenu("Distribute")
			subHelp 	= addmenu(T_ENV_MENU_HELP) # "Help"
			subFile { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+Alt+n"))
					setbtnimage(self,AppFile("images/new.png"))
					settext(T_ENV_MENU_NEW) # "New"
					setclickevent(Method(:NewAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+Alt+o"))
					setbtnimage(self,AppFile("images/open.png")) 
					settext(T_ENV_MENU_OPEN) # "Open"
					setclickevent(Method(:OpenAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+s"))
					setbtnimage(self,AppFile("images/save.png"))
					settext(T_ENV_MENU_SAVE) # "Save"
					setclickevent(Method(:SaveAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+Alt+s"))
					setbtnimage(self,AppFile("images/saveas.png"))
					settext(T_ENV_MENU_SAVEAS) # "Save As"
					setclickevent(Method(:SaveAsAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+p"))
					setbtnimage(self,AppFile("images/print.png"))
					settext(T_ENV_MENU_PRINT) # "Print to PDF"
					setclickevent(Method(:PrintAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qaction(win) {
					setShortcut(new QKeySequence("Ctrl+q"))
					setbtnimage(self,AppFile("images/close.png"))
					settext(T_ENV_MENU_EXIT) # "Exit"
					setclickevent(Method(:CloseAction))
				}
				addaction(oAction)
			}
			subEdit { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+x"))
					setbtnimage(self,AppFile("images/cut.png"))
					settext(T_ENV_MENU_CUT) # "Cut"
					setclickevent(Method(:CutAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+c"))
					setbtnimage(self,AppFile("images/copy.png"))
					settext(T_ENV_MENU_COPY) # "Copy"
					setclickevent(Method(:CopyAction))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+v"))
					setbtnimage(self,AppFile("images/paste.png"))
					settext(T_ENV_MENU_PASTE) # "Paste"
					setclickevent(Method(:PasteAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+f"))
					setbtnimage(self,AppFile("images/font.png"))
					settext(T_ENV_MENU_FONT) # "Font"
					setclickevent(Method(:FontAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+c"))
					setbtnimage(self,AppFile("images/colors.png"))
					settext(T_ENV_MENU_COLORS) # "Colors"
					setclickevent(Method(:ColorsAction))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+f"))
					setbtnimage(self,AppFile("images/search.png"))
					settext(T_ENV_MENU_FINDREPLACE) # "Find and Replace"
					setclickevent(Method(:FindAction))
				}
				addaction(oAction)
			}				
			subView {
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+p"))
					setbtnimage(self,AppFile("images/project.png"))
					settext(T_ENV_MENU_PROJECTFILES ) # "Project Files"
					setclickevent(Method(:ProjectAction))
				}
				addaction(oAction)			
				addseparator()	
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+g"))
					setbtnimage(self,AppFile("images/source.png"))
					setclickevent(Method(:GoalDesignerAction))
					settext(T_ENV_MENU_GOALDESIGNER) # "Goal Designer"
				}
				addaction(oAction)	
				addseparator()	
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+o"))
					setbtnimage(self,AppFile("images/source.png"))
					setclickevent(Method(:OutputWindowAction))
					settext(T_ENV_MENU_OUTPUTWINDOW) # "Output Window"
				}
				addaction(oAction)
				addseparator()	
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+shift+f"))
					setbtnimage(self,AppFile("images/source.png"))
					setclickevent(Method(:FormDesignerWindowAction))
					settext(T_ENV_MENU_FORMDESIGNERWINDOW) # "Form Designer"
				}
				addaction(oAction)
			}
			subProgram { 
				if PWCTIsMobile(:RunApplication) {
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+r"))
						setbtnimage(self,AppFile("images/rungui.png"))
						settext(T_ENV_MENU_RUN) # "Run"
						setclickevent(Method(:RunGUIAction))
					}
					addaction(oAction)
				else 
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+d"))
						setbtnimage(self,AppFile("images/debug.png"))
						settext(T_ENV_MENU_DEBUG) # "Debug (Run then wait!)"
						setclickevent(Method(:DebugAction))
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+r"))
						setbtnimage(self,AppFile("images/run.png"))
						settext(T_ENV_MENU_RUN) # "Run"
						setclickevent(Method(:RunAction))
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+F5"))
						setbtnimage(self,AppFile("images/rungui.png"))
						settext(T_ENV_MENU_RUNNOCONSOLE) # "Run GUI Application (No Console)"
						setclickevent(Method(:RunGUIAction))
					}
					addaction(oAction)	
				}
			}
			subTools {
				oAction = new qAction(win) {
					settext("Form Designer")
					setclickEvent(Method(:OpenFormDesigner))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+R"))
					settext("RingREPL - Console")
					setclickEvent(Method(:REPLConsole))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Alt+Shift+R"))
					settext("RingREPL - GUI")
					setclickEvent(Method(:REPLGUI))
				}
				addaction(oAction)
				addseparator()
				subOSTools = addmenu("Operating System Tools")
				subOSTools {
					oAction = new qAction(win) {
						settext("Terminal (Command Prompt)")
						setShortcut(new QKeySequence("Alt+Shift+T"))
						setclickEvent(Method(:OSTerminal))
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						settext("Files Manager (Explorer)")
						setShortcut(new QKeySequence("Alt+Shift+F"))
						setclickEvent(Method(:OSFilesManager))
					}
					addaction(oAction)
				}
			}
			subDistribute {
				oAction = new qAction(win) {
					settext("Generate Ring Object File (*.ringo)")
					setclickEvent(Method("Distribute(1)"))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					settext("Ring2EXE (Build Console Application)")
					setclickEvent(Method("Distribute(2)"))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					settext("Ring2EXE (Distribute Application - Use All Runtime)")
					setclickEvent(Method("Distribute(3)"))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					settext("Ring2EXE (Distribute Application - Use All Runtime - Hide Console Window)")
					setclickEvent(Method("Distribute(4)"))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					settext("Ring2EXE (Distribute RingQt Application)")
					setclickEvent(Method("Distribute(5)"))
				}
				addaction(oAction)
				oAction = new qAction(win) {
					settext("Ring2EXE (Distribute RingAllegro Game)")
					setclickEvent(Method("Distribute(6)"))
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					settext("Ring2EXE (Prepare Qt Project) - Distribute for Mobile Devices)")
					setclickEvent(Method("Distribute(7)"))
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
		if PWCTIsMobile(:RunApplication) {
			aBtns = [
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/new.png"))
						setclickevent(Method(:NewAction))
						settooltip(T_ENV_MENU_NEW) # "New File"
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/open.png")) 
						setclickevent(Method(:OpenAction))
						settooltip(T_ENV_MENU_OPEN) # "Open File"
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/save.png"))
						setclickevent(Method(:SaveAction))
						settooltip(T_ENV_MENU_SAVE) # "Save"
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/saveas.png"))
						setclickevent(Method(:SaveAsAction))
						settooltip(T_ENV_MENU_SAVEAS) # "Save As"
					} ,				
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/rungui.png"))
						setclickevent(Method(:RunAction))
						settooltip(T_ENV_MENU_RUN) # "Run the program"
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/close.png"))
						setclickevent(Method(:CloseAction))
						settooltip(T_ENV_MENU_EXIT) # "Exit"
					} 
				]
		else
			aBtns = [
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/new.png"))
						setclickevent(Method(:NewAction))
						settooltip(T_ENV_MENU_NEW) # "New File"
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/open.png")) 
						setclickevent(Method(:OpenAction))
						settooltip(T_ENV_MENU_OPEN) # "Open File"
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/save.png"))
						setclickevent(Method(:SaveAction))
						settooltip(T_ENV_MENU_SAVE) # "Save"
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/saveas.png"))
						setclickevent(Method(:SaveAsAction))
						settooltip(T_ENV_MENU_SAVEAS) # "Save As"
					} ,				
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/debug.png"))
						setclickevent(Method(:DebugAction))
						settooltip(T_ENV_MENU_DEBUG) # "Debug (Run then wait!)"
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/run.png"))
						setclickevent(Method(:RunAction))
						settooltip(T_ENV_MENU_RUN) # "Run the program"
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/rungui.png"))
						setclickevent(Method(:RunGUIAction))
						settooltip(T_ENV_MENU_RUNNOCONSOLE) # "Run GUI Application (No Console)"
					} ,
					new qtoolbutton(win) {
						setbtnimage(self,"images/web.png")
						setclickEvent(Method(:RunInBrowser))
						settooltip("Run Web Application - Open In Browser (Ctrl+F6)")
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/close.png"))
						setclickevent(Method(:CloseAction))
						settooltip(T_ENV_MENU_EXIT) # "Exit"
					} 
				]
		}
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
			oDir = new QDir()					
			this.ofile = new QFileSystemModel() {
				setrootpath(oDir.currentpath())				
				myfiles = new qstringlist()
				myfiles.append("*.pwct")
				myfiles.append("*.rform")
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
			setMinimumwidth(250)
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
			setMinimumwidth(800)
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwidget(last_window().oView.win)
			setwindowtitle(T_ENV_DOCK_GOALDESIGNER) # "Goal Designer"		 
			setvisibilitychangedevent(Method(:ActiveGoalDesignerChanged))
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
		oStatusBar = new qstatusbar(win) {
			showmessage(T_ENV_STATUSBAR_READY,0)
		}
		win.setstatusbar(oStatusBar) 

	/*
		Purpose : Create the Output Window 
		Parameters : The Window Object 
		Output : None
	*/

	func createOutputWindow win
		oProcessWindow = new qWidget()
		if ! PWCTIsMobile(:SendDataToApplication) {
			oProcessLabel = new qLabel(oProcessWindow) {
				setText(T_ENV_OW_INPUT) # "Input :"
			}
			oProcessText = new qlineEdit(oProcessWindow) {
				setreturnPressedEvent(Method(:SendDataAction))
			}
			oProcessbtnSend = new qpushbutton(oProcessWindow) {
				setText(T_ENV_OW_SEND)	# "Send"
				setClickevent(Method(:SendDataAction))
			}
			oProcessLayout1 = new qhboxlayout() {
				AddWidget(oProcessLabel)
				AddWidget(this.oProcessText)
				Addwidget(oProcessbtnSend)
			}
		}
		oProcessEditbox = new qPlaintextedit(oProcessWindow) 
		oProcessLayout2 = new qvboxlayout() {
			addWidget(this.oProcesseditbox)
			if ! PWCTIsMobile(:SendDataToApplication) {
				addlayout(oProcesslayout1)			
			}
		}
		oProcessWindow.setlayout(oProcessLayout2)			
		oDockOutputWindow = new qDockWidget(win,0) {
			setMinimumWidth(200)
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwidget( oProcessWindow )		
			setwindowtitle(T_ENV_OW_TITLE)  # "Output Window"
		}
		win.adddockwidget(1,oDockOutputWindow,1)

	/*
		Purpose : Create the Components Browser Window 
		Parameters : The Window Object 
		Output : None
	*/

	func createComponentsBrowser win
		oDockComponentsBrowser = new qDockWidget(win,0) {
			setMinimumWidth(370)
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwindowtitle(T_ENV_DOCK_COMPONENTSBROWSER) 
		}
		win.adddockwidget(1,oDockComponentsBrowser,1)

	/*
		Purpose : Create the Form Designer Window 
		Parameters : The Window Object 
		Output : None

	*/
	func createFormDesigner win
		oDockFormDesigner = new qDockWidget(win,0) {
			setMinimumWidth(470)
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwindowtitle(T_ENV_DOCK_FORMDESIGNER) 
		}
		win.adddockwidget(1,oDockFormDesigner,1)
