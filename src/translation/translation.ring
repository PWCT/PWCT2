/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  Translation
**	Date : 2019.02.01
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "english.ring"

	lUseArabic = True

# Check Arabic Translation
	if UseArabic() {
		load "arabic.ring"
	}

func UseArabic 
	# Check System Parameters 
		for item in sysargv item = lower(item) next 
		if find(sysargv, :arabic) { return True }
	# Check Settings File 
		C_ENV_DEFAULT_LANG = C_TRANSLATION_ENGLISH
		cCurrentDir = CurrentDir() + "/"	# The PWCT Folder
		if PWCTISMobile(:INIFile) {
			cSettingsFile = cCurrentDir + "/PWCTApp/runtime/pwct.ini"
		else 
			cSettingsFile = cCurrentDir + "pwct.ini"
		}
		if fexists(cSettingsFile) { 
			eval(read(cSettingsFile))
		}
		if C_ENV_DEFAULT_LANG	= C_TRANSLATION_ARABIC {
			return True 
		}
	return lUseArabic
