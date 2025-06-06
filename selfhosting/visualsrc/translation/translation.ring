#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  Translation
#**	Date : 2019.02.01
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
load "english.ring"
#In other files, Use lUseArabic Flag to check the language
#Don't use UseArabic() because it uses Eval() and update the settings
lUseArabic = False
#Check Arabic Translation
if UseArabic() { 
	lUseArabic = True
	load "arabic.ring"
} 
func UseArabic  { 
	#Check System Parameters
	for item in sysargv step 1 { 
		item = lower(item)
	} 
	if find(sysargv,:Arabic) { 
		return True
	} 
	#Check Settings File
	C_ENV_DEFAULT_LANG = C_TRANSLATION_ENGLISH
	cCurrentDir = CurrentDir()+"/"
	#The PWCT Folder
	if PWCTISMobile(:INIFile) { 
		cSettingsFile = cCurrentDir+"/PWCTApp/runtime/pwct.ini"
		else
			cSettingsFile = cCurrentDir+"pwct.ini"
	} 
	if fexists(cSettingsFile) { 
		eval(read(cSettingsFile))
	} 
	if C_ENV_DEFAULT_LANG = C_TRANSLATION_ARABIC { 
		return True
	} 
	return lUseArabic
} 
