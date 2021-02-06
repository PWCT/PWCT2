load "guilib.ring"
oApp = new qApp
{
	win = new qWidget()
	{
		setwindowtitle("Hello World")
		resize(400,400)
		move(100,100)
			btn = new qPushButton(win)
			{
				settext("Close")
				setclickevent("win.close()")
			}
			lbl = new qLabel(win)
			{
				settext("Hello, World!")
			}
			oLayout = new qVBoxLayout()
			{
				addwidget(lbl)
				addwidget(btn)
			}
			setlayout(oLayout)
		show()
	}
	exec()
}
