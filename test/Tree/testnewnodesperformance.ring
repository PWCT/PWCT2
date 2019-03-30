load "guilib.ring"

win = null tree=null root = null

new myapp { start() }

class myapp
	
	func start 
		new qApp {
			win = new qWidget() { 
				tree = new qtreewidget(win) { move(10,10) resize(400,400) }
				root = new qTreeWidgetItem()
				rootlabel = new qLabel(win)
				rootlabel.settext("The Root Node")
				tree.addtoplevelitem(root)
				tree.setitemwidget(root,0,rootlabel)
				t1 = clock()
				tree.blocksignals(True)
				for t = 1 to 500
					this.test(t)
				next
				tree.blocksignals(False)
				? "Time " + (clock()-t1)/clockspersecond()
				show() 
			}
			exec()
		}
	
	func test  t
		v = new qTreeWidgetItem()
		l = new qLabel(win) { resize(10,10) } 
		l.settext("Item <b>" + t + '</b> <font color="blue">This is some text!</font>')
		root.addchild(v)
		# Using setitemwidget is what consumes most of the time 
		# And using it without resize() on qLabel kill the performance !
		# Using resize() decrease the time from over 2 seconds to just 0.18 second!
		tree.setitemwidget(v,0,l)
	
