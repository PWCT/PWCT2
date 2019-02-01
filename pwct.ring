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
	load "translation/english.ring"
	for item in sysargv item = lower(item) next 
	if find(sysargv, :arabic) {
		eval( ' load "translation/arabic.ring" ' )
	}

# We need this on macOS when we run the executable from finder!
	if ismacosx() and justfilename(exefilename()) != "ring" {
		chdir(exefolder())
	}
	
# Load the Environment Files
	load "environment/environment.ring"
	
# Load the Goal Designer Files
	load "goaldesigner/goaldesigner.ring"

# Load the Components Browser Files
	load "componentsbrowser/controller/componentsbrowsercontroller.ring"
	load "componentsbrowser/view/componentsbrowserview.ring"
	load "componentsbrowser/view/componentstreeview.ring"
	load "componentsbrowser/componentslist.ring"
	
# Load the component classes
	load "component/controller/componentcontrollerparent.ring"
	load "component/view/componentviewparent.ring"
	
# Load the File System Files
	load "filesystem/databasesqlite.ring"
	load "filesystem/databasesqliteqt.ring"
	load "filesystem/database.ring"
	load "filesystem/visualsourcefile.ring"

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
