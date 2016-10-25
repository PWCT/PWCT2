load "stdlib.ring"
load "guilib.ring"
load "translation/english.ring"

new qApp {
	win = new qMainWindow() {
		setWindowTitle(T_GD_WindowTitle) # "Programming Without Coding Technology"
		showMaximized()
	}
	exec()
}
