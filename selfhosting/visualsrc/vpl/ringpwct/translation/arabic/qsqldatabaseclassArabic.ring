#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  qsqldatabaseclass Component
#**	Date : 2021.08.09
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
T_CT_QSQLDATABASECLASS_IP_TITLE = "مكون فئة ال QSqlDatabase "
T_CT_QSQLDATABASECLASS_IP_VALUE = "اسم الكائن :"
T_CT_QSQLDATABASECLASS_IP_VALUE2 = "الميثود : "
#/*
#T_CT_QSQLDATABASECLASS_IP_VALUE2LIST = [
#	"addDatabase(QString) --> QSqlDatabase",
#	"cloneDatabase(QSqlDatabase, QString) --> QSqlDatabase",
#	"close(void) --> void",
#	"commit(void) --> bool",
#	"connectionName(void) --> QString",
#	"connectionNames(void) --> QStringList",
#	"connectOptions(void) --> QString",
#	"contains(QString) --> bool",
#	"database(QString , bool) --> QSqlDatabase",
#	"databaseName(void) --> QString",
#	"delete(void) --> void",
#	"driver(void) --> QSqlDriver",
#	"driverName(void) --> QString",
#	"drivers(void) --> QStringList",
#	"exec(QString) --> QSqlQuery",
#	"hostName(void) --> QString",
#	"init(parent) --> object",
#	"isDriverAvailable(QString) --> bool",
#	"isOpen(void) --> bool",
#	"isOpenError(void) --> bool",
#	"isValid(void) --> bool",
#	"lastError(void) --> QSqlError",
#	"numericalPrecisionPolicy(void) --> QSql::NumericalPrecisionPolicy",
#	"objectpointer(void) --> pointer",
#	"open(void) --> bool",
#	"password(void) --> QString",
#	"port(void) --> int",
#	"primaryIndex(QString) --> QSqlIndex",
#	"record(QString) --> QSqlRecord",
#	"registerSqlDriver(QString, QSqlDriverCreatorBase *) --> void",
#	"removeDatabase(QString) --> void",
#	"rollback(void) --> bool",
#	"setConnectOptions(QString) --> void",
#	"setDatabaseName(QString) --> void",
#	"setHostName(QString) --> void",
#	"setNumericalPrecisionPolicy(QSql::NumericalPrecisionPolicy precisionPolicy) --> void",
#	"setPassword(QString) --> void",
#	"setPort(int port) --> void",
#	"setUserName(QString) --> void",
#	"tables(QSql::TableType type) --> QStringList",
#	"transaction(void) --> bool",
#	"userName(void) --> QString"
#]
#*/
T_CT_QSQLDATABASECLASS_IP_VALUE2LIST = ["إضافة قاعدة بيانات(نص) --> قاعدة بيانات","استنساخ قاعدة بيانات(قاعدة بيانات، نص) --> قاعدة بيانات","إغلاق(لاشىء) --> لاشىء","التزام(لاشىء) --> منطقية","اسم الاتصال(لاشىء) --> نص","أسماء الاتصال(لاشىء) --> قائمة نصوص","خيارات الاتصال(لاشىء) --> نص","يحتوي(نص) --> منطقية","قاعدة بيانات(نص، منطقية) --> قاعدة بيانات","اسم قاعدة البيانات(لاشىء) --> نص","حذف(لاشىء) --> لاشىء","برنامج التشغيل(لاشىء) --> برنامج تشغيل","اسم برنامج التشغيل(لاشىء) --> نص","برامج التشغيل(لاشىء) --> قائمة نصوص","تنفيذ(نص) --> استعلام قاعدة بيانات","اسم المضيف(لاشىء) --> نص","تهيئة(الأصل) --> كائن","هل برنامج التشغيل متاح(نص) --> منطقية","مفتوح(لاشىء) --> منطقية","خطأ في الفتح(لاشىء) --> منطقية","صالح(لاشىء) --> منطقية","آخر خطأ(لاشىء) --> خطأ قاعدة بيانات","سياسة الدقة التعددية(لاشىء) --> سياسة الدقة التعددية","مؤشر الكائن(لاشىء) --> مؤشر","فتح(لاشىء) --> منطقية","كلمة مرور(لاشىء) --> نص","منفذ(لاشىء) --> عدد صحيح","الفهرس الأساسي(نص) --> فهرس قاعدة بيانات","سجل(نص) --> سجل قاعدة بيانات","تسجيل برنامج التشغيل(نص، منشئ برنامج التشغيل) --> لاشىء","إزالة قاعدة بيانات(نص) --> لاشىء","تراجع(لاشىء) --> منطقية","تعيين خيارات الاتصال(نص) --> لاشىء","تعيين اسم قاعدة البيانات(نص) --> لاشىء","تعيين اسم المضيف(نص) --> لاشىء","تعيين سياسة الدقة التعددية(سياسة الدقة التعددية) --> لاشىء","تعيين كلمة المرور(نص) --> لاشىء","تعيين المنفذ(عدد صحيح) --> لاشىء","تعيين اسم المستخدم(نص) --> لاشىء","جداول(نوع الجدول) --> قائمة نصوص","معاملة(لاشىء) --> منطقية","اسم المستخدم(لاشىء) --> نص"]
T_CT_QSQLDATABASECLASS_IP_VALUE3 = "المعطيات :"
T_CT_QSQLDATABASECLASS_IP_VALUE4 = "الناتج :"
T_CT_QSQLDATABASECLASS_IP_VALUE2FUNC = ["adddatabase","clonedatabase","close","commit","connectionname","connectionnames","connectoptions","contains","database","databasename","delete","driver","drivername","drivers","exec","hostname","init","isdriveravailable","isopen","isopenerror","isvalid","lasterror","numericalprecisionpolicy","objectpointer","open","password","port","primaryindex","record","registersqldriver","removedatabase","rollback","setconnectoptions","setdatabasename","sethostname","setnumericalprecisionpolicy","setpassword","setport","setusername","tables","transaction","username"]
T_CT_QSQLDATABASECLASS_IP_VALUE2STEPFUNC = ["إضافة قاعدة بيانات","استنساخ قاعدة بيانات","إغلاق","التزام","اسم الاتصال","أسماء الاتصال","خيارات الاتصال","يحتوي","قاعدة بيانات","اسم قاعدة البيانات","حذف","برنامج التشغيل","اسم برنامج التشغيل","برامج التشغيل","تنفيذ","اسم المضيف","تهيئة","هل برنامج التشغيل متاح","مفتوح","خطأ في الفتح","صالح","آخر خطأ","سياسة الدقة التعددية","مؤشر الكائن","فتح","كلمة مرور","منفذ","الفهرس الأساسي","سجل","تسجيل برنامج التشغيل","إزالة قاعدة بيانات","تراجع","تعيين خيارات الاتصال","تعيين اسم قاعدة البيانات","تعيين اسم المضيف","تعيين سياسة الدقة التعددية","تعيين كلمة المرور","تعيين المنفذ","تعيين اسم المستخدم","جداول","معاملة","اسم المستخدم"]
