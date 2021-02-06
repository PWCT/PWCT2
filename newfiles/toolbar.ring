load "guilib.ring"
 new qApp {
	w = new qMainWindow()
		{
			b1 = new qPushButton(w) { 
			setText("test")
			move(10,10)
			resize(100,30)
			
			}
			tool1 = new QToolBar(w) { 
			move(0,0)
			resize(100,30)
			
				addwidget(b1)
			}
			show()
		}
 exec() 
}
