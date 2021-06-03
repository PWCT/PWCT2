/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	: Undo Controller Class
**	Date 		: 2021.06.03
**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
*/

class UndoController

	aHistory = []

	func AddToHistory oGDController 

		# Add the current state to the history 
			aHistory + [
				oGDController.oModel.oStepsTreeModel.GetData(),
				oGDController.oModel.oInteractionModel.GetData(),
				oGDController.oModel.oStepsTreeModel.GetID(),
				oGDController.oModel.oInteractionModel.GetID()
			]

		# Remove very old history 
			if len(aHistory) > 10 {
				del(aHistory,1)
			}

	func ClearHistory 
		
		aHistory = []

	func Undo oGDController

		# Check if we have slots in the history 
			if len(aHistory) = 0 {
				return 
			}
		# Update the View (Steps Tree)
			# Delete Steps that no longer exist
			# Add steps that doesn't exist  
		# Update the Model (Data)
		# Remove the current slot from the history 
			del(aHistory,len(aHistory))

 	
