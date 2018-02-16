load "guilib.ring"
 new qApp {
	w = new qMainWindow()
		{
			oStatus = new QStatusBar(w) { 
			
				showmessage("wow",0)
			w.setStatusbar(self)
			}
			show()
		}
 exec() 
}
