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
		# Increment the ID Counter
			nID++		
		# Add the new interaction record
			aList + [nID,C_INTERACTION_USERSTEP,NULL,Date(),Time()]
		# Return the new Interaction ID
			return nID

	/*
		The next method is used to update the Interaction ID of a step after paste
		We create new Interaction Record with the same information
		But with a different ID
	*/
	func NewInteractionIDAfterPaste nStepInteractionID
		# Find the interaction record
			nPos = find(aList,nStepInteractionID,1)
		# Check the interaction record
			if nPos = 0 {
				return nStepInteractionID
			}
		# Get the interaction record
			aTempList = aList[nPos]
		# Update the interaction ID
			nID++		# Increment the ID Counter
			aTempList[1] = nID
		# Add the new interaction record
			aList + aTempList
		# Return the new interaction ID 
			return nID
	
	/*
		The next method is used to delete an Interaction Record
		The input is the Interaction ID
	*/
	func DeleteInteraction nStepInteractionID
		# Find the interaction record
			nPos = find(aList,nStepInteractionID,1)
		# Delete the record
			if nPos != 0 {		# Check that we have the record
				Del(aList,nPos)
			}

	/*
		The next method return the number of interaction
	*/
	func InteractionsCount
		return len(aList)

	/*
		The next method return the interaction record 
	*/
	func GetInteraction nIndex
		return aList[nIndex] 
	
	/*
		The next method return the interaction ID
	*/
	func GetInteractionID nIndex
		if nIndex = 0 { return 0 }
		if nIndex > len(aList) {  nIndex = len(aList) }
		return aList[nIndex][C_INTERACTIONRECORD_ID]
