/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Time Machine View Class
**	Date : 2016.12.28
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class TimeMachineView from QSlider

	nInteractionPoints = 0	# Number of Interactions in the History
	nActiveInteraction = 0	# Number of the current active Interaction

	/*
		The next method set the default control attributes
		Parameters : The parent widget (QWidget)
		Output : Reference to the object (Self)
	*/

	func init win
		super.init(win)
		resize(400,30)
		setMinimum(0)
		setMaximum(nInteractionPoints)
		setorientation(Qt_Horizontal)
		# we return self to be able to use braces {} after calling init()
			return self

	/*
		The next method set the Maximum Interactions Count
		Then move to the last value (last Interaction)
		Parameters : nCount as Number
		Ouput : None
	*/

	func setInteractionPoints nCount
		# we uses -1 to avoid counting the start point interaction
			nInteractionPoints = nCount-1
		setMaximum(nInteractionPoints)		 
		cEvent = getValueChangedEvent()	# Save the event
		setValueChangedEvent("")		# Remove It
		setValue(nInteractionPoints)		# Change the value
		setValueChangedEvent(cEvent)	# Set the event again
		nActiveInteraction = nInteractionPoints  

	/*
		Get the number of Interaction Points 
	*/

	func getInteractionPoints 
		return nInteractionPoints

	/*
		The next method get the Active Interaction Number
		Parameters : None
		Output : The active interation number
	*/

	func GetActiveInteraction
		return nActiveInteraction

	/*
		The next method set the Active Interaction Number
		Parameters :  The active interation number
		Output : None
	*/

	func SetActiveInteraction nValue
		nActiveInteraction = nValue

	/*
		The next method check if the active interaction is the last one or not
		This to know if we are in the present or in the past
		Parameters : None
		Output : True/False based on the IsPresent status
	*/

	func IsPresent	# Last Interaction
		return (nInteractionPoints = nActiveInteraction)
