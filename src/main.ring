/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  PWCT Main File
**	Date : 2016.10.25
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load Ring Libraries
	load "stdlibcore.ring"
	load "guilib.ring"

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
	load "component/component.ring"

# Load the File System Files
	load "filesystem/filesystem.ring"

# Load Components 
	load "vpl/ringpwct/ringpwct.ring"

# Load the Form Designer 
	load "formdesigner/formdesigner.ring"

# Load the Web Server - ServerPrepare Class
	load "../extensions/libdepwin/Apache2.2/ring/prepare.ring"

# Mobile functions 
	load "mobile/mobilefunctions.ring"

# Ring2PWCT 
	load "tools/import/importfiles.ring"
	load "tools/vsfgenerator/vsfgenerator.ring"

# Load the Expression Builder
	load "tools/exprbuilder/ExprBuilderController.ring"

# RightToLeft() function
	if isWindows() and T_LAYOUTDIRECTION {
		load "winlib.ring"
	}

# Ring2PWCT Arabic Syntax
	if T_LANGUAGE = "Arabic" {
		load "tools/import/arabicsyntax.ring"
	}

# Run PWCT Environment (See environment/environment.ring)
	StartEnvironment()	
