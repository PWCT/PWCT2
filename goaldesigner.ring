/*
	Programming Without Coding Technology (PWCT) Version 2.0
	Date : 2016.10.25
	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "stdlib.ring"
load "guilib.ring"
load "translation/english.ring"

# Goal Designer Window

new qApp {
	win = new qMainWindow() {
		setWindowTitle(T_GD_WindowTitle) # "Goal Designer"
		showMaximized()
	}
	exec()
}
