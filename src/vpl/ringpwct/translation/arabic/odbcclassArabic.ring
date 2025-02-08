/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  odbcclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

T_CT_ODBCCLASS_IP_TITLE = "مكون فئة الإتصال عبر ODBC "
T_CT_ODBCCLASS_IP_VALUE = "اسم الكائن :"
T_CT_ODBCCLASS_IP_VALUE2 = "الميثود : "

T_CT_ODBCCLASS_IP_VALUE2FUNC = [
	"autocommit",
	"close",
	"colcount",
	"columns",
	"commit",
	"connect",
	"datasources",
	"disconnect",
	"drivers",
	"execute",
	"fetch",
	"getdata",
	"init",
	"rollback",
	"tables"
]
# Copy the list to support changing the generated method name in the Steps Tree
T_CT_ODBCCLASS_IP_VALUE2STEPFUNC = [
    "تفعيل_التنفيذ_التلقائي",
    "اغلاق",
    "عدد_الاعمدة",
    "اعمدة",
    "تنفيذ",
    "اتصال",
    "مصادر_البيانات",
    "قطع_الاتصال",
    "برامج_التشغيل",
    "تنفيذ",
    "جلب",
    "احصل_على_بيانات",
    "تهيئة",
    "تراجع",
    "جداول"
]

/*
T_CT_ODBCCLASS_IP_VALUE2LIST = [
	"autocommit(lStatus)",
	"close()",
	"colcount() --> Number",
	"columns(cTableName) --> List",
	"commit()",
	"connect(cConString) --> lStatus",
	"datasources() --> List",
	"disconnect()",
	"drivers() --> List",
	"execute(cSQL) ",
	"fetch()",
	"getdata(nColumn) --> cValue",
	"init()",
	"rollback()",
	"tables()"
]
*/

T_CT_ODBCCLASS_IP_VALUE2LIST = [
    "تفعيل_التنفيذ_التلقائي(حالة)",
    "اغلاق()",
    "عدد_الاعمدة() --> رقم",
    "اعمدة(اسم_الجدول) --> قائمة",
    "تنفيذ()",
    "اتصال(سلسلة_الاتصال) --> حالة",
    "مصادر_البيانات() --> قائمة",
    "قطع_الاتصال()",
    "برامج_التشغيل() --> قائمة",
    "تنفيذ(كود_SQL)",
    "جلب()",
    "احصل_على_بيانات(عمود) --> قيمة",
    "تهيئة()",
    "تراجع()",
    "جداول()"
]


T_CT_ODBCCLASS_IP_VALUE3 = "المعطيات :"
T_CT_ODBCCLASS_IP_VALUE4 = "الناتج :"