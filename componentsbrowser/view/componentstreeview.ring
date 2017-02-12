/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Components Tree View Class
**	Date : 2017.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class ComponentsTreeView from StepsTreeView

	cControlHeader = T_CB_COMPONENTSTREE 
	cStartPointText = T_CB_RINGPWCT

	# We create the Init Method to avoid adding the root two times
	# As a result of nested call to AddStartPoint()

	/*
		Purpose : init. the object
		Parameters : None
		Output : reference to the object (Self)
	*/

	func Init win
		super.init(win)
		return self
