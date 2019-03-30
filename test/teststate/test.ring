load "guilib.ring"
new qApp {
	w = new qWidget() { resize(400,400) move(100,100) setwindowtitle("wow")
		b = new qPushButton(w) { setText("Wow") setClickevent("test()") }
		show()
	}
	exec()
}
func test
while true
mystate = ring_state_new()
ring_state_mainfile(mystate,"runprogram.ring")
ring_state_delete(mystate)
end