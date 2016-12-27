/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Interaction Model Class
**	Date : 2016.12.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

class InteractionModel

	nID = 0	# The ID Counter
	aList = []	# Interactions List [ ID , nType, Component , Date , Time ]
			# Interaction Type is C_INTERACTION_USERSTEP or
			# 			C_INTERACTION_GENERATEDSTEP

	/*
		The next method is used when the user create a step 
		The user step is used for organization (Comment) or (Written Code by hand)
	*/
	func AddUserInteraction
		nID++		# Increment the ID Counter
		aList + [nID,C_INTERACTION_USERSTEP,NULL,Date(),Time()]
		return nID

	/*
		The next method is used to update the Interaction ID of a step after paste
		We create new Interaction Record with the same information
		But with a different ID
	*/
	func NewInteractionIDAfterPaste nStepInteractionID
		# Find the interaction record
			nPos = find(aList,1,nStepInteractionID)
		# Get the interaction record
			aTempList = aList[nPos]
		# Update the interaction ID
			nID++		# Increment the ID Counter
			aTempList[1] = nID
		# Add the new interaction record
			aList + aTempList
		# Return the new interaction ID 
		return nID
		
