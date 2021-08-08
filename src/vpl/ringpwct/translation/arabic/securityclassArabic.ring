/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  securityclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

T_CT_SECURITYCLASS_IP_TITLE = "مكون فئة الأمان"
T_CT_SECURITYCLASS_IP_VALUE = "اسم الكائن :"
T_CT_SECURITYCLASS_IP_VALUE2 = "الميثود : "

T_CT_SECURITYCLASS_IP_VALUE2FUNC = [
	"decrypt",
	"encrypt",
	"md5",
	"randbytes",
	"sha1",
	"sha224",
	"sha256",
	"sha384",
	"sha512"
]
# Copy the list to support changing the generated method name in the Steps Tree
T_CT_SECURITYCLASS_IP_VALUE2STEPFUNC = T_CT_SECURITYCLASS_IP_VALUE2FUNC
T_CT_SECURITYCLASS_IP_VALUE2LIST = [
	"decrypt(cString,cKey,cIV) --> String",
	"encrypt(cString,cKey,cIV) --> String",
	"md5(cString) --> String",
	"randbytes(nSize) --> String",
	"sha1(cString --> String)",
	"sha224(cString) --> String",
	"sha256(cString) --> String",
	"sha384(cString) --> String",
	"sha512(cString) --> String"
]
T_CT_SECURITYCLASS_IP_VALUE3 = "المعطيات :"
T_CT_SECURITYCLASS_IP_VALUE4 = "الناتج :"