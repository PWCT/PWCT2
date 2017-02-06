/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Environment View Class
**	Date : 2017.02.06
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class EnvironmentView from WindowsViewParent

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
					setclickevent("pNew()")
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+o"))
					setbtnimage(self,"images/open.png") 
					settext("Open")
					setclickevent("pOpen()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+s"))
					setbtnimage(self,"images/save.png")
					settext("Save")
					setclickevent("pSave()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+e"))
					setbtnimage(self,"images/saveas.png")
					settext("Save As")
					setclickevent("pSaveAs()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+p"))
					setbtnimage(self,"images/print.png")
					settext("Print to PDF")
					setclickevent("pPrint()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qaction(win) {
					setShortcut(new QKeySequence("Ctrl+q"))
					setbtnimage(self,"images/close.png") 
					settext("Exit")
					setstatustip("Exit")
					setclickevent("pQuit()")
				}
				addaction(oAction)
			}
			subEdit { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+x"))
					setbtnimage(self,"images/cut.png")
					settext("Cut")
					setclickevent("pCut()")
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+c"))
					setbtnimage(self,"images/copy.png")
					settext("Copy")
					setclickevent("pCopy()")
				}
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+v"))
					setbtnimage(self,"images/paste.png")
					settext("Paste")
					setclickevent("pPaste()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+i"))
					setbtnimage(self,"images/font.png")
					settext("Font")
					setclickevent("pFont()")
				}
				addseparator()
				addaction(oAction)
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+f"))
					setbtnimage(self,"images/search.png")
					settext("Find and Replace")
					setclickevent("pFind()")
				}
				addaction(oAction)
			}				
			subView {
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+j"))
					setbtnimage(self,"images/project.png")
					settext("Project Files")
					setclickevent("pProject()")
				}
				addaction(oAction)			
				addseparator()	
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+u"))
					setbtnimage(self,"images/source.png")
					setclickevent("pSourceCode()")
					settext("Goal Designer")
				}
				addaction(oAction)	
			}
			subProgram { 
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+d"))
					setbtnimage(self,"images/debug.png")
					settext("Debug (Run then wait!)")
					setclickevent("pDebug()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+r"))
					setbtnimage(self,"images/run.png")
					settext("Run")
					setclickevent("pRun()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win) {
					setShortcut(new QKeySequence("Ctrl+F5"))
					setbtnimage(self,"images/run.png")
					settext("Run GUI Application (No Console)")
					setclickevent("pRunNoConsole()")
				}
				addaction(oAction)	
			}
			subHelp { 

				subHelpLF = addmenu("Language Reference")
				subHelpLF { 
					oAction = new qAction(win) {
						settext("CHM File")
						setclickevent("pOpenCHM()")
					}
					addaction(oAction)
					oAction = new qAction(win) {
						settext("PDF File")
						setclickevent("pOpenPDF()")
					}
					addaction(oAction)
				}
				addseparator()
				subHelpTools = addmenu("Development Tools")
				subHelpTools { 

					oAction = new qAction(win) {
						settext("Programming Language")
						setclickevent("pLang()")
					}
					addaction(oAction)
					oAction = new qAction(win) {
						settext("GUI Library")
						setclickevent("pGUI()")
					}
					addaction(oAction)
				}
				addseparator()
					oAction = new qAction(win) {
						settext("About")
						setclickevent("pAbout()")
					}
					addaction(oAction)			
			}
		}
		win.setmenubar(menu1)

	func CreateToolbar win
		aBtns = [
				new qpushbutton(win) { 
					setbtnimage(self,"images/new.png") 
					setclickevent("pNew()")
					settooltip("New File")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/open.png") 
					setclickevent("pOpen()")
					settooltip("Open File")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/save.png")
					setclickevent("pSave()")
					settooltip("Save")
				 } ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/saveas.png")
					setclickevent("pSaveAs()")
					settooltip("Save As")
				 } ,
				
				new qpushbutton(win) { 
					setbtnimage(self,"images/debug.png") 
					setclickevent("pDebug()")
					settooltip("Debug (Run then wait!)")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/run.png") 
					setclickevent("pRun()")
					settooltip("Run the program")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/rungui.bmp") 
					setclickevent("pRunNoConsole()")
					settooltip("Run GUI Application (No Console)")
				} ,
				new qpushbutton(win) { 
					setbtnimage(self,"images/close.png") 
					setclickevent("pQuit()")
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
			ofile = new QFileSystemModel() {
				setrootpath(oDir.currentpath())				
				myfiles = new qstringlist()
				myfiles.append("*.pwct")
				setnamefilters(myfiles)	
				setNameFilterDisables(false)
			}
			setmodel(ofile)
			myindex = ofile.index(oDir.currentpath(),0)
			for x = 1 to ofile.columncount() {
				hidecolumn(x)
			}
			setcurrentindex(myindex)
			setexpanded(myindex,true)
			header().hide()			
		}
		oDock1 = new qdockwidget(win,0) {
			setGeometry(00,00,200,200)
			setwindowtitle("Project Files")
			setwidget(tree1)
		}
		win.adddockwidget(1,oDock1,1)

	func CreateGoalDesigner win
		Open_Window(:GoalDesignerController)		
		oDock2 = new qdockwidget(win,0) {
			setwidget(last_window().oView.win)
			setwindowtitle("Goal Designer")			
		}
		win.adddockwidget(2,oDock2,2)		

	func CreateStatusBar win
		status1 = new qstatusbar(win) {
			showmessage("Ready!",0)
		}
		win.setstatusbar(status1) 
