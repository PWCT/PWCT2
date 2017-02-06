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

		status1 = new qstatusbar(win) {
			showmessage("Ready!",0)
		}

		setstatusbar(status1)

		tree1 = new qtreeview(win) {
			#setclickedevent("pChangeFile()")
			setGeometry(00,00,200,400)
			setmaximumwidth(300)
			#chdir(cStartUpFolder)
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
			chdir(exefolder())
		}

		oDock1 = new qdockwidget(win,0) {
			setGeometry(00,00,200,200)
			setwindowtitle("Project Files")
			setwidget(tree1)
		}

		adddockwidget(1,oDock1,1)
		#adddockwidget(2,oDock2,2)
		#adddockwidget(2,oDock3,1)

		#setwinicon(self,cCurrentDir + "/image/notepad.png")
		showmaximized()	

	}
