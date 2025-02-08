/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  stringclass Component
**	Date : 2017.12.14
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


T_CT_STRINGCLASS_IP_TITLE = "مكون فئة العبارة الحرفية String"
T_CT_STRINGCLASS_IP_VALUE = "اسم الكائن :"
T_CT_STRINGCLASS_IP_VALUE2 = "الميثود : "

T_CT_STRINGCLASS_IP_VALUE2FUNC = [
	"copy",
	"endswith",
	"getfrom",
	"init",
	"left",
	"lines",
	"lower",
	"mid",
	"operator",
	"pos",
	"print",
	"println",
	"replace",
	"right",
	"set",
	"size",
	"split",
	"startswith",
	"strcmp",
	"tofile",
	"tolist",
	"trim",
	"upper",
	"value"
]
# Copy the list to support changing the generated method name in the Steps Tree
T_CT_STRINGCLASS_IP_VALUE2STEPFUNC = [
    "نسخ",
    "ينتهي_ب",
    "احصل_من",
    "تهيئة",
    "يسار",
    "خطوط",
    "أحرف_صغيرة",
    "وسط",
    "معامل",
    "موضع",
    "طباعة",
    "طباعة_سطر",
    "استبدال",
    "يمين",
    "ضبط",
    "حجم",
    "تقسيم",
    "يبدأ_ب",
    "مقارنة_سلسلة",
    "الى_ملف",
    "الى_قائمة",
    "ازالة_المسافات",
    "أحرف_كبيرة",
    "قيمة"
]

/*
T_CT_STRINGCLASS_IP_VALUE2LIST = [
	"copy(nCount) --> String (Object)",
	"endswith(cSubString) --> Boolean",
	"getfrom(nPos1)",
	"init(string|number|list)",
	"left(nCount) --> String (Object)",
	"lines() --> Number",
	"lower() --> String (Object)",
	"mid(nPos1,nPos2) --> String (Object)",
	"operator(cOperator,Para) --> String (Object)",
	"pos(cSubString) --> Number",
	"print()",
	"println()",
	"replace(cStr1,cStr2,lCase) --> String (Object)",
	"right(nCount) --> String (Object)",
	"set(x)",
	"size() --> Number",
	"split() --> List",
	"startswith(cSubString) --> Boolean",
	"strcmp(x) --> Number",
	"tofile(cFileName)",
	"tolist() --> List",
	"trim() --> String (Object)",
	"upper() --> String (Object)",
	"value() --> String"
]
*/

T_CT_STRINGCLASS_IP_VALUE2LIST = [
    "نسخ(عدد) --> سلسلة (كائن)",
    "ينتهي_ب(سلسلة_فرعية) --> منطقي",
    "احصل_من(موضع1)",
    "تهيئة(سلسلة|رقم|قائمة)",
    "يسار(عدد) --> سلسلة (كائن)",
    "خطوط() --> رقم",
    "أحرف_صغيرة() --> سلسلة (كائن)",
    "وسط(موضع1,موضع2) --> سلسلة (كائن)",
    "معامل(معامل,معامل) --> سلسلة (كائن)",
    "موضع(سلسلة_فرعية) --> رقم",
    "طباعة()",
    "طباعة_سطر()",
    "استبدال(سلسلة1,سلسلة2,حالة) --> سلسلة (كائن)",
    "يمين(عدد) --> سلسلة (كائن)",
    "ضبط(س)",
    "حجم() --> رقم",
    "تقسيم() --> قائمة",
    "يبدأ_ب(سلسلة_فرعية) --> منطقي",
    "مقارنة_سلسلة(س) --> رقم",
    "الى_ملف(اسم_الملف)",
    "الى_قائمة() --> قائمة",
    "ازالة_المسافات() --> سلسلة (كائن)",
    "أحرف_كبيرة() --> سلسلة (كائن)",
    "قيمة() --> سلسلة"
]

T_CT_STRINGCLASS_IP_VALUE3 = "المعطيات :"
T_CT_STRINGCLASS_IP_VALUE4 = "الناتج :"
