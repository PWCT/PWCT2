#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  qvboxlayoutclass Component
#**	Date : 2017.12.14
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
T_CT_QVBOXLAYOUTCLASS_IP_TITLE = "مكون فئة الترتيب الراسي "
T_CT_QVBOXLAYOUTCLASS_IP_VALUE = "اسم الكائن :"
T_CT_QVBOXLAYOUTCLASS_IP_VALUE_STARTVALUE = ""
T_CT_QVBOXLAYOUTCLASS_IP_VALUE2 = "الميثود : "
T_CT_QVBOXLAYOUTCLASS_IP_VALUE2FUNC = ["activate","addlayout","addspaceritem","addspacing","addstretch","addstrut","addwidget","blocksignals","children","closestacceptablesize","contentsmargins","contentsrect","delete","deletelater","direction","dumpobjectinfo","dumpobjecttree","getcontentsmargins","inherits","init","insertlayout","insertspaceritem","insertspacing","insertstretch","insertwidget","installeventfilter","isenabled","iswidgettype","killtimer","menubar","movetothread","objectname","objectpointer","parent","parentwidget","property","removeeventfilter","removeitem","removewidget","setalignment","setalignment_2","setalignment_3","setcontentsmargins","setcontentsmargins_2","setdirection","setenabled","setmenubar","setobjectname","setparent","setproperty","setproperty_2","setproperty_3","setproperty_4","setproperty_5","setproperty_double","setproperty_float","setproperty_int","setproperty_string","setsizeconstraint","setspacing","setstretch","setstretchfactor","setstretchfactor_2","signalsblocked","sizeconstraint","spacing","starttimer","stretch","thread","update"]
#Copy the list to support changing the generated method name in the Steps Tree
T_CT_QVBOXLAYOUTCLASS_IP_VALUE2STEPFUNC = ["تنشيط","إضافة تخطيط","إضافة عنصر فراغ","إضافة تباعد","إضافة تمدد","إضافة دعامة","إضافة عنصر واجهة","حجب الإشارات","أطفال","أقرب حجم مقبول","هوامش المحتوى","مستطيل المحتوى","حذف","احذف لاحقاً","اتجاه","تفريغ معلومات الكائن","تفريغ شجرة الكائن","الحصول على هوامش المحتوى","يرث","تهيئة","إدراج تخطيط","إدراج عنصر فراغ","إدراج تباعد","إدراج تمدد","إدراج عنصر واجهة","تثبيت مرشح الحدث","مُمكّن","نوع الواجهة","إيقاف المؤقت","شريط القائمة","نقل إلى الخيط","اسم الكائن","مؤشر الكائن","الأصل","واجهة الأصل","خاصية","إزالة مرشح الحدث","إزالة عنصر","إزالة عنصر واجهة","تعيين المحاذاة","تعيين المحاذاة_2","تعيين المحاذاة_3","تعيين هوامش المحتوى","تعيين هوامش المحتوى_2","تعيين الاتجاه","تعيين التمكين","تعيين شريط القائمة","تعيين اسم الكائن","تعيين الأصل","تعيين خاصية","تعيين خاصية_2","تعيين خاصية_3","تعيين خاصية_4","تعيين خاصية_5","تعيين خاصية_مزدوج","تعيين خاصية_عائم","تعيين خاصية_عدد صحيح","تعيين خاصية_نص","تعيين قيد الحجم","تعيين التباعد","تعيين التمدد","تعيين عامل التمدد","تعيين عامل التمدد_2","حجب الإشارات","قيد الحجم","التباعد","تشغيل المؤقت","تمدد","الخيط","تحديث"]
#/*
#T_CT_QVBOXLAYOUTCLASS_IP_VALUE2LIST = [
#	"activate(void) --> bool",
#	"addLayout(QLayout *) --> void",
#	"addSpacerItem(QSpacerItem *spacerItem) --> void",
#	"addSpacing(int size) --> void",
#	"addStretch(int stretch ) --> void",
#	"addStrut(int size) --> void",
#	"addWidget(QWidget *) --> void",
#	"blockSignals(bool block) --> bool",
#	"children(void) --> QObjectList",
#	"closestAcceptableSize( QWidget *widget, QSize size) --> QSize",
#	"contentsMargins(void) --> QMargins",
#	"contentsRect(void) --> QRect",
#	"delete(void) --> void",
#	"deleteLater(void) --> void",
#	"direction(void) --> QBoxLayout::Direction",
#	"dumpObjectInfo(void) --> void",
#	"dumpObjectTree(void) --> void",
#	"getContentsMargins(int *left, int *top, int *right, int *bottom) --> void",
#	"inherits(char *className) --> bool",
#	"init(parent) --> object",
#	"insertLayout(int index, QLayout *layout, int stretch ) --> void",
#	"insertSpacerItem(int index, QSpacerItem *spacerItem) --> void",
#	"insertSpacing(int index, int size) --> void",
#	"insertStretch(int index, int stretch ) --> void",
#	"insertWidget(int index, QWidget *widget, int stretch , Qt::Alignment alignment ) --> void",
#	"installEventFilter(QObject *filterObj) --> void",
#	"isEnabled(void) --> bool",
#	"isWidgetType(void) --> bool",
#	"killTimer(int id) --> void",
#	"menuBar(void) --> QWidget",
#	"moveToThread(QThread *targetThread) --> void",
#	"objectName(void) --> QString",
#	"objectpointer(void) --> pointer",
#	"parent(void) --> QObject",
#	"parentWidget(void) --> QWidget",
#	"property(char *name) --> QVariant",
#	"removeEventFilter(QObject *obj) --> void",
#	"removeItem(QLayoutItem *item) --> void",
#	"removeWidget(QWidget *widget) --> void",
#	"setAlignment(QWidget *w, Qt::Alignment alignment) --> bool",
#	"setAlignment_2(Qt::Alignment alignment) --> void",
#	"setAlignment_3(QLayout *l, Qt::Alignment alignment) --> bool",
#	"setContentsMargins(int left, int top, int right, int bottom) --> void",
#	"setContentsMargins_2(QMargins margins) --> void",
#	"setDirection(QBoxLayout::Direction direction) --> void",
#	"setEnabled(bool enable) --> void",
#	"setMenuBar(QWidget *widget) --> void",
#	"setObjectName(QString) --> void",
#	"setParent(QObject *parent) --> void",
#	"setProperty(char *name, QVariant) --> bool",
#	"setProperty_2(char *name, int) --> bool",
#	"setProperty_3(char *name, float) --> bool",
#	"setProperty_4(char *name, double) --> bool",
#	"setProperty_5(char *name, QString) --> bool",
#	"setProperty_double(char *name, double) --> bool",
#	"setProperty_float(char *name, float) --> bool",
#	"setProperty_int(char *name, int) --> bool",
#	"setProperty_string(char *name, QString) --> bool",
#	"setSizeConstraint(QLayout::SizeConstraint) --> void",
#	"setSpacing(int spacing) --> void",
#	"setStretch(int index, int stretch) --> void",
#	"setStretchFactor(QWidget *widget, int stretch) --> bool",
#	"setStretchFactor_2(QLayout *layout, int stretch) --> bool",
#	"signalsBlocked(void) --> bool",
#	"sizeConstraint(void) --> QLayout::SizeConstraint",
#	"spacing(void) --> int",
#	"startTimer(int interval) --> int",
#	"stretch(int index) --> int",
#	"thread(void) --> QThread",
#	"update(void) --> void"
#]
#*/
T_CT_QVBOXLAYOUTCLASS_IP_VALUE2LIST = ["تنشيط(لاشىء) --> منطقية","إضافة تخطيط(تخطيط *) --> لاشىء","إضافة عنصر فراغ(عنصر فراغ *) --> لاشىء","إضافة تباعد(عدد صحيح الحجم) --> لاشىء","إضافة تمدد(عدد صحيح التمدد) --> لاشىء","إضافة دعامة(عدد صحيح الحجم) --> لاشىء","إضافة عنصر واجهة(عنصر واجهة *) --> لاشىء","حجب الإشارات(منطقية حجب) --> منطقية","أطفال(لاشىء) --> قائمة كائنات","أقرب حجم مقبول(عنصر واجهة *عنصر، حجم) --> حجم","هوامش المحتوى(لاشىء) --> هوامش","مستطيل المحتوى(لاشىء) --> مستطيل","حذف(لاشىء) --> لاشىء","احذف لاحقاً(لاشىء) --> لاشىء","اتجاه(لاشىء) --> اتجاه التخطيط","تفريغ معلومات الكائن(لاشىء) --> لاشىء","تفريغ شجرة الكائن(لاشىء) --> لاشىء","الحصول على هوامش المحتوى(عدد صحيح *يسار، عدد صحيح *أعلى، عدد صحيح *يمين، عدد صحيح *أسفل) --> لاشىء","يرث(حرف *اسم الفئة) --> منطقية","تهيئة(الأصل) --> كائن","إدراج تخطيط(عدد صحيح الفهرس، تخطيط *تخطيط، عدد صحيح التمدد) --> لاشىء","إدراج عنصر فراغ(عدد صحيح الفهرس، عنصر فراغ *) --> لاشىء","إدراج تباعد(عدد صحيح الفهرس، عدد صحيح الحجم) --> لاشىء","إدراج تمدد(عدد صحيح الفهرس، عدد صحيح التمدد) --> لاشىء","إدراج عنصر واجهة(عدد صحيح الفهرس، عنصر واجهة *عنصر، عدد صحيح التمدد، محاذاة) --> لاشىء","تثبيت مرشح الحدث(كائن *مرشح) --> لاشىء","مُمكّن(لاشىء) --> منطقية","نوع الواجهة(لاشىء) --> منطقية","إيقاف المؤقت(عدد صحيح المعرف) --> لاشىء","شريط القائمة(لاشىء) --> عنصر واجهة","نقل إلى الخيط(خيط *الخيط المستهدف) --> لاشىء","اسم الكائن(لاشىء) --> نص","مؤشر الكائن(لاشىء) --> مؤشر","الأصل(لاشىء) --> كائن","واجهة الأصل(لاشىء) --> عنصر واجهة","خاصية(حرف *اسم) --> نوع متغير","إزالة مرشح الحدث(كائن *كائن) --> لاشىء","إزالة عنصر(عنصر تخطيط *) --> لاشىء","إزالة عنصر واجهة(عنصر واجهة *) --> لاشىء","تعيين المحاذاة(عنصر واجهة *عنصر، محاذاة) --> منطقية","تعيين المحاذاة_2(محاذاة) --> لاشىء","تعيين المحاذاة_3(تخطيط *تخطيط، محاذاة) --> منطقية","تعيين هوامش المحتوى(عدد صحيح يسار، عدد صحيح أعلى، عدد صحيح يمين، عدد صحيح أسفل) --> لاشىء","تعيين هوامش المحتوى_2(هوامش) --> لاشىء","تعيين الاتجاه(اتجاه التخطيط) --> لاشىء","تعيين التمكين(منطقية تمكين) --> لاشىء","تعيين شريط القائمة(عنصر واجهة *عنصر) --> لاشىء","تعيين اسم الكائن(نص) --> لاشىء","تعيين الأصل(كائن *الأصل) --> لاشىء","تعيين خاصية(حرف *اسم، نوع متغير) --> منطقية","تعيين خاصية_2(حرف *اسم، عدد صحيح) --> منطقية","تعيين خاصية_3(حرف *اسم، عائم) --> منطقية","تعيين خاصية_4(حرف *اسم، مزدوج) --> منطقية","تعيين خاصية_5(حرف *اسم، نص) --> منطقية","تعيين خاصية_مزدوج(حرف *اسم، مزدوج) --> منطقية","تعيين خاصية_عائم(حرف *اسم، عائم) --> منطقية","تعيين خاصية_عدد صحيح(حرف *اسم، عدد صحيح) --> منطقية","تعيين خاصية_نص(حرف *اسم، نص) --> منطقية","تعيين قيد الحجم(قيد الحجم) --> لاشىء","تعيين التباعد(عدد صحيح التباعد) --> لاشىء","تعيين التمدد(عدد صحيح الفهرس، عدد صحيح التمدد) --> لاشىء","تعيين عامل التمدد(عنصر واجهة *عنصر، عدد صحيح التمدد) --> منطقية","تعيين عامل التمدد_2(تخطيط *تخطيط، عدد صحيح التمدد) --> منطقية","حجب الإشارات(لاشىء) --> منطقية","قيد الحجم(لاشىء) --> قيد الحجم","التباعد(لاشىء) --> عدد صحيح","تشغيل المؤقت(عدد صحيح الفاصل الزمني) --> عدد صحيح","تمدد(عدد صحيح الفهرس) --> عدد صحيح","الخيط(لاشىء) --> خيط","تحديث(لاشىء) --> لاشىء"]
T_CT_QVBOXLAYOUTCLASS_IP_VALUE3 = "المعطيات :"
T_CT_QVBOXLAYOUTCLASS_IP_VALUE4 = "الناتج :"
