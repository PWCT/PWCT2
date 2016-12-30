/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Time Machine View Class
**	Date : 2016.12.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TimeMachineView from QSlider

	nInteractionPoints = 0
	nActiveInteraction = 0

	func init win
		super.init(win)
		resize(400,30)
		setMinimum(0)
		setMaximum(nInteractionPoints)
		setorientation(Qt_Horizontal)
		# we return self to be able to use braces {} after calling init()
			return self

	func setInteractionPoints nCount
		# we uses -1 to avoid counting the start point interaction
			nInteractionPoints = nCount-1
		setMaximum(nInteractionPoints)
		setEnabled(False)		# To disable value changed event
		setValue(nInteractionPoints)
		setEnabled(True)		# To enable value changed event 
		nActiveInteraction = nInteractionPoints  

	func GetActiveInteraction
		return nActiveInteraction

	func SetActiveInteraction nValue
		nActiveInteraction = nValue
