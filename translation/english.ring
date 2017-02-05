/* 
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
** 	File Purpose : Translation File
** 	Language : English
**	Date : 2016.10.25
** 	Author : Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Layout Direction
	T_LAYOUTDIRECTION = 0		# Left to Right

# Goal Designer Window

	T_GD_GOALDESIGNER = "Goal Designer"			# The Window Title
	T_GD_DESIGN = "Design"					# Tab Page
	T_GD_STEPCODE = "Step Code"				# Tab Page
	T_GD_NEWSTEP = "New Step"				# Button	
	T_GD_EDITSTEP = "Edit Step"				# Button
	T_GD_DELETESTEP = "Delete Step"				# Button
	T_GD_MOVEUP = "Move Up"					# Button
	T_GD_MOVEDOWN = "Move Down"				# Button
	T_GD_PRINTSTEPS = "Print Steps"				# Button
	T_GD_CUT = "Cut"						# Button
	T_GD_COPY = "Copy"						# Button
	T_GD_PASTE = "Paste"					# Button
	T_GD_INCERASESIZE = "Increase Size"			# Button
	T_GD_DECREASESIZE = "Decrease Size"			# Button
	T_GD_SEARCH = "Search"					# Button
	T_GD_COMMENTUNCOMMENT = "Comment/UnComment"  # Button


	# Steps Tree
	T_GD_Firststep  = "Start Point (Not Step)"
	T_GD_StepsTree = "Steps Tree"

	# New Step
	T_GD_NEWSTEP_ENTERSTEPNAME = "Enter the step name?"
	T_GD_NEWSTEP_STEPNAME = "Step Name"

	# Delete Step
	T_GD_DELETESTEP_DELETESTEP = "Delete Step"
	T_GD_DELETESTEP_AREYOUSURE = "Are you sure?"
	T_GD_DELETESTEP_DOYOUWANT = "Do you want to delete the step?"

	# Files
	T_GD_OPENFILE = "Open File"
	T_GD_SAVEFILE = "Save File"

	# Using Components
	T_GD_INTERACT = "Interact"
	T_GD_MODIFY    = "Modify"

	# Buttons Messages
	T_GD_BM_SORRY 	= "Sorry"
	T_GD_BM_CANTADD 	= "Can't Add New Step in this location!"
	T_GD_BM_CANTEDIT	= "Can't Edit Generated Step, Use Modify!"
	T_GD_BM_CANTDELETE = "Can't Delete Sub Step!"
	T_GD_BM_CANTMOVEUP = "Can't Move Sub Step Up!"
	T_GD_BM_CANTMOVEDOWN = "Can't Move Sub Step Down!"
	T_GD_BM_CANTCUT = "Can't Cut Sub Step!"
	T_GD_BM_CANTCOPY = "Can't Copy Sub Step!"
	T_GD_BM_CANTPASTE = "Can't paste steps in this step!"
	T_GD_BM_CANTCOMMENT = "Can't Comment/Uncomment Sub Step!"
	T_GD_BM_CANTINTERACT = "Can't start new Interaction from this step!"

	# Dialog
	T_GD_DM_OPENFILE = "Open File"
	T_GD_DM_SAVEFILE = "Save File"
	T_GD_DM_FILETYPE = "source files(*.pwct)"

# Print Steps Window
	T_GD_PS_PRINTSTEP = "Print Steps"				# The Window Title
	T_GD_PS_STEPSTREE = "Steps Tree"			# Tab Page Header
	T_GD_PS_SOURCECODE = "Source Code"			# Tab Page Header
	T_GD_PS_PRINTSTEPSTREE = "Print Steps Tree"		# Button
	T_GD_PS_PRINTSOURCECODE = "Print Source Code"	# Button
	T_GD_PS_CLOSE = "Close"					# Button

# Find Step Window

	T_GD_FS_FINDREPLACE = "Find/Replace"		# The Window Title
	T_GD_FS_FINDWHAT = "Find What : "		# Label
	T_GD_FS_REPLACEWITH = "Replace with "		# Label
	T_GD_FS_CASESENSITIVE = "Case Sensitive"	# CheckBox
	T_GD_FS_RESULTS = "Results"			# Label
	T_GD_FS_SEARCH = "Search"			# Button
	T_GD_FS_REPLACE = "Replace"			# Button
	T_GD_FS_REPLACEALL = "Replace All"		# Button
	T_GD_FS_CLOSE = "Close"				# Button
	T_GD_FS_SORRY = "Sorry"				
	T_GD_FD_CANTFINDTHEITEM  = "Can't find the step"

# Components Browser Window

	T_CB_COMPONENTSBROWSER = "Components Browser"
	T_CB_SEARCH	= "Search"
	T_CB_COMPONENTSTREE = "Components Tree"
	T_CB_RINGPWCT = "RingPWCT"
	T_CB_SELECT = "Ok"
	T_CB_CLOSE = "Close"

# Interaction Pages
	T_IP_WINDOWTITLE = "Interation Window"
	T_IP_AGAIN = "Again"
	T_IP_OK = "Ok"
	T_IP_CLOSE = "Close"

#==================================================

T_CB_COMPONENTSFILE = "vpl/components.pwct"

#==================================================
# 	Components  Translation
#==================================================

# Print Component

	# Steps Tree
		T_CT_PRINT_ST_PRINT = "Print "
	# Interaction Page
		T_CT_PRINT_IP_TITLE  = "Print Component"
		T_CT_PRINT_IP_TEXT = "Text : "
		T_CT_PRINT_IP_TYPE = "Type :"
		T_CT_PRINT_IP_TYPELIST = ["Literal","Expression"]


# IF Statement Component

	# Steps Tree
		T_CT_IFSTATEMENT_ST_IF = "If "
		T_CT_IFSTATEMENT_ST_STARTHERE = "Start Here"
		T_CT_IFSTATEMENT_ST_ENDOFIFSTATEMENT = "End of IF Statement"

	# Interaction Page
		T_CT_IFSTEATEMENT_IP_TITLE  = "If Statement Component"
		T_CT_IFSTEATEMENT_IP_CONDITION = "Condition : "
