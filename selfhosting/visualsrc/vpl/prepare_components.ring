load "stdlib.ring"
? "Started"
aFiles = dir("ringpwct")
aFiles2 = []
for item in aFiles step 1 { 
	if (item[1]! = "ringpwct.ring") AND substr(item[1],".ring") { 
		aFiles2+item[1]
	} 
} 
cContent = "/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	: Load RingPWCT Components 
**	Date 		: 2017.10.02
**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
*/

C_VPL_NAME = 'RingPWCT'

# Load RingPWCT Components 

"
for cFile in aFiles2 step 1 { 
	cContent += (Char(9)+'load "'+cFile+'"'+nl)
} 
cContent += "
	
# Add components to the Components list 

	cComponentsPath = C_CB_COMPONENTSPATH

"
for cFile in aFiles2 step 1 { 
	cContent += (Char(9)+'aComponentsFilesList + (cComponentsPath + "'+cFile+'")'+nl)
} 
? "Writing ringpwct.ring"
cContent = substr(cContent,nl,windowsnl())
write("ringpwct\ringpwct.ring",cContent)
? "Done"
