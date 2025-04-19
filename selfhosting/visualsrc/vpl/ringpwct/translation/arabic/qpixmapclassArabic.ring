#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  qpixmapclass Component
#**	Date : 2018.03.18
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
T_CT_QPIXMAPCLASS_IP_TITLE = "مكون فئة خريطة النقاط "
T_CT_QPIXMAPCLASS_IP_VALUE = "اسم الكائن :"
T_CT_QPIXMAPCLASS_IP_VALUE2 = "الميثود : "
T_CT_QPIXMAPCLASS_IP_VALUE2FUNC = ["cachekey","convertfromimage","copy","copy_2","createheuristicmask","createmaskfromcolor","defaultdepth","delete","depth","detach","devicepixelratio","fill","fromimage","fromimage_2","fromimagereader","hasalpha","hasalphachannel","height","init","isnull","isqbitmap","loadfromdata","loadfromdata_2","loadpixmap","mask","objectpointer","rect","save","save_2","scaled","scaled_2","scaledtoheight","scaledtowidth","scroll","scroll_2","setdevicepixelratio","setmask","size","swap","toimage","transformed","transformed_2","truematrix","truematrix_2","width"]
#Copy the list to support changing the generated method name in the Steps Tree
T_CT_QPIXMAPCLASS_IP_VALUE2STEPFUNC = ["مفتاح التخزين المؤقت","تحويل من صورة","نسخ","نسخ 2","إنشاء قناع استدلالي","إنشاء قناع من لون","عمق افتراضي","حذف","العمق","فصل","نسبة بكسل الجهاز","ملء","من صورة","من صورة 2","من قارئ الصور","لديه ألفا","لديه قناة ألفا","الارتفاع","تهيئة","فارغ","هو بيت ماب","تحميل من بيانات","تحميل من بيانات 2","تحميل الخريطة النقطية","قناع","مؤشر الكائن","مستطيل","حفظ","حفظ 2","مقاس","مقاس 2","مقاس إلى ارتفاع","مقاس إلى عرض","تمرير","تمرير 2","تعيين نسبة بكسل الجهاز","تعيين القناع","الحجم","تبديل","إلى صورة","تحويل","تحويل 2","مصفوفة حقيقية","مصفوفة حقيقية 2","العرض"]
#/*
#T_CT_QPIXMAPCLASS_IP_VALUE2LIST = [
#	"cacheKey(void) --> qint64",
#	"convertFromImage(QImage image, Qt::ImageConversionFlags flags) --> bool",
#	"copy(int x, int y, int width, int height) --> QPixmap",
#	"copy_2(QRect rectangle) --> QPixmap",
#	"createHeuristicMask(bool clipTight) --> QBitmap",
#	"createMaskFromColor(QColor , Qt::MaskMode) --> QBitmap",
#	"defaultDepth(void) --> int",
#	"delete(void) --> void",
#	"depth(void) --> int",
#	"detach(void) --> void",
#	"devicePixelRatio(void) --> qreal",
#	"fill(QColor) --> void",
#	"fromImage(QImage,Qt::ImageConversionFlags) --> QPixmap",
#	"fromImage_2(QImage image, Qt::ImageConversionFlags flags) --> QPixmap",
#	"fromImageReader(QImageReader *imageReader, Qt::ImageConversionFlags flags) --> QPixmap",
#	"hasAlpha(void) --> bool",
#	"hasAlphaChannel(void) --> bool",
#	"height(void) --> int",
#	"init(parent) --> object",
#	"isNull(void) --> bool",
#	"isQBitmap(void) --> bool",
#	"loadFromData(uchar *data, uint len, char *format, Qt::ImageConversionFlags flags) --> bool",
#	"loadFromData_2(QByteArray data, char *format, Qt::ImageConversionFlags flags) --> bool",
#	"loadpixmap(QString, char *, Qt::ImageConversionFlags ) --> bool",
#	"mask(void) --> QBitmap",
#	"objectpointer(void) --> pointer",
#	"rect(void) --> QRect",
#	"save(QString fileName, char *format, int quality) --> bool",
#	"save_2(QIODevice *device, char *format, int quality) --> bool",
#	"scaled(int width, int height, Qt::AspectRatioMode aspectRatioMode, Qt::TransformationMode transformMode) --> QPixmap",
#	"scaled_2(QSize size, Qt::AspectRatioMode aspectRatioMode, Qt::TransformationMode transformMode) --> QPixmap",
#	"scaledToHeight(int height, Qt::TransformationMode mode) --> QPixmap",
#	"scaledToWidth(int width, Qt::TransformationMode mode) --> QPixmap",
#	"scroll(int dx, int dy, int x, int y, int width, int height, QRegion *exposed) --> void",
#	"scroll_2(int dx, int dy, QRect rect, QRegion *exposed) --> void",
#	"setDevicePixelRatio(qreal scaleFactor) --> void",
#	"setMask(QBitmap) --> void",
#	"size(void) --> QSize",
#	"swap(QPixmap other) --> void",
#	"toImage(void) --> QImage",
#	"transformed(QTransform transform, Qt::TransformationMode mode) --> QPixmap",
#	"transformed_2(QMatrix matrix, Qt::TransformationMode mode) --> QPixmap",
#	"trueMatrix(QTransform matrix, int width, int height) --> QTransform",
#	"trueMatrix_2(QMatrix m, int w, int h) --> QMatrix",
#	"width(void) --> int"
#]
#*/
T_CT_QPIXMAPCLASS_IP_VALUE2LIST = ["مفتاح المخبأ( لا شيء ) --> عدد صحيح طويل بنوع التحديد","تحويل من صورة( صورة عابرة, أعلام تحويل الصورة ) --> منطقي","نسخ( عدد صحيح س , عدد صحيح ص , عدد صحيح عرض , عدد صحيح ارتفاع ) --> بكسل تكوين","نسخ ٢( مستطيل ) --> بكسل تكوين","إنشاء قناع تقديري( قص مشدود ) --> قناع بكسل","إنشاء قناع من اللون( لون , طريقة القناع ) --> قناع بكسل","العمق الافتراضي( لا شيء ) --> عدد صحيح","حذف( لا شيء ) --> لا شيء","العمق( لا شيء ) --> عدد صحيح","فصل( لا شيء ) --> لا شيء","نسبة بكسل الجهاز( لا شيء ) --> كسر عشري حقيقي","ملء( لون ) --> لا شيء","من الصورة( صورة عابرة, أعلام تحويل الصورة ) --> بكسل تكوين","من الصورة ٢( صورة عابرة , أعلام تحويل الصورة ) --> بكسل تكوين","من قارئ الصورة( قارئ صورة *قارئ الصورة , أعلام تحويل الصورة ) --> بكسل تكوين","هل لديه شفافية( لا شيء ) --> منطقي","هل لديه قناة شفافية( لا شيء ) --> منطقي","ارتفاع( لا شيء ) --> عدد صحيح","تهيئة( الأب ) --> كائن","هل فارغ( لا شيء ) --> منطقي","هل هو قناع بكسل( لا شيء ) --> منطقي","تحميل من البيانات( بيانات ثابتة, طول, تنسيق, أعلام تحويل الصورة ) --> منطقي","تحميل من البيانات ٢( مصفوفة بايت عشوائية, تنسيق, أعلام تحويل الصورة ) --> منطقي","تحميل بكسل من ملف عبارة( اسم الملف, تنسيق, أعلام تحويل الصورة ) --> منطقي","قناع( لا شيء ) --> قناع بكسل","مؤشر كائن( لا شيء ) --> مؤشر","مستطيل( لا شيء ) --> مستطيل","حفظ( اسم الملف, تنسيق, جودة ) --> منطقي","حفظ ٢( جهاز إدخال إخراج, تنسيق, جودة ) --> منطقي","تحجيم( عرض, ارتفاع, وضعية نسبة الأبعاد, وضعية التحويل ) --> بكسل تكوين","تحجيم ٢( حجم, وضعية نسبة الأبعاد, وضعية التحويل ) --> بكسل تكوين","تحجيم لارتفاع( ارتفاع, وضعية التحويل ) --> بكسل تكوين","تحجيم لعرض( عرض, وضعية التحويل ) --> بكسل تكوين","تمرير( تحول س, تحول ص, عدد صحيح س , عدد صحيح ص , عدد صحيح عرض , عدد صحيح ارتفاع, منطقة مرئية ) --> لا شيء","تمرير ٢( تحول س, تحول ص, مستطيل, منطقة مرئية ) --> لا شيء","تعيين نسبة بكسل الجهاز( مقياس العامل ) --> لا شيء","تعيين قناع( قناع بكسل ) --> لا شيء","حجم( لا شيء ) --> حجم","تبديل( بكسل تكوين آخر ) --> لا شيء","إلى صورة( لا شيء ) --> صورة عابرة","تحول( تحويل, وضعية التحويل ) --> بكسل تكوين","تحول ٢( مصفوفة, وضعية التحويل ) --> بكسل تكوين","مصفوفة صحيحة( تحويل, عرض, ارتفاع ) --> تحويل","مصفوفة صحيحة ٢( مصفوفة, عرض, ارتفاع ) --> مصفوفة","عرض( لا شيء ) --> عدد صحيح"]
T_CT_QPIXMAPCLASS_IP_VALUE3 = "المعطيات :"
T_CT_QPIXMAPCLASS_IP_VALUE4 = "الناتج :"
