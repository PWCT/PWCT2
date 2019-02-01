/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  PWCT Main File
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load Ring Libraries
	load "stdlib.ring"
	load "guilib.ring"
	load "tracelib.ring"

# Load General Libraries
	load "general/general.ring"

# Load the Translation File
	load "translation/translation.ring"
	
# Load the Environment Files
	load "environment/environment.ring"
	
# Load the Goal Designer Files
	load "goaldesigner/goaldesigner.ring"

# Load the Components Browser Files
	load "componentsbrowser/componentsbrowser.ring"
	
# Load the component classes
	load "component/controller/componentcontrollerparent.ring"
	load "component/view/componentviewparent.ring"
	
# Load the File System Files
	load "filesystem/filesystem.ring"

# Quick Message 
	load "general/quickmsgController.ring"

# Load Components 
	load "vpl/ringpwct/ringpwct.ring"

# Load the Form Designer 
	load "formdesigner/formdesigner.ring"

# Load the Web Server - ServerPrepare Class
	load "../libdepwin/Apache2.2/ring/prepare.ring"

# Mobile functions 
	load "mobile/mobilefunctions.ring"

# Run PWCT Environment
	Start_Environment()
