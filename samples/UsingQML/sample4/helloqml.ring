load "guilib.ring"

new qApp {
	w = new qWidget() {
		setWindowTitle("Using QML") resize(650,650) move(100,100)
		oQuick = new qQuickWidget(w) {
			engine().AddImportPath(exefolder()+"qml")
			setSource(new qURL("locale.qml") )
		}
		oLayout = new qVBoxlayout() {
			AddWidget(oQuick)
		}
		setlayout(oLayout)
		show()
	}
	exec()
}
