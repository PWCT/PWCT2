#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  qtcpsocketclass Component
#**	Date : 2021.08.09
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
T_CT_QTCPSOCKETCLASS_IP_TITLE = "مكون فئة ال QTcpSocket "
T_CT_QTCPSOCKETCLASS_IP_VALUE = "اسم الكائن :"
T_CT_QTCPSOCKETCLASS_IP_VALUE2 = "الميثود : "
#/*
#T_CT_QTCPSOCKETCLASS_IP_VALUE2LIST = [
#	"abort(void) --> void",
#	"atEnd(void) --> bool",
#	"bind(QHostAddress address, int port, QAbstractSocket::BindFlag mode) --> bool",
#	"blockSignals(bool block) --> bool",
#	"bytesAvailable(void) --> int",
#	"bytesToWrite(void) --> int",
#	"canReadLine(void) --> bool",
#	"children(void) --> QObjectList",
#	"close(void) --> void",
#	"connectToHost(QString hostName, int port, QIODevice::OpenModeFlag openMode, QAbstractSocket::NetworkLayerProtocol protocol) --> void",
#	"delete(void) --> void",
#	"deleteLater(void) --> void",
#	"disconnectFromHost(void) --> void",
#	"dumpObjectInfo(void) --> void",
#	"dumpObjectTree(void) --> void",
#	"error(void) --> int",
#	"errorString(void) --> QString",
#	"flush(void) --> bool",
#	"getaboutToCloseEvent(void) --> char",
#	"getbytesWrittenEvent(void) --> char",
#	"getChar(char *c) --> bool",
#	"getconnectedEvent(void) --> char",
#	"getdisconnectedEvent(void) --> char",
#	"geterrorEvent(void) --> char",
#	"gethostFoundEvent(void) --> char",
#	"getproxyAuthenticationRequiredEvent(void) --> char",
#	"getreadChannelFinishedEvent(void) --> char",
#	"getreadyReadEvent(void) --> char",
#	"getstateChangedEvent(void) --> char",
#	"inherits(char *className) --> bool",
#	"init(parent) --> object",
#	"installEventFilter(QObject *filterObj) --> void",
#	"isOpen(void) --> bool",
#	"isReadable(void) --> bool",
#	"isSequential(void) --> bool",
#	"isTextModeEnabled(void) --> bool",
#	"isValid(void) --> bool",
#	"isWidgetType(void) --> bool",
#	"isWritable(void) --> bool",
#	"killTimer(int id) --> void",
#	"localAddress(void) --> QHostAddress",
#	"localPort(void) --> int",
#	"moveToThread(QThread *targetThread) --> void",
#	"objectName(void) --> QString",
#	"objectpointer(void) --> pointer",
#	"open(QIODevice::OpenMode flags) --> bool",
#	"openMode(void) --> int",
#	"parent(void) --> QObject",
#	"pauseMode(void) --> int",
#	"peek(char *data, int maxSize) --> int",
#	"peerAddress(void) --> QHostAddress",
#	"peerName(void) --> QString",
#	"peerPort(void) --> int",
#	"pos(void) --> qint64",
#	"property(char *name) --> QVariant",
#	"proxy(void) --> QNetworkProxy",
#	"putChar(char c) --> bool",
#	"read(char *data, int maxSize) --> int",
#	"readAll(void) --> QByteArray",
#	"readBufferSize(void) --> int",
#	"readLine(char *data, int maxSize) --> int",
#	"removeEventFilter(QObject *obj) --> void",
#	"resume(void) --> void",
#	"seek(qint64 pos) --> bool",
#	"setaboutToCloseEvent(char *) --> void",
#	"setbytesWrittenEvent(char *) --> void",
#	"setconnectedEvent(char *) --> void",
#	"setdisconnectedEvent(char *) --> void",
#	"seterrorEvent(char *) --> void",
#	"sethostFoundEvent(char *) --> void",
#	"setObjectName(QString) --> void",
#	"setParent(QObject *parent) --> void",
#	"setPauseMode(QAbstractSocket::PauseMode pauseMode) --> void",
#	"setProperty(char *name, QVariant) --> bool",
#	"setProperty_2(char *name, int) --> bool",
#	"setProperty_3(char *name, float) --> bool",
#	"setProperty_4(char *name, double) --> bool",
#	"setProperty_5(char *name, QString) --> bool",
#	"setProperty_double(char *name, double) --> bool",
#	"setProperty_float(char *name, float) --> bool",
#	"setProperty_int(char *name, int) --> bool",
#	"setProperty_string(char *name, QString) --> bool",
#	"setProxy(QNetworkProxy networkProxy) --> void",
#	"setproxyAuthenticationRequiredEvent(char *) --> void",
#	"setReadBufferSize(int size) --> void",
#	"setreadChannelFinishedEvent(char *) --> void",
#	"setreadyReadEvent(char *) --> void",
#	"setSocketDescriptor(qintptr socketDescriptor, QAbstractSocket::SocketState socketState, QIODevice::OpenModeFlag openMode) --> bool",
#	"setSocketOption(QAbstractSocket::SocketOption option, QVariant value) --> void",
#	"setstateChangedEvent(char *) --> void",
#	"setTextModeEnabled(bool enabled) --> void",
#	"signalsBlocked(void) --> bool",
#	"size(void) --> qint64",
#	"socketDescriptor(void) --> int",
#	"socketOption(QAbstractSocket::SocketOption option) --> QVariant",
#	"socketType(void) --> int",
#	"startTimer(int interval) --> int",
#	"state(void) --> int",
#	"thread(void) --> QThread",
#	"ungetChar(char c) --> void",
#	"waitForBytesWritten(int msecs) --> bool",
#	"waitForConnected(int msecs) --> bool",
#	"waitForDisconnected(int msecs) --> bool",
#	"waitForReadyRead(int msecs) --> bool",
#	"write(char *data, int maxSize) --> int"
#]
#*/
T_CT_QTCPSOCKETCLASS_IP_VALUE2LIST = ["إلغاء (لا شىء) --> لا شىء","في النهاية (لا شىء) --> منطقية","ربط (عنوان المضيف، عدد صحيح منفذ، علم الربط) --> منطقية","حجب الإشارات (منطقية حجب) --> منطقية","بايتات متاحة (لا شىء) --> عدد صحيح","بايتات للكتابة (لا شىء) --> عدد صحيح","يمكن قراءة السطر (لا شىء) --> منطقية","أطفال (لا شىء) --> قائمة الكائنات","إغلاق (لا شىء) --> لا شىء","الاتصال بالمضيف (اسم المضيف، عدد صحيح منفذ، علم فتح الوضع، بروتوكول الطبقة الشبكية) --> لا شىء","حذف (لا شىء) --> لا شىء","احذف لاحقاً (لا شىء) --> لا شىء","قطع الاتصال بالمضيف (لا شىء) --> لا شىء","تفريغ معلومات الكائن (لا شىء) --> لا شىء","تفريغ شجرة الكائن (لا شىء) --> لا شىء","خطأ (لا شىء) --> عدد صحيح","نص الخطأ (لا شىء) --> نص","تفريغ (لا شىء) --> منطقية","الحصول على حدث الإغلاق المتوقع (لا شىء) --> حرف","الحصول على حدث البايتات المكتوبة (لا شىء) --> حرف","الحصول على محرف (حرف *محرف) --> منطقية","الحصول على حدث الاتصال (لا شىء) --> حرف","الحصول على حدث الفصل (لا شىء) --> حرف","الحصول على حدث الخطأ (لا شىء) --> حرف","الحصول على حدث العثور على المضيف (لا شىء) --> حرف","الحصول على حدث طلب مصادقة الوكيل (لا شىء) --> حرف","الحصول على حدث انتهاء قناة القراءة (لا شىء) --> حرف","الحصول على حدث القراءة جاهزة (لا شىء) --> حرف","الحصول على حدث تغيير الحالة (لا شىء) --> حرف","يرث (حرف *اسم الفئة) --> منطقية","تهيئة (الأصل) --> كائن","تثبيت المرشح الحدث (كائن *مرشح الحدث) --> لا شىء","مفتوح (لا شىء) --> منطقية","قابل للقراءة (لا شىء) --> منطقية","تتابعي (لا شىء) --> منطقية","تمكين وضع النص (لا شىء) --> منطقية","صالح (لا شىء) --> منطقية","نوع الأداة (لا شىء) --> منطقية","قابل للكتابة (لا شىء) --> منطقية","إيقاف العداد (عدد صحيح معرف) --> لا شىء","العنوان المحلي (لا شىء) --> عنوان المضيف","المنفذ المحلي (لا شىء) --> عدد صحيح","نقل الى الخيط (خيط *خيط المستهدف) --> لا شىء","اسم الكائن (لا شىء) --> نص","مؤشر الكائن (لا شىء) --> مؤشر","فتح (وضع الفتح) --> منطقية","وضع الفتح (لا شىء) --> عدد صحيح","الأصل (لا شىء) --> كائن","وضع التوقف (لا شىء) --> عدد صحيح","إطلالة (حرف *بيانات، عدد صحيح أقصى حجم) --> عدد صحيح","عنوان النظير (لا شىء) --> عنوان المضيف","اسم النظير (لا شىء) --> نص","منفذ النظير (لا شىء) --> عدد صحيح","الموضع (لا شىء) --> عدد مضاعف 64","خاصية (حرف *اسم) --> نوع متغير","الوكيل (لا شىء) --> وكيل شبكة","إدخال محرف (حرف محرف) --> منطقية","قراءة (حرف *بيانات، عدد صحيح أقصى حجم) --> عدد صحيح","قراءة الكل (لا شىء) --> مصفوفة بايتات","حجم ذاكرة القراءة (لا شىء) --> عدد صحيح","قراءة السطر (حرف *بيانات، عدد صحيح أقصى حجم) --> عدد صحيح","إزالة المرشح الحدث (كائن *كائن) --> لا شىء","استئناف (لا شىء) --> لا شىء","بحث (عدد مضاعف 64 الموضع) --> منطقية","تعيين حدث الإغلاق المتوقع (حرف *) --> لا شىء","تعيين حدث البايتات المكتوبة (حرف *) --> لا شىء","تعيين حدث الاتصال (حرف *) --> لا شىء","تعيين حدث الفصل (حرف *) --> لا شىء","تعيين حدث الخطأ (حرف *) --> لا شىء","تعيين حدث العثور على المضيف (حرف *) --> لا شىء","تعيين اسم الكائن (نص) --> لا شىء","تعيين الأصل (كائن *الأصل) --> لا شىء","تعيين وضع توقف (وضع التوقف) --> لا شىء","تعيين خاصية (حرف *اسم، نوع متغير) --> منطقية","تعيين خاصية 2 (حرف *اسم، عدد صحيح) --> منطقية","تعيين خاصية 3 (حرف *اسم، عائم) --> منطقية","تعيين خاصية 4 (حرف *اسم، مزدوج) --> منطقية","تعيين خاصية 5 (حرف *اسم، نص) --> منطقية","تعيين خاصية مزدوج (حرف *اسم، مزدوج) --> منطقية","تعيين خاصية عائم (حرف *اسم، عائم) --> منطقية","تعيين خاصية عدد صحيح (حرف *اسم، عدد صحيح) --> منطقية","تعيين خاصية نص (حرف *اسم، نص) --> منطقية","تعيين وكيل (وكيل شبكة) --> لا شىء","تعيين حدث طلب مصادقة الوكيل (حرف *) --> لا شىء","تعيين حجم ذاكرة القراءة (عدد صحيح الحجم) --> لا شىء","تعيين حدث انتهاء قناة القراءة (حرف *) --> لا شىء","تعيين حدث القراءة جاهزة (حرف *) --> لا شىء","تعيين معرف المقبس (عدد مضاعف socketDescriptor، حالة المقبس، علم فتح الوضع) --> منطقية","تعيين خيار المقبس (خيار المقبس، نوع متغير القيمة) --> لا شىء","تعيين حدث تغيير الحالة (حرف *) --> لا شىء","تمكين وضع النص (منطقية ممكن) --> لا شىء","حجب الإشارات (لا شىء) --> منطقية","الحجم (لا شىء) --> عدد مضاعف 64","معرف المقبس (لا شىء) --> عدد صحيح","خيار المقبس (خيار المقبس) --> نوع متغير","نوع المقبس (لا شىء) --> عدد صحيح","تشغيل المؤقت (عدد صحيح الفاصل) --> عدد صحيح","الحالة (لا شىء) --> عدد صحيح","خيط (لا شىء) --> خيط","إعادة محرف (حرف محرف) --> لا شىء","انتظار الكتابة (عدد صحيح ميليثانية) --> منطقية","انتظار الاتصال (عدد صحيح ميليثانية) --> منطقية","انتظار الفصل (عدد صحيح ميليثانية) --> منطقية","انتظار القراءة (عدد صحيح ميليثانية) --> منطقية","كتابة (حرف *بيانات، عدد صحيح أقصى حجم) --> عدد صحيح"]
T_CT_QTCPSOCKETCLASS_IP_VALUE3 = "المعطيات :"
T_CT_QTCPSOCKETCLASS_IP_VALUE4 = "الناتج :"
T_CT_QTCPSOCKETCLASS_IP_VALUE2FUNC = ["abort","atend","bind","blocksignals","bytesavailable","bytestowrite","canreadline","children","close","connecttohost","delete","deletelater","disconnectfromhost","dumpobjectinfo","dumpobjecttree","error","errorstring","flush","getabouttocloseevent","getbyteswrittenevent","getchar","getconnectedevent","getdisconnectedevent","geterrorevent","gethostfoundevent","getproxyauthenticationrequiredevent","getreadchannelfinishedevent","getreadyreadevent","getstatechangedevent","inherits","init","installeventfilter","isopen","isreadable","issequential","istextmodeenabled","isvalid","iswidgettype","iswritable","killtimer","localaddress","localport","movetothread","objectname","objectpointer","open","openmode","parent","pausemode","peek","peeraddress","peername","peerport","pos","property","proxy","putchar","read","readall","readbuffersize","readline","removeeventfilter","resume","seek","setabouttocloseevent","setbyteswrittenevent","setconnectedevent","setdisconnectedevent","seterrorevent","sethostfoundevent","setobjectname","setparent","setpausemode","setproperty","setproperty_2","setproperty_3","setproperty_4","setproperty_5","setproperty_double","setproperty_float","setproperty_int","setproperty_string","setproxy","setproxyauthenticationrequiredevent","setreadbuffersize","setreadchannelfinishedevent","setreadyreadevent","setsocketdescriptor","setsocketoption","setstatechangedevent","settextmodeenabled","signalsblocked","size","socketdescriptor","socketoption","sockettype","starttimer","state","thread","ungetchar","waitforbyteswritten","waitforconnected","waitfordisconnected","waitforreadyread","write"]
T_CT_QTCPSOCKETCLASS_IP_VALUE2STEPFUNC = ["إلغاء","في النهاية","ربط","حجب الإشارات","بايتات متاحة","بايتات للكتابة","يمكن قراءة السطر","أطفال","إغلاق","الاتصال بالمضيف","حذف","احذف لاحقاً","قطع الاتصال بالمضيف","تفريغ معلومات الكائن","تفريغ شجرة الكائن","خطأ","نص الخطأ","تفريغ","الحصول على حدث الإغلاق المتوقع","الحصول على حدث البايتات المكتوبة","الحصول على محرف","الحصول على حدث الاتصال","الحصول على حدث الفصل","الحصول على حدث الخطأ","الحصول على حدث العثور على المضيف","الحصول على حدث طلب مصادقة الوكيل","الحصول على حدث انتهاء قناة القراءة","الحصول على حدث القراءة جاهزة","الحصول على حدث تغيير الحالة","يرث","تهيئة","تثبيت المرشح الحدث","مفتوح","قابل للقراءة","تتابعي","تمكين وضع النص","صالح","نوع الأداة","قابل للكتابة","إيقاف العداد","العنوان المحلي","المنفذ المحلي","نقل الى الخيط","اسم الكائن","مؤشر الكائن","فتح","وضع الفتح","الأصل","وضع التوقف","إطلالة","عنوان النظير","اسم النظير","منفذ النظير","الموضع","خاصية","الوكيل","إدخال محرف","قراءة","قراءة الكل","حجم ذاكرة القراءة","قراءة السطر","إزالة المرشح الحدث","استئناف","بحث","تعيين حدث الإغلاق المتوقع","تعيين حدث البايتات المكتوبة","تعيين حدث الاتصال","تعيين حدث الفصل","تعيين حدث الخطأ","تعيين حدث العثور على المضيف","تعيين اسم الكائن","تعيين الأصل","تعيين وضع توقف","تعيين خاصية","تعيين خاصية  2","تعيين خاصية  3","تعيين خاصية  4","تعيين خاصية  5","تعيين خاصية  مزدوج","تعيين خاصية  عائم","تعيين خاصية  عدد صحيح","تعيين خاصية  نص","تعيين وكيل","تعيين حدث طلب مصادقة الوكيل","تعيين حجم ذاكرة القراءة","تعيين حدث انتهاء قناة القراءة","تعيين حدث القراءة جاهزة","تعيين معرف المقبس","تعيين خيار المقبس","تعيين حدث تغيير الحالة","تمكين وضع النص","حجب الإشارات","الحجم","معرف المقبس","خيار المقبس","نوع المقبس","تشغيل المؤقت","الحالة","خيط","إعادة محرف","انتظار الكتابة","انتظار الاتصال","انتظار الفصل","انتظار القراءة","كتابة"]
