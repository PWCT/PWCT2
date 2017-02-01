func print_component oParent
	oGDWindow = oParent.RingQt_nID
	win = new qWidget() {
		resize(400,400)
		setWindowTitle("Print Component")
		new qPushButton(win) {
			setText(:test)
			setClickEvent("print_component_go($RingQt_ObjectsList[oGDWindow][2])")
		}
		show()
	}

func print_component_go oParent
	oItem = oParent.AddStep('test')
	oParent.oView.oStepsTree.SetCurrentItem(oItem,0)
	oItem = oParent.AddStep('one')
	nStepID = oParent.oView.oStepsTree.GetIDByObj(oItem)
	oParent.oModel.SaveStepCode(nStepID,"The one step code")
	oItem = oParent.AddStep('two')
	nStepID = oParent.oView.oStepsTree.GetIDByObj(oItem)
	oParent.oModel.SaveStepCode(nStepID,"The two step code")
