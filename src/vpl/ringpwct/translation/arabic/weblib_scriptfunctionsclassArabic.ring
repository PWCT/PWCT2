/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  weblib_scriptfunctionsclass Component
**	Date : 2018.03.21
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

T_CT_WEBLIB_SCRIPTFUNCTIONSCLASS_IP_TITLE = "مكون فئة دوال الاسكربت"
T_CT_WEBLIB_SCRIPTFUNCTIONSCLASS_IP_VALUE = "اسم الكائن :"
T_CT_WEBLIB_SCRIPTFUNCTIONSCLASS_IP_VALUE2 = "الميثود : "

T_CT_WEBLIB_SCRIPTFUNCTIONSCLASS_IP_VALUE2FUNC = [
	"script",
	"scriptfunc",
	"scriptfuncajax",
	"scriptfuncalert",
	"scriptfuncclean",
	"scriptfuncselect",
	"scriptredirection",
	"scriptscrollfixed"
]
# Copy the list to support changing the generated method name in the Steps Tree
T_CT_WEBLIB_SCRIPTFUNCTIONSCLASS_IP_VALUE2STEPFUNC = T_CT_WEBLIB_SCRIPTFUNCTIONSCLASS_IP_VALUE2FUNC
T_CT_WEBLIB_SCRIPTFUNCTIONSCLASS_IP_VALUE2LIST = [
	"script(cCode) --> String",
	"scriptfunc(cFuncName,cCode) --> String",
	"scriptfuncajax(cFuncName,cLink,cDiv) --> String",
	"scriptfuncalert(cFuncName,cMsg) --> String",
	"scriptfuncclean(cFuncName,cDiv) --> String",
	"scriptfuncselect(cFuncName,aList,cDiv,cResult,cGridRow,cFuncClean,nTimeOut,cLink1,cLink2) --> String",
	"scriptredirection(cDir) --> String",
	"scriptscrollfixed(cDiv,nSize) --> String"
]
T_CT_WEBLIB_SCRIPTFUNCTIONSCLASS_IP_VALUE3 = "المعطيات :"
T_CT_WEBLIB_SCRIPTFUNCTIONSCLASS_IP_VALUE4 = "الناتج :"