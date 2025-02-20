#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  securityclass Component
#**	Date : 2018.03.16
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
T_CT_SECURITYCLASS_IP_TITLE = "مكون فئة الأمان"
T_CT_SECURITYCLASS_IP_VALUE = "اسم الكائن :"
T_CT_SECURITYCLASS_IP_VALUE2 = "الميثود : "
T_CT_SECURITYCLASS_IP_VALUE2FUNC = ["decrypt","encrypt","md5","randbytes","sha1","sha224","sha256","sha384","sha512"]
#Copy the list to support changing the generated method name in the Steps Tree
T_CT_SECURITYCLASS_IP_VALUE2STEPFUNC = ["فك_التشفير","تشفير","معدل_تجزئة_MD5","بايتات_عشوائية","معدل_تجزئة_SHA1","معدل_تجزئة_SHA224","معدل_تجزئة_SHA256","معدل_تجزئة_SHA384","معدل_تجزئة_SHA512"]
#/*
#T_CT_SECURITYCLASS_IP_VALUE2LIST = [
#	"decrypt(cString,cKey,cIV) --> String",
#	"encrypt(cString,cKey,cIV) --> String",
#	"md5(cString) --> String",
#	"randbytes(nSize) --> String",
#	"sha1(cString --> String)",
#	"sha224(cString) --> String",
#	"sha256(cString) --> String",
#	"sha384(cString) --> String",
#	"sha512(cString) --> String"
#]
#*/
T_CT_SECURITYCLASS_IP_VALUE2LIST = ["فك_التشفير(سلسلة,مفتاح,متجه_التهيئة) --> سلسلة","تشفير(سلسلة,مفتاح,متجه_التهيئة) --> سلسلة","معدل_تجزئة_MD5(سلسلة) --> سلسلة","بايتات_عشوائية(حجم) --> سلسلة","معدل_تجزئة_SHA1(سلسلة) --> سلسلة","معدل_تجزئة_SHA224(سلسلة) --> سلسلة","معدل_تجزئة_SHA256(سلسلة) --> سلسلة","معدل_تجزئة_SHA384(سلسلة) --> سلسلة","معدل_تجزئة_SHA512(سلسلة) --> سلسلة"]
T_CT_SECURITYCLASS_IP_VALUE3 = "المعطيات :"
T_CT_SECURITYCLASS_IP_VALUE4 = "الناتج :"
