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
		cText = "Item <b>" + t + '</b> <font color="blue">This is some text!</font>'
		//cText = "Item " + t + 'This is some text!'
		l.settext(cText+cText+cText)
		root.addchild(v)
		# Using setitemwidget is what consumes most of the time 
		# And using it without resize() on qLabel kill the performance !
		# Using resize() decrease the time from over 2 seconds to just 0.18 second!
		tree.setitemwidget(v,0,l)
