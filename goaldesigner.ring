load "stdlib.ring"
load "guilib.ring"

new qApp {
	win = new qMainWindow() {
		setWindowTitle("Programming Without Coding Technology")
		showMaximized()
	}
	exec()
}
