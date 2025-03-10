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
T_CT_QTCPSOCKETCLASS_IP_VALUE2LIST = ["إلغاء(لاشىء) --> لاشىء","فيالنهاية(لاشىء) --> منطقية","ربط(عنوان المضيف، عدد صحيح منفذ، علم الربط) --> منطقية","حجبالإشارات(منطقية حجب) --> منطقية","بايتاتمتاحة(لاشىء) --> عدد صحيح","بايتاتللكتابة(لاشىء) --> عدد صحيح","يمكنقراءةالسطر(لاشىء) --> منطقية","أطفال(لاشىء) --> قائمةالكائنات","إغلاق(لاشىء) --> لاشىء","الاتصالبالمضيف(اسم المضيف، عدد صحيح منفذ، علم فتح الوضع، بروتوكول الطبقة الشبكية) --> لاشىء","حذف(لاشىء) --> لاشىء","احذفلاحقاً(لاشىء) --> لاشىء","قطعالاتصالبالمضيف(لاشىء) --> لاشىء","تفريغمعلوماتالكائن(لاشىء) --> لاشىء","تفريغشجرةالكائن(لاشىء) --> لاشىء","خطأ(لاشىء) --> عدد صحيح","نصالخطأ(لاشىء) --> نص","تفريغ(لاشىء) --> منطقية","الحصولعلىحدثالإغلاقالمتوقع(لاشىء) --> حرف","الحصولعلىحدثالبايتاتالمكتوبة(لاشىء) --> حرف","الحصولعلىمحرف(حرف *محرف) --> منطقية","الحصولعلىحدثالاتصال(لاشىء) --> حرف","الحصولعلىحدثالفصل(لاشىء) --> حرف","الحصولعلىحدثالخطأ(لاشىء) --> حرف","الحصولعلىحدثالعثورعلىالمضيف(لاشىء) --> حرف","الحصولعلىحدثطلبمصادقةالوكيل(لاشىء) --> حرف","الحصولعلىحدثانتهاءقناةالقراءة(لاشىء) --> حرف","الحصولعلىحدثالقراءةجاهزة(لاشىء) --> حرف","الحصولعلىحدثتغييرالحالة(لاشىء) --> حرف","يرث(حرف *اسمالفئة) --> منطقية","تهيئة(الأصل) --> كائن","تثبيتالمرشحالحدث(كائن *مرشحالحدث) --> لاشىء","مفتوح(لاشىء) --> منطقية","قابلللقراءة(لاشىء) --> منطقية","تتابعي(لاشىء) --> منطقية","تمكينوضعالنص(لاشىء) --> منطقية","صالح(لاشىء) --> منطقية","نوعالأداة(لاشىء) --> منطقية","قابلللكتابة(لاشىء) --> منطقية","إيقافالعداد(عدد صحيح معرف) --> لاشىء","العنوانالمحلي(لاشىء) --> عنوانالمضيف","المنفذالمحلي(لاشىء) --> عدد صحيح","نقلالىالخيط(خيط *خيطالمستهدف) --> لاشىء","اسمالكائن(لاشىء) --> نص","مؤشرالكائن(لاشىء) --> مؤشر","فتح(وضعالفتح) --> منطقية","وضعالفتح(لاشىء) --> عدد صحيح","الأصل(لاشىء) --> كائن","وضعالتوقف(لاشىء) --> عدد صحيح","إطلالة(حرف *بيانات، عدد صحيح أقصىحجم) --> عدد صحيح","عنوانالنظير(لاشىء) --> عنوانالمضيف","اسمالنظير(لاشىء) --> نص","منفذالنظير(لاشىء) --> عدد صحيح","الموضع(لاشىء) --> عددمضاعف64","خاصية(حرف *اسم) --> نوعمتغير","الوكيل(لاشىء) --> وكيلشبكة","إدخالمحرف(حرف محرف) --> منطقية","قراءة(حرف *بيانات، عدد صحيح أقصىحجم) --> عدد صحيح","قراءةالكل(لاشىء) --> مصفوفةبايتات","حجمذاكرةالقراءة(لاشىء) --> عدد صحيح","قراءةالسطر(حرف *بيانات، عدد صحيح أقصىحجم) --> عدد صحيح","إزالةالمرشحالحدث(كائن *كائن) --> لاشىء","استئناف(لاشىء) --> لاشىء","بحث(عددمضاعف64 الموضع) --> منطقية","تعيينحدثالإغلاقالمتوقع(حرف *) --> لاشىء","تعيينحدثالبايتاتالمكتوبة(حرف *) --> لاشىء","تعيينحدثالاتصال(حرف *) --> لاشىء","تعيينحدثالفصل(حرف *) --> لاشىء","تعيينحدثالخطأ(حرف *) --> لاشىء","تعيينحدثالعثورعلىالمضيف(حرف *) --> لاشىء","تعييناسمالكائن(نص) --> لاشىء","تعيينالأصل(كائن *الأصل) --> لاشىء","تعيينوضعتوقف(وضعالتوقف) --> لاشىء","تعيينخاصية(حرف *اسم، نوعمتغير) --> منطقية","تعيينخاصية_2(حرف *اسم، عدد صحيح) --> منطقية","تعيينخاصية_3(حرف *اسم، عائم) --> منطقية","تعيينخاصية_4(حرف *اسم، مزدوج) --> منطقية","تعيينخاصية_5(حرف *اسم، نص) --> منطقية","تعيينخاصية_مزدوج(حرف *اسم، مزدوج) --> منطقية","تعيينخاصية_عائم(حرف *اسم، عائم) --> منطقية","تعيينخاصية_عددصحيح(حرف *اسم، عدد صحيح) --> منطقية","تعيينخاصية_نص(حرف *اسم، نص) --> منطقية","تعيينوكيل(وكيلشبكة) --> لاشىء","تعيينحدثطلبمصادقةالوكيل(حرف *) --> لاشىء","تعيينحجمذاكرةالقراءة(عدد صحيح الحجم) --> لاشىء","تعيينحدثانتهاءقناةالقراءة(حرف *) --> لاشىء","تعيينحدثالقراءةجاهزة(حرف *) --> لاشىء","تعيينمعرفالمقبس(عددمضاعفsocketDescriptor، حالةالمقبس، علمفتحالوضع) --> منطقية","تعيينخيارالمقبس(خيارالمقبس، نوعمتغير القيمة) --> لاشىء","تعيينحدثتغييرالحالة(حرف *) --> لاشىء","تمكينوضعالنص(منطقية ممكن) --> لاشىء","حجبالإشارات(لاشىء) --> منطقية","الحجم(لاشىء) --> عددمضاعف64","معرفالمقبس(لاشىء) --> عدد صحيح","خيارالمقبس(خيارالمقبس) --> نوعمتغير","نوعالمقبس(لاشىء) --> عدد صحيح","تشغيلالمؤقت(عدد صحيح الفاصل) --> عدد صحيح","الحالة(لاشىء) --> عدد صحيح","خيط(لاشىء) --> خيط","إعادةمحرف(حرف محرف) --> لاشىء","انتظارالكتابة(عدد صحيح ميليثانية) --> منطقية","انتظارالاتصال(عدد صحيح ميليثانية) --> منطقية","انتظارالفصل(عدد صحيح ميليثانية) --> منطقية","انتظارالقراءة(عدد صحيح ميليثانية) --> منطقية","كتابة(حرف *بيانات، عدد صحيح أقصىحجم) --> عدد صحيح"]
T_CT_QTCPSOCKETCLASS_IP_VALUE3 = "المعطيات :"
T_CT_QTCPSOCKETCLASS_IP_VALUE4 = "الناتج :"
T_CT_QTCPSOCKETCLASS_IP_VALUE2FUNC = ["abort","atend","bind","blocksignals","bytesavailable","bytestowrite","canreadline","children","close","connecttohost","delete","deletelater","disconnectfromhost","dumpobjectinfo","dumpobjecttree","error","errorstring","flush","getabouttocloseevent","getbyteswrittenevent","getchar","getconnectedevent","getdisconnectedevent","geterrorevent","gethostfoundevent","getproxyauthenticationrequiredevent","getreadchannelfinishedevent","getreadyreadevent","getstatechangedevent","inherits","init","installeventfilter","isopen","isreadable","issequential","istextmodeenabled","isvalid","iswidgettype","iswritable","killtimer","localaddress","localport","movetothread","objectname","objectpointer","open","openmode","parent","pausemode","peek","peeraddress","peername","peerport","pos","property","proxy","putchar","read","readall","readbuffersize","readline","removeeventfilter","resume","seek","setabouttocloseevent","setbyteswrittenevent","setconnectedevent","setdisconnectedevent","seterrorevent","sethostfoundevent","setobjectname","setparent","setpausemode","setproperty","setproperty_2","setproperty_3","setproperty_4","setproperty_5","setproperty_double","setproperty_float","setproperty_int","setproperty_string","setproxy","setproxyauthenticationrequiredevent","setreadbuffersize","setreadchannelfinishedevent","setreadyreadevent","setsocketdescriptor","setsocketoption","setstatechangedevent","settextmodeenabled","signalsblocked","size","socketdescriptor","socketoption","sockettype","starttimer","state","thread","ungetchar","waitforbyteswritten","waitforconnected","waitfordisconnected","waitforreadyread","write"]
T_CT_QTCPSOCKETCLASS_IP_VALUE2STEPFUNC = ["إلغاء","فيالنهاية","ربط","حجبالإشارات","بايتاتمتاحة","بايتاتللكتابة","يمكنقراءةالسطر","أطفال","إغلاق","الاتصالبالمضيف","حذف","احذفلاحقاً","قطعالاتصالبالمضيف","تفريغمعلوماتالكائن","تفريغشجرةالكائن","خطأ","نصالخطأ","تفريغ","الحصولعلىحدثالإغلاقالمتوقع","الحصولعلىحدثالبايتاتالمكتوبة","الحصولعلىمحرف","الحصولعلىحدثالاتصال","الحصولعلىحدثالفصل","الحصولعلىحدثالخطأ","الحصولعلىحدثالعثورعلىالمضيف","الحصولعلىحدثطلبمصادقةالوكيل","الحصولعلىحدثانتهاءقناةالقراءة","الحصولعلىحدثالقراءةجاهزة","الحصولعلىحدثتغييرالحالة","يرث","تهيئة","تثبيتالمرشحالحدث","مفتوح","قابلللقراءة","تتابعي","تمكينوضعالنص","صالح","نوعالأداة","قابلللكتابة","إيقافالعداد","العنوانالمحلي","المنفذالمحلي","نقلالىالخيط","اسمالكائن","مؤشرالكائن","فتح","وضعالفتح","الأصل","وضعالتوقف","إطلالة","عنوانالنظير","اسمالنظير","منفذالنظير","الموضع","خاصية","الوكيل","إدخالمحرف","قراءة","قراءةالكل","حجمذاكرةالقراءة","قراءةالسطر","إزالةالمرشحالحدث","استئناف","بحث","تعيينحدثالإغلاقالمتوقع","تعيينحدثالبايتاتالمكتوبة","تعيينحدثالاتصال","تعيينحدثالفصل","تعيينحدثالخطأ","تعيينحدثالعثورعلىالمضيف","تعييناسمالكائن","تعيينالأصل","تعيينوضعتوقف","تعيينخاصية","تعيينخاصية_2","تعيينخاصية_3","تعيينخاصية_4","تعيينخاصية_5","تعيينخاصية_مزدوج","تعيينخاصية_عائم","تعيينخاصية_عددصحيح","تعيينخاصية_نص","تعيينوكيل","تعيينحدثطلبمصادقةالوكيل","تعيينحجمذاكرةالقراءة","تعيينحدثانتهاءقناةالقراءة","تعيينحدثالقراءةجاهزة","تعيينمعرفالمقبس","تعيينخيارالمقبس","تعيينحدثتغييرالحالة","تمكينوضعلنص","حجبالإشارات","الحجم","معرفالمقبس","خيارالمقبس","نوعالمقبس","تشغيلالمؤقت","الحالة","خيط","إعادةمحرف","انتظارالكتابة","انتظارالاتصال","انتظارالفصل","انتظارالقراءة","كتابة"]
