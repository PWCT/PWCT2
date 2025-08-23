#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  General
#**	Date : 2019.02.01
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
load "globals.ring"
load "mainlib.ring"
load "log.ring"
load "quickmsgController.ring"
#We need this on macOS when we run the executable from finder!
if ismacosx() AND justfilename(exefilename()) != "ring" { 
	chdir(exefolder())
} 
