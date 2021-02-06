load "guilib.ring"
 new qApp {
	w = new qWidget() { 
	setWindowTitle("Testing Menubar")
	move(400,400)
	resize(400,400)
	
		new QMenubar(w) { 
		
			filemenu = addMenu("File")
			filemenu { 
			
				exitAction = new QAction(fileMenu) { 
					setText("Exit")
					setClickEvent("w.close()")
				
				
				}
				addAction(exitAction)
				
			}
		}
	show()
	}
 exec() 
}
