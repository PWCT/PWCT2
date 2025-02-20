#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  qsqlqueryclass Component
#**	Date : 2021.08.09
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
T_CT_QSQLQUERYCLASS_IP_TITLE = "مكون فئة ال QSqlQuery "
T_CT_QSQLQUERYCLASS_IP_VALUE = "اسم الكائن :"
T_CT_QSQLQUERYCLASS_IP_VALUE2 = "الميثود : "
#/*
#T_CT_QSQLQUERYCLASS_IP_VALUE2LIST = [
#	"addBindValue(QVariant, QSql::ParamType paramType) --> void",
#	"at(void) --> int",
#	"bindValue(QString, QVariant, QSql::ParamType paramType) --> void",
#	"boundValue(QString) --> QVariant",
#	"clear(void) --> void",
#	"delete(void) --> void",
#	"driver(void) --> QSqlDriver",
#	"exec(QString) --> bool",
#	"exec_2(void) --> bool",
#	"execBatch(QSqlQuery::BatchExecutionMode mode) --> bool",
#	"executedQuery(void) --> QString",
#	"finish(void) --> void",
#	"first(void) --> bool",
#	"init(parent) --> object",
#	"isActive(void) --> bool",
#	"isForwardOnly(void) --> bool",
#	"isNull(int field) --> bool",
#	"isSelect(void) --> bool",
#	"isValid(void) --> bool",
#	"last(void) --> bool",
#	"lastError(void) --> QSqlError",
#	"lastInsertId(void) --> QVariant",
#	"lastQuery(void) --> QString",
#	"movenext(void) --> bool",
#	"nextResult(void) --> bool",
#	"numericalPrecisionPolicy(void) --> QSql::NumericalPrecisionPolicy",
#	"numRowsAffected(void) --> int",
#	"objectpointer(void) --> pointer",
#	"prepare(QString) --> bool",
#	"previous(void) --> bool",
#	"record(void) --> QSqlRecord",
#	"result(void) --> QSqlResult",
#	"seek(int index, bool relative) --> bool",
#	"setForwardOnly(bool forward) --> void",
#	"setNumericalPrecisionPolicy(QSql::NumericalPrecisionPolicy precisionPolicy) --> void",
#	"size(void) --> int",
#	"value(int index) --> QVariant"
#]
#*/
T_CT_QSQLQUERYCLASS_IP_VALUE2LIST = ["إضافة قيمة الربط(نوع متغير، نوع المعلمة) --> لاشىء","في(لاشىء) --> عدد صحيح","قيمة الربط(نص، نوع متغير، نوع المعلمة) --> لاشىء","القيمة المرتبطة(نص) --> نوع متغير","مسح(لاشىء) --> لاشىء","حذف(لاشىء) --> لاشىء","برنامج التشغيل(لاشىء) --> برنامج تشغيل قاعدة بيانات","تنفيذ(نص) --> منطقية","تنفيذ_2(لاشىء) --> منطقية","تنفيذ الدفعة(وضع تنفيذ الدفعة) --> منطقية","تنفيذ الاستعلام(لاشىء) --> نص","إنهاء(لاشىء) --> لاشىء","أول(لاشىء) --> منطقية","تهيئة(الأصل) --> كائن","نشط(لاشىء) --> منطقية","للأمام فقط(لاشىء) --> منطقية","قيمة عدمية(عدد صحيح الحقل) --> منطقية","تحديد(لاشىء) --> منطقية","صالح(لاشىء) --> منطقية","آخر(لاشىء) --> منطقية","آخر خطأ(لاشىء) --> خطأ قاعدة بيانات","آخر معرف تم إدخاله(لاشىء) --> نوع متغير","آخر استعلام(لاشىء) --> نص","تحريك التالي(لاشىء) --> منطقية","النتيجة التالية(لاشىء) --> منطقية","سياسة الدقة التعددية(لاشىء) --> سياسة الدقة التعددية","عدد الصفوف المتأثرة(لاشىء) --> عدد صحيح","مؤشر الكائن(لاشىء) --> مؤشر","تحضير(نص) --> منطقية","سابق(لاشىء) --> منطقية","سجل(لاشىء) --> سجل قاعدة بيانات","نتيجة(لاشىء) --> نتيجة قاعدة بيانات","بحث(عدد صحيح الفهرس، منطقية نسبي) --> منطقية","تعيين للأمام فقط(منطقية للأمام) --> لاشىء","تعيين سياسة الدقة التعددية(سياسة الدقة التعددية) --> لاشىء","حجم(لاشىء) --> عدد صحيح","قيمة(عدد صحيح الفهرس) --> نوع متغير"]
T_CT_QSQLQUERYCLASS_IP_VALUE3 = "المعطيات :"
T_CT_QSQLQUERYCLASS_IP_VALUE4 = "الناتج :"
T_CT_QSQLQUERYCLASS_IP_VALUE2FUNC = ["addbindvalue","at","bindvalue","boundvalue","clear","delete","driver","exec","exec_2","execbatch","executedquery","finish","first","init","isactive","isforwardonly","isnull","isselect","isvalid","last","lasterror","lastinsertid","lastquery","movenext","nextresult","numericalprecisionpolicy","numrowsaffected","objectpointer","prepare","previous","record","result","seek","setforwardonly","setnumericalprecisionpolicy","size","value"]
T_CT_QSQLQUERYCLASS_IP_VALUE2STEPFUNC = ["إضافة قيمة الربط","في","قيمة الربط","القيمة المرتبطة","مسح","حذف","برنامج التشغيل","تنفيذ","تنفيذ_2","تنفيذ الدفعة","تنفيذ الاستعلام","إنهاء","أول","تهيئة","نشط","للأمام فقط","null","تحديد","صالح","آخر","آخر خطأ","آخر معرف تم إدخاله","آخر استعلام","تحريك التالي","النتيجة التالية","سياسة الدقة التعددية","عدد الصفوف المتأثرة","مؤشر الكائن","تحضير","سابق","سجل","نتيجة","بحث","تعيين للأمام فقط","تعيين سياسة الدقة التعددية","حجم","قيمة"]
