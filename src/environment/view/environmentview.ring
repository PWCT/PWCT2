/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment View Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class EnvironmentView from WindowsViewParent

	oDesktop = new qDesktopWidget()	

	# Attributes
	TreeTimer oFilesTree   oFile  oDockFilesManager oDockGoalDesigner
	oDockComponentsBrowser  oStatusbar

	# Process Window
	oDockOutputWindow	oProcess oProcessText   oProcessEditbox
	oDockFormDesigner

	# Main File Toolbar 
		tool2 oTxtMainFile

	nGoalDesignerWindowID

	if PWCTIsMobile(:DockForComponentsBrowser) {
		lDockForComponentsBrowser = False
		lDockForFormDesigner	  = True
	else 
		lDockForComponentsBrowser = True
		lDockForFormDesigner	  = True
	}


	lOutpuWindowInBottom = True 

	lNoRunInConsole = True

	# Create the window and the Controls 
		win = new qMainWindow()
		{
			if not PWCTIsMobile(:WindowDimensions) {
				move(-10,0)
				resize(1000,1000)
			}
			setLayoutDirection(T_LAYOUTDIRECTION)
			setWindowTitle(T_ENV_TITLE) # "Programming Without Coding Technology"
			oSystemLog.addMessage("Create Menubar")
			self.CreateMenuBar(win)
			oSystemLog.addMessage("Create Toolbar")
			self.CreateToolbar(win)
			if not PWCTIsMobile(:ShowMainFileToolbar) {
				oSystemLog.addMessage("Create Main File Toolbar")
				self.CreateMainFileToolbar(win)
			}
			oSystemLog.addMessage("Create Statusbar")
			self.CreateStatusBar(win)
			if T_LAYOUTDIRECTION = 0 {
				oSystemLog.addMessage("Create Files Manager")
				self.CreateFilesManager(win)
				if lDockForFormDesigner {
					oSystemLog.addMessage("Create Form Designer")
					self.CreateFormDesigner(win)
				}
				oSystemLog.addMessage("Create Goal Designer")
				oDockGoalDesigner = self.CreateGoalDesigner(win)
				oSystemLog.addMessage("Create Output Window")
				self.CreateOutputWindow(win)
			else 
				oSystemLog.addMessage("Create Files Manager")
				self.CreateFilesManager(win)
				oSystemLog.addMessage("Create Output Window")
				self.CreateOutputWindow(win)
				if lDockForFormDesigner {
					oSystemLog.addMessage("Create Form Designer")
					self.CreateFormDesigner(win)
				}
				oSystemLog.addMessage("Create Goal Designer")
				oDockGoalDesigner = self.CreateGoalDesigner(win)
			}
			if lDockForComponentsBrowser {
				oSystemLog.addMessage("Create Components Browser")
				self.CreateComponentsBrowser(win)
			}
			setwinicon(win,AppFile("images/pwct.png"))	
			oFilter = new qAllevents(win) {
				setCloseEvent(Method(:CloseAction))
			}
			installeventfilter(oFilter)
			oSystemLog.addMessage("Environment Window Loaded!")
			# Workaround to Avoid Resize problem for the dockable widget 
			# Without this workaround, if we increased the height of the Output Window 
			# Then we can't decrease it again without moving it to float window then resizing then docking it again 
			# See : https://www.qtcentre.org/threads/60463-Nested-QDockWidget-resize-issues
				if ! PWCTIsMobile(:CentralWidget) {
					oCentral = new qLabel(win) {
						setMaximumWidth(0)
					}
					setcentralwidget(oCentral)
				}
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
			subProgram 	= addmenu(T_ENV_MENU_PROGRAM) 		# "Program"
			if not PWCTIsMobile(:ToolsDistributeMenu) {
				subTools 	= addmenu(T_ENV_MENU_TOOLS)		# "Tools"
				subDistribute   = addmenu(T_ENV_MENU_DISTRIBUTE) 	# "Distribute"
			}
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
				if ! isWebAssembly() {
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+Alt+s"))
						setbtnimage(self,AppFile("images/saveas.png"))
						settext(T_ENV_MENU_SAVEAS) # "Save As"
						setclickevent(Method(:SaveAsAction))
					}
					addaction(oAction)
					addseparator()
				}
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
				if ! isWebAssembly() {
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Alt+p"))
						setbtnimage(self,AppFile("images/project.png"))
						settext(T_ENV_MENU_PROJECTFILES ) # "Project Files"
						setclickevent(Method(:ProjectAction))
					}
					addaction(oAction)			
					addseparator()	
				}
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
					setShortcut(new QKeySequence("Alt+shift+d"))
					setbtnimage(self,AppFile("images/source.png"))
					setclickevent(Method(:FormDesignerWindowAction))
					settext(T_ENV_MENU_FORMDESIGNERWINDOW) # "Form Designer"
				}
				addaction(oAction)

				addseparator()
				subStyle = addmenu(T_ENV_MENU_MODE) # "Mode"
				subStyle {
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+1"))
						setclickEvent(Method("SetMode(C_ENV_MODE_GENERAL)"))
						settext(T_ENV_MENU_MODE_GENERAL) # "General (All Windows)"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+2"))
						setclickEvent(Method("SetMode(C_ENV_MODE_TESTING)"))
						settext(T_ENV_MENU_MODE_TESTING) # "General (Testing)"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+3"))
						setclickEvent(Method("SetMode(C_ENV_MODE_LEFT)"))
						settext(T_ENV_MENU_MODE_PROGRAMMING_ALL_LEFT) # "Programming (All Windows) - Left"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+4"))
						setclickEvent(Method("SetMode(C_ENV_MODE_RIGHT)"))
						settext(T_ENV_MENU_MODE_PROGRAMMING_ALL_RIGTH) # "Programming (All Windows) - Right"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+5"))
						setclickEvent(Method("SetMode(C_ENV_MODE_GD)"))
						settext(T_ENV_MENU_MODE_PROGRAMMING_GOALDESIGNER) # "Programming (Goal Designer)"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+6"))
						setclickEvent(Method("SetMode(C_ENV_MODE_GUI)"))
						settext(T_ENV_MENU_MODE_GUI) # "GUI Development (Goal Designer + Form Designer)"
					}
					addaction(oAction)
				}

				addseparator()
				subStyle = addmenu(T_ENV_MENU_STYLE) # "Style"
				subStyle {
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+shift+1"))
						setclickEvent(Method("SetStyle(C_ENV_STYLE_WINDOWS)"))
						settext(T_ENV_MENU_STYLEWINDOWS)  # "Windows"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+shift+2"))
						setclickEvent(Method("SetStyle(C_ENV_STYLE_WINDOWSB)"))
						settext(T_ENV_MENU_STYLEWINDOWSBLOCKS)  # "Windows - Blocks"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+shift+3"))
						setclickEvent(Method("SetStyle(C_ENV_STYLE_WHITE)"))
						settext(T_ENV_MENU_STYLEFUSIONWHITE) # "Fusion: White"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+shift+4"))
						setclickEvent(Method("SetStyle(C_ENV_STYLE_WHITEB)"))
						settext(T_ENV_MENU_STYLEFUSIONWHITEBLOCKS) # "Fusion: White Blocks"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+shift+5"))
						setclickEvent(Method("SetStyle(C_ENV_STYLE_BLACK)"))
						settext(T_ENV_MENU_STYLEFUSIONBLACK)  # "Fusion: Black"
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+shift+6"))
						setclickEvent(Method("SetStyle(C_ENV_STYLE_BLACKB)"))
						settext(T_ENV_MENU_STYLEFUSIONBLACKBLOCKS)  # "Fusion: Black Blocks"
					}
					addaction(oAction)						
				}
				if ! PWCTIsMobile(:SelectLanguage) {
					addseparator()
					subLang = addmenu(T_ENV_MENU_LANGUAGE) # "Language"
					subLang {
						oAction = new qAction(win) {
							setShortcut(new QKeySequence("Ctrl+shift+7"))
							setclickEvent(Method("SetLang(C_TRANSLATION_ARABIC)"))
							settext(T_ENV_MENU_LANG_ARABIC) # "Arabic"
						}
						addaction(oAction)
						addseparator()
						oAction = new qAction(win) {
							setShortcut(new QKeySequence("Ctrl+Shift+8"))
							setclickEvent(Method("SetLang(C_TRANSLATION_ENGLISH)"))
							settext(T_ENV_MENU_LANG_ENGLISH) # "English"
						}
						addaction(oAction)
	
					}
				}
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
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+F6"))
						setbtnimage(self,AppFile("images/web.png"))
						settext(T_ENV_MENU_RUNWEBAPPLICATION) # "Run Web Application (Open In Browser)"
						setclickEvent(Method(:RunInBrowser))
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+Shift+M"))
						setbtnimage(self,("images/open.png"))
						settext(T_ENV_MENU_SETMAINFILE) # "Set the Main File to be the current source file"
						setclickEvent(Method(:SetMainFile))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+Shift+d"))
						setbtnimage(self,AppFile("images/debug.png"))
						settext(T_ENV_MENU_MAINFILEDEBUG) # "Main File : Debug (Run then wait!)"
						setclickEvent(Method(:DebugMainFile))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+Shift+r"))
						setbtnimage(self,AppFile("images/run.png"))
						settext(T_ENV_MENU_MAINFILERUN) # "Main File : Run"
						setclickEvent(Method(:RunMainFile))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+Shift+F5"))
						setbtnimage(self,AppFile("images/rungui.png"))
						settext(T_ENV_MENU_MAINFILERUNGUI) # "Main File : Run GUI Application (No Console)"
						setclickEvent(Method(:RunGUIMainFile))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Ctrl+Shift+F6"))
						setbtnimage(self,AppFile("images/web.png"))
						settext(T_ENV_MENU_MAINFILERUNWEB) # "Main File : Run Web Application (Open In Browser)"
						setclickEvent(Method(:RunInBrowserMainFile))
					}
					addaction(oAction)

				}
			}
			if not PWCTIsMobile(:ToolsDistributeMenu) {
				subTools {
					oAction = new qAction(win) {
						settext(T_ENV_MENU_TOOLS_FORMDESIGNER)  # "Form Designer"
						setclickEvent(Method(:OpenFormDesigner))
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Alt+R"))
						settext(T_ENV_MENU_TOOLS_RINGREPLCONSOLE) # "RingREPL - Console"
						setclickEvent(Method(:REPLConsole))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						setShortcut(new QKeySequence("Alt+Shift+R"))
						settext(T_ENV_MENU_TOOLS_RINGREPLGUI) # "RingREPL - GUI"
						setclickEvent(Method(:REPLGUI))
					}
					addaction(oAction)
					addseparator()
					subOSTools = addmenu(T_ENV_MENU_TOOLS_OSTOOLS) # "Operating System Tools"
					subOSTools {
						oAction = new qAction(win) {
							settext(T_ENV_MENU_TOOLS_TERMINAL) # "Terminal (Command Prompt)"
							setShortcut(new QKeySequence("Alt+Shift+T"))
							setclickEvent(Method(:OSTerminal))
						}
						addaction(oAction)
						addseparator()
						oAction = new qAction(win) {
							settext(T_ENV_MENU_TOOLS_FM) # "Files Manager (Explorer)"
							setShortcut(new QKeySequence("Alt+Shift+F"))
							setclickEvent(Method(:OSFilesManager))
						}
						addaction(oAction)
					}
				}
				subDistribute {
					oAction = new qAction(win) {
						settext(T_ENV_MENU_DIST_RING2EXE1) # "Generate Ring Object File (*.ringo)"
						setclickEvent(Method("Distribute(1)"))
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						settext(T_ENV_MENU_DIST_RING2EXE2) # "Ring2EXE (Build Console Application)"
						setclickEvent(Method("Distribute(2)"))
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						settext(T_ENV_MENU_DIST_RING2EXE3) # "Ring2EXE (Distribute Application - Use All Runtime)"
						setclickEvent(Method("Distribute(3)"))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						settext(T_ENV_MENU_DIST_RING2EXE4) # "Ring2EXE (Distribute Application - Use All Runtime - Hide Console Window)"
						setclickEvent(Method("Distribute(4)"))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						settext(T_ENV_MENU_DIST_RING2EXE5) # "Ring2EXE (Distribute RingQt Application)"
						setclickEvent(Method("Distribute(5)"))
					}
					addaction(oAction)
					oAction = new qAction(win) {
						settext(T_ENV_MENU_DIST_RING2EXE6) # "Ring2EXE (Distribute RingAllegro Game)"
						setclickEvent(Method("Distribute(6)"))
					}
					addaction(oAction)
					addseparator()
					oAction = new qAction(win) {
						settext(T_ENV_MENU_DIST_RING2EXE7) # "Ring2EXE (Prepare Qt Project - Distribute for Mobile Devices)"
						setclickEvent(Method("Distribute(7)"))
					}
					addaction(oAction)
				}
			}
			subHelp { 
				if ! PWCTIsMobile(:HelpMenu) {
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
				}
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
						settext(T_ENV_MENU_LOG) # "System Log"
						setclickevent(Method(:SystemLogAction))
					}
					addaction(oAction)			

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
		if isWebAssembly() {
			aBtns = [
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/new.png"))
						setclickevent(Method(:NewAction))
						settooltip(T_ENV_MENU_NEW) # "New File"
						this.MobileToolButtonSize(self)
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/open.png")) 
						setclickevent(Method(:OpenAction))
						settooltip(T_ENV_MENU_OPEN) # "Open File"
						this.MobileToolButtonSize(self)
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/save.png"))
						setclickevent(Method(:SaveAction))
						settooltip(T_ENV_MENU_SAVE) # "Save"
						this.MobileToolButtonSize(self)
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/rungui.png"))
						setclickevent(Method(:RunAction))
						settooltip(T_ENV_MENU_RUN) # "Run the program"
						this.MobileToolButtonSize(self)
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/close.png"))
						setclickevent(Method(:CloseAction))
						settooltip(T_ENV_MENU_EXIT) # "Exit"
						this.MobileToolButtonSize(self)
					} 
				]
		elseif PWCTIsMobile(:RunApplication) 
			aBtns = [
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/new.png"))
						setclickevent(Method(:NewAction))
						settooltip(T_ENV_MENU_NEW) # "New File"
						this.MobileToolButtonSize(self)
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/open.png")) 
						setclickevent(Method(:OpenAction))
						settooltip(T_ENV_MENU_OPEN) # "Open File"
						this.MobileToolButtonSize(self)
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/save.png"))
						setclickevent(Method(:SaveAction))
						settooltip(T_ENV_MENU_SAVE) # "Save"
						this.MobileToolButtonSize(self)
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/saveas.png"))
						setclickevent(Method(:SaveAsAction))
						settooltip(T_ENV_MENU_SAVEAS) # "Save As"
						this.MobileToolButtonSize(self)
					} ,				
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/rungui.png"))
						setclickevent(Method(:RunAction))
						settooltip(T_ENV_MENU_RUN) # "Run the program"
						this.MobileToolButtonSize(self)
					} ,
					new qToolbutton(win) { 
						setbtnimage(self,AppFile("images/close.png"))
						setclickevent(Method(:CloseAction))
						settooltip(T_ENV_MENU_EXIT) # "Exit"
						this.MobileToolButtonSize(self)
					} 
				]
		else
			if lNoRunInConsole  {
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
						setclickevent(Method(:RunGUIAction))
						settooltip(T_ENV_MENU_RUNNOCONSOLE) # "Run GUI Application (No Console)"
					} ,
					new qtoolbutton(win) {
						setbtnimage(self,AppFile("images/web.png"))
						setclickEvent(Method(:RunInBrowser))
						settooltip("Run Web Application - Open In Browser (Ctrl+F6)")
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
						setbtnimage(self,AppFile("images/web.png"))
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
		}
		win {
			tool1 = addtoolbar("files")  {
	  			for x in aBtns { 
					addwidget(x) addseparator()
				}
			}
		}


	func MobileButtonSize oButton
		oButton {
			if PWCTIsMobile(:GoalDesignerButtonsSize) {
				setMinimumwidth(100)	
				setMinimumHeight(95)
			}
		}

	func MobileToolButtonSize oButton
		oButton {
			if PWCTIsMobile(:GoalDesignerButtonsSize) {
				setMinimumwidth(200)	
				setMinimumHeight(150)
			}
		}


	func CreateMainFileToolbar win
		win {
			if PWCTIsMobile(:ToolBarInTwoRows) {
				Qt_TopToolBarArea = 4
				addToolBarBreak(Qt_TopToolBarArea) 
			}
			# Main File Toolbar
			tool2 = addtoolbar("mainfile")  {
				oLblMainFile = new qLabel(this.win) {
					setText(T_ENV_TOOLBAR_MAINFILE) # "Main File : "
				}
				this.oTxtMainFile = new qLineEdit(this.win) {
					setStylesheet("border: 0px;  background-color: rgba(0, 0, 0, 0);")
					setReadOnly(True)
				}
				oBtnSetFile = new qtoolbutton(this.win) {
					setbtnimage(self,AppFile("images/open.png"))
					setclickEvent(Method(:SetMainFile))
					settooltip(T_ENV_MENU_SETMAINFILE) # "Set the Main File to be the current source file (Ctrl+Shift+M)"
					this.MobileButtonSize(self)
				}
				oBtnRunGUIMainFile = new qtoolbutton(this.win) {
					setbtnimage(self,AppFile("images/rungui.png"))
					setclickEvent(Method(:RunGUIMainFile))
					settooltip(T_ENV_MENU_MAINFILERUNGUI) # "Main File : Run GUI Application - No Console (Ctrl+Shift+F5)"
					this.MobileButtonSize(self)
				} 
				AddWidget(oLblMainFile)
				AddWidget(this.oTxtMainFile)
				AddWidget(oBtnSetFile)
				if not PWCTISMobile(:MAINTOOLBAR) {
					if ! this.lNoRunInConsole {
						oBtnDebugMainFile = new qtoolbutton(this.win) {
								setbtnimage(self,AppFile("images/debug.png"))
								setclickevent(Method(:DebugMainFile)) 
								settooltip(T_ENV_MENU_MAINFILEDEBUG) # "Main File : Debug  - Run then wait! (Ctrl+Shift+D)"
						} 
						oBtnRunMainFile = new qtoolbutton(this.win) {
								setbtnimage(self,AppFile("images/run.png"))
								setclickEvent(Method(:RunMainFile))
								settooltip(T_ENV_MENU_MAINFILERUN) # "Main File : Run the program (Ctrl+Shift+R)"
						} 
						AddWidget(oBtnDebugMainFile)
						AddWidget(oBtnRunMainFile)
					}
					oBtnRunWebMainFile = new qtoolbutton(this.win) {
							setbtnimage(self,AppFile("images/web.png"))
							setclickEvent(Method(:RunInBrowserMainFile))
							settooltip(T_ENV_MENU_MAINFILERUNWEB) # "Main File : Run Web Application - Open In Browser (Ctrl+Shift+F6)"
					} 
					AddWidget(oBtnRunGUIMainFile)
					AddWidget(oBtnRunWebMainFile)
				else 
					AddWidget(oBtnRunGUIMainFile)
				}
			}
		}



	/*
		Purpose : Create the Files Manager Window
		Parameters : The Window Object
		Output : None
	*/

	func CreateFilesManager win
		treeTimer = new qTimer(win) {
			settimeoutevent(Method(:ChangeFileAction))
			setinterval(250)
			stop()
		}
		oFilesTree = new TreeViewControl(win) {
			setLayoutDirection(T_LAYOUTDIRECTION)
			setclickedevent(Method(:ChangeFileClickAction))
			setdoubleclickedevent(Method(:ChangeFileDoubleClickAction))
			setactivatedevent(Method(:ChangeFileClickAction))
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
			if PWCTIsMobile(:OnlyPWCTFilesFolder) {
				myindex2 = this.ofile.index(oDir.currentpath()+"/PWCTFiles",0)
				setrootindex(myindex2)
			}
			setexpanded(myindex,true)
			header().hide()			
		}
		
		oDockFilesManager = new qdockwidget(win,0) {
			nWidth = floor(this.oDesktop.Width()*0.17)
			setMinimumwidth(nWidth)
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setGeometry(00,00,nWidth,200)
			setwidget(this.oFilesTree)
			setwindowtitle(T_ENV_DOCK_PROJECTFILES) # "Project Files"
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
			if not PWCTIsMobile(:GoalDesignerSize) {
				nWidth = floor(this.oDesktop.Width()*0.5)
				nHeight = floor(this.oDesktop.Height()*0.6)
				setMinimumwidth(nWidth)
				setMinimumHeight(nHeight)
			}
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwidget(last_window().oView.win)
			setwindowtitle(T_ENV_DOCK_GOALDESIGNER) # "Goal Designer"		 
			setvisibilitychangedevent(Method(:ActiveGoalDesignerChanged))
		}
		last_window().oDockGoalDesigner = oDock
		win.adddockwidget(Qt_LeftDockWidgetArea,oDock,1)	
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
		win.adddockwidget(Qt_LeftDockWidgetArea,oDock,nPos)	


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
			nWidth = floor(this.oDesktop.Width()*0.2)
			nHeight = floor(this.oDesktop.Height()*0.1)
			setMinimumWidth(nWidth)
			setMinimumHeight(nHeight)
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwidget( oProcessWindow )		
			setwindowtitle(T_ENV_OW_TITLE)  # "Output Window"
		}
		if lOutpuWindowInBottom {
			win.adddockwidget(Qt_BottomDockWidgetArea,oDockOutputWindow,Qt_Horizontal)
		else 
			win.adddockwidget(Qt_LeftDockWidgetArea,oDockOutputWindow,Qt_Horizontal)
		}

	/*
		Purpose : Create the Components Browser Window 
		Parameters : The Window Object 
		Output : None
	*/

	func createComponentsBrowser win
		oDockComponentsBrowser = new qDockWidget(win,0) {
			nWidth = floor(this.oDesktop.Width()*0.2)
			setMinimumWidth(nWidth)
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwindowtitle(T_ENV_DOCK_COMPONENTSBROWSER) 
		}
		win.adddockwidget(Qt_LeftDockWidgetArea,oDockComponentsBrowser,1)

	/*
		Purpose : Create the Form Designer Window 
		Parameters : The Window Object 
		Output : None

	*/
	func createFormDesigner win
		oDockFormDesigner = new qDockWidget(win,0) {
			nWidth = floor(this.oDesktop.Width()*0.6)
			setMinimumWidth(nWidth)
			setLayoutDirection(C_TRANSLATION_ENGLISH)
			setwindowtitle(T_ENV_DOCK_FORMDESIGNER) 
		}
		win.adddockwidget(Qt_LeftDockWidgetArea,oDockFormDesigner,1)

