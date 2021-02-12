/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  System Log
**	Date : 2018.05.29
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "guilib.ring"
load "stdlib.ring"

oSystemLog = new SystemLog 

if isMainSourceFile() {
	oSystemLog.addMessage("Message 1")
	sleep(0.2)
	oSystemLog.addMessage("Message 2")
	sleep(0.4)
	oSystemLog.addMessage("Message 3")
	oSystemLog.addText("Text 1")
	oSystemLog.addText("Text 2")
	new qApp {
		oSystemLog.show()
		exec()
	}
}

class systemlog

	win
	aLog = []
	nLastClock = 0

	func addmessage cMsg
		nClock = clock()
		if nLastClock = 0 {
			nLastClock = nClock
		}
		nTimeDiff = ((nClock-nLastClock)/clockspersecond())
		nTimeDiff = "" + nTimeDiff 
		nTimeDiff = copy("0",5-len(nTimeDiff)) + nTimeDiff 
		aLog + ( date() + " - " + Time() +
			 " - Time from last message : " +
			 nTimeDiff + " Seconds - " + 
			 cMsg )
		nLastClock = nClock

	func addtext cMsg 
		aLog + cMsg

	func show
		win = new qWidget() {
			win = this.win
			resize(1000,600)
			setWindowTitle(T_SYSLOG_TITLE) # "System Log"
			setWindowFlags(Qt_Window | Qt_WindowTitleHint  | Qt_CustomizeWindowHint)
			textlog = new qTextEdit(win)
			btnclose = new qPushbutton(win) {
				setText(T_SYSLOG_CLOSE) # "Close"
				setClickEvent("oSystemlog.win.close()")
			}
			layout1 = new qVBoxLayout() {
				addwidget(textlog)
				addwidget(btnclose)
			}
			setLayout(layout1)
			show()
		}
		textlog.setText(list2str(aLog))
