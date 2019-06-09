load "guilib.ring"

win = null tree=null root = null

new myapp { start() }

class myapp
	
	func start 
		new qApp {
			win = new qWidget() { 
				setWindowTitle("Test Tree Performance")
				resize(800,600)
				tree = new qtreewidget(win) { move(10,10) resize(400,400) }
				root = new qTreeWidgetItem()
				rootlabel = new qLabel(win)
				rootlabel.settext("The Root Node")
				tree.addtoplevelitem(root)
				tree.setitemwidget(root,0,rootlabel)
				t1 = clock()
				? t1
				tree.blocksignals(True)
				for t = 1 to 1000
					this.test(t)
				next
				tree.blocksignals(False)
				root.setexpanded(True)				
				show() 
				? clock()
				? "Time " + (clock()-t1)/clockspersecond()
				oLayout = new QVBoxlayout() {
					AddWidget(tree)
				}
				setLayout(oLayout)
			}
			exec()
		}
	
	func test  t
		v = new qTreeWidgetItem()
		l = new qLabel(win) { resize(550,10) } 

		cText = "Item " + t
		l.settext(cText+cText+cText)
		if t%2 = 0
			l.setStylesheet("color:white;background-color:purple;")
		else 
			l.setStylesheet("color:white;background-color:red;")
		ok
		oWidget = new qWidget()
		oLayout = new qHBoxLayout()
		oLayout.addwidget(l)

		l = new qLabel(win) { resize(550,10) } 
		cText = "Item " + t
		l.settext(cText+cText+cText)
		l.setStylesheet("color:black;background-color:white;")
		oLayout.addwidget(l)

		l = new qLabel(win) { resize(550,10) } 
		cText = "Item " + t
		l.settext(cText+cText+cText)
		l.setStylesheet("color:white;background-color:green;")
		oLayout.addwidget(l)


		oWidget.setLayout(oLayout)


		root.addchild(v)
		tree.setitemwidget(v,0,oWidget)
