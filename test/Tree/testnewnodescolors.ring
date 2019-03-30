load "guilib.ring"
? :welcome
win = null tree=null root = null
brush = null
new myapp { start() }

class myapp
	
	func start 
		? :here1
		new qApp {
			win = new qWidget() { 
				resize(600,600)
				tree = new qtreewidget(win) { move(10,10) resize(400,400) }
				root = new qTreeWidgetItem()
				rootlabel = new qLabel(win)
				rootlabel.settext("The Root Node")
				tree.addtoplevelitem(root)
				tree.setitemwidget(root,0,rootlabel)
				t1 = clock()
				for t = 1 to 500
					this.test(t)
				next
				? "Time " + (clock()-t1)/clockspersecond()
				show() 
			}
			exec()
		}
	
	func test  t
		v = new qTreeWidgetItem()
		colorGreen = new qcolor() { setrgb(000,204,000,255) }
		brush = new qbrush() { setstyle(0) setcolor (colorGreen)}
		//v.setforeground(0,brush)
		v.settext(0,"Item <b>" + t + '</b> <font color="blue">This is some text!</font>')
		root.addchild(v)
