/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  mysqlclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

T_CT_MYSQLCLASS_IP_TITLE = "مكون فئة الاتصال بال MySQL "
T_CT_MYSQLCLASS_IP_VALUE = "اسم الكائن :"
T_CT_MYSQLCLASS_IP_VALUE2 = "الميثود : "

T_CT_MYSQLCLASS_IP_VALUE2FUNC = [
	"autocommit",
	"close",
	"columns",
	"commit",
	"connect",
	"error",
	"escape_string",
	"info",
	"init",
	"insert_id",
	"next_result",
	"query",
	"result",
	"result2",
	"rollback"
]
# Copy the list to support changing the generated method name in the Steps Tree
T_CT_MYSQLCLASS_IP_VALUE2STEPFUNC = [
    "تفعيل_التنفيذ_التلقائي",
    "اغلاق",
    "اعمدة",
    "تنفيذ",
    "اتصال",
    "خطأ",
    "تبديل_سلسلة",
    "معلومات",
    "تهيئة",
    "معرف_ادراج",
    "النتيجة_التالية",
    "استعلام",
    "نتيجة",
    "نتيجة2",
    "تراجع"
]

/*
T_CT_MYSQLCLASS_IP_VALUE2LIST = [
	"autocommit(lStatus)",
	"close()",
	"columns() --> List",
	"commit()",
	"connect(cServer,cUser,cPass,cDatabase) --> lStatus",
	"error() --> cErrorMessage",
	"escape_string(cString) --> String",
	"info() --> String",
	"init()",
	"insert_id() --> nID",
	"next_result()",
	"query(cQuery)",
	"result() --> List",
	"result2() --> List",
	"rollback()"
]
*/

T_CT_MYSQLCLASS_IP_VALUE2LIST = [
    "تفعيل_التنفيذ_التلقائي(حالة)",
    "اغلاق()",
    "اعمدة() --> قائمة",
    "تنفيذ()",
    "اتصال(خادم,مستخدم,كلمة_المرور,قاعدة_بيانات) --> حالة",
    "خطأ() --> رسالة_خطأ",
    "تبديل_سلسلة(سلسلة) --> سلسلة",
    "معلومات() --> سلسلة",
    "تهيئة()",
    "معرف_ادراج() --> معرف",
    "النتيجة_التالية()",
    "استعلام(استعلام)",
    "نتيجة() --> قائمة",
    "نتيجة2() --> قائمة",
    "تراجع()"
]

T_CT_MYSQLCLASS_IP_VALUE3 = "المعطيات :"
T_CT_MYSQLCLASS_IP_VALUE4 = "الناتج :"