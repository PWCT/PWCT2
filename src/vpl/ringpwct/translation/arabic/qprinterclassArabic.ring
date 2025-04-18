/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qprinterclass Component
**	Date : 2021.08.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

T_CT_QPRINTERCLASS_IP_TITLE = "مكون فئة ال QPrinter"
T_CT_QPRINTERCLASS_IP_VALUE = "اسم الكائن :"
T_CT_QPRINTERCLASS_IP_VALUE2 = "الميثود : "

/*
T_CT_QPRINTERCLASS_IP_VALUE2LIST = [
	"abort(void) --> bool",
	"collateCopies(void) --> bool",
	"colorMode(void) --> int",
	"copyCount(void) --> int",
	"creator(void) --> QString",
	"delete(void) --> void",
	"docName(void) --> QString",
	"duplex(void) --> int",
	"fontEmbeddingEnabled(void) --> bool",
	"fromPage(void) --> int",
	"fullPage(void) --> bool",
	"init(parent) --> object",
	"isValid(void) --> bool",
	"newPage(void) --> bool",
	"objectpointer(void) --> pointer",
	"outputFileName(void) --> QString",
	"outputFormat(void) --> int",
	"pageOrder(void) --> int",
	"pageRect(QPrinter::Unit unit) --> QRectF",
	"paintEngine(void) --> QPaintEngine",
	"paperRect(QPrinter::Unit unit) --> QRectF",
	"paperSource(void) --> int",
	"printEngine(void) --> QPrintEngine",
	"printerName(void) --> QString",
	"printerSelectionOption(void) --> QString",
	"printerState(void) --> int",
	"printProgram(void) --> QString",
	"printRange(void) --> int",
	"resolution(void) --> int",
	"setCollateCopies(bool collate) --> void",
	"setColorMode(QPrinter::ColorMode newColorMode) --> void",
	"setCopyCount(int count) --> void",
	"setCreator(QString) --> void",
	"setDocName(QString) --> void",
	"setDuplex(QPrinter::DuplexMode duplex) --> void",
	"setFontEmbeddingEnabled(bool enable) --> void",
	"setFromTo(int from, int to) --> void",
	"setFullPage(bool fp) --> void",
	"setOutputFileName(QString) --> void",
	"setOutputFormat(QPrinter::OutputFormat format) --> void",
	"setPageOrder(QPrinter::PageOrder pageOrder) --> void",
	"setPageSizeMM(QSizeF) --> void",
	"setPaperSource(QPrinter::PaperSource source) --> void",
	"setPrinterName(QString) --> void",
	"setPrinterSelectionOption(QString) --> void",
	"setPrintProgram(QString) --> void",
	"setPrintRange(QPrinter::PrintRange) --> void",
	"setResolution(int dpi) --> void",
	"supportsMultipleCopies(void) --> bool",
	"toPage(void) --> int"
]
*/

T_CT_QPRINTERCLASS_IP_VALUE2LIST = [
"إلغاء( لا شيء ) --> منطقي",
"تجميع النسخ( لا شيء ) --> منطقي",
"وضعية الألوان( لا شيء ) --> عدد صحيح",
"عدد النسخ( لا شيء ) --> عدد صحيح",
"المنشئ( لا شيء ) --> سلسلة نصية",
"حذف( لا شيء ) --> لا شيء",
"اسم الوثيقة( لا شيء ) --> سلسلة نصية",
"الازدواج( لا شيء ) --> عدد صحيح",
"تمكين تضمين الخط( لا شيء ) --> منطقي",
"من الصفحة( لا شيء ) --> عدد صحيح",
"صفحة كاملة( لا شيء ) --> منطقي",
"تهيئة( الأب ) --> كائن",
"هل صالح( لا شيء ) --> منطقي",
"صفحة جديدة( لا شيء ) --> منطقي",
"مؤشر كائن( لا شيء ) --> مؤشر",
"اسم ملف الإخراج( لا شيء ) --> سلسلة نصية",
"تنسيق الإخراج( لا شيء ) --> عدد صحيح",
"ترتيب الصفحات( لا شيء ) --> عدد صحيح",
"مستطيل الصفحة( وحدة الطابعة وحدة ) --> مستطيل عائم",
"محرك الرسم( لا شيء ) --> محرك الرسم",
"مستطيل الورق( وحدة الطابعة وحدة ) --> مستطيل عائم",
"مصدر الورق( لا شيء ) --> عدد صحيح",
"محرك الطباعة( لا شيء ) --> محرك الطباعة",
"اسم الطابعة( لا شيء ) --> سلسلة نصية",
"خيار اختيار الطابعة( لا شيء ) --> سلسلة نصية",
"حالة الطابعة( لا شيء ) --> عدد صحيح",
"برنامج الطباعة( لا شيء ) --> سلسلة نصية",
"نطاق الطباعة( لا شيء ) --> عدد صحيح",
"الدقة( لا شيء ) --> عدد صحيح",
"تعيين تجميع النسخ( منطقي تجميع ) --> لا شيء",
"تعيين وضعية الألوان( وضعية الألوان الجديدة ) --> لا شيء",
"تعيين عدد النسخ( عدد صحيح عدد ) --> لا شيء",
"تعيين المنشئ( سلسلة نصية ) --> لا شيء",
"تعيين اسم الوثيقة( سلسلة نصية ) --> لا شيء",
"تعيين الازدواج( وضعية الازدواج ) --> لا شيء",
"تعيين تمكين تضمين الخط( منطقي تمكين ) --> لا شيء",
"تعيين من إلى( عدد صحيح من, عدد صحيح إلى ) --> لا شيء",
"تعيين صفحة كاملة( منطقي صفحة كاملة ) --> لا شيء",
"تعيين اسم ملف الإخراج( سلسلة نصية ) --> لا شيء",
"تعيين تنسيق الإخراج( تنسيق الإخراج ) --> لا شيء",
"تعيين ترتيب الصفحات( ترتيب الصفحات ) --> لا شيء",
"تعيين حجم الصفحة مم( حجم عائم ) --> لا شيء",
"تعيين مصدر الورق( مصدر الورق ) --> لا شيء",
"تعيين اسم الطابعة( سلسلة نصية ) --> لا شيء",
"تعيين خيار اختيار الطابعة( سلسلة نصية ) --> لا شيء",
"تعيين برنامج الطباعة( سلسلة نصية ) --> لا شيء",
"تعيين نطاق الطباعة( نطاق الطباعة ) --> لا شيء",
"تعيين الدقة( عدد صحيح نقطة لكل بوصة ) --> لا شيء",
"يدعم نسخ متعددة( لا شيء ) --> منطقي",
"إلى الصفحة( لا شيء ) --> عدد صحيح"
]


T_CT_QPRINTERCLASS_IP_VALUE3 = "المعطيات :"
T_CT_QPRINTERCLASS_IP_VALUE4 = "الناتج :"
T_CT_QPRINTERCLASS_IP_VALUE2FUNC = [
	"abort",
	"collatecopies",
	"colormode",
	"copycount",
	"creator",
	"delete",
	"docname",
	"duplex",
	"fontembeddingenabled",
	"frompage",
	"fullpage",
	"init",
	"isvalid",
	"newpage",
	"objectpointer",
	"outputfilename",
	"outputformat",
	"pageorder",
	"pagerect",
	"paintengine",
	"paperrect",
	"papersource",
	"printengine",
	"printername",
	"printerselectionoption",
	"printerstate",
	"printprogram",
	"printrange",
	"resolution",
	"setcollatecopies",
	"setcolormode",
	"setcopycount",
	"setcreator",
	"setdocname",
	"setduplex",
	"setfontembeddingenabled",
	"setfromto",
	"setfullpage",
	"setoutputfilename",
	"setoutputformat",
	"setpageorder",
	"setpagesizemm",
	"setpapersource",
	"setprintername",
	"setprinterselectionoption",
	"setprintprogram",
	"setprintrange",
	"setresolution",
	"supportsmultiplecopies",
	"topage"
]
T_CT_QPRINTERCLASS_IP_VALUE2STEPFUNC = [
"إلغاء",
"تجميع النسخ",
"وضعية الألوان",
"عدد النسخ",
"المنشئ",
"حذف",
"اسم الوثيقة",
"الازدواج",
"تمكين تضمين الخط",
"من الصفحة",
"صفحة كاملة",
"تهيئة",
"هل صالح",
"صفحة جديدة",
"مؤشر كائن",
"اسم ملف الإخراج",
"تنسيق الإخراج",
"ترتيب الصفحات",
"مستطيل الصفحة",
"محرك الرسم",
"مستطيل الورق",
"مصدر الورق",
"محرك الطباعة",
"اسم الطابعة",
"خيار اختيار الطابعة",
"حالة الطابعة",
"برنامج الطباعة",
"نطاق الطباعة",
"الدقة",
"تعيين تجميع النسخ",
"تعيين وضعية الألوان",
"تعيين عدد النسخ",
"تعيين المنشئ",
"تعيين اسم الوثيقة",
"تعيين الازدواج",
"تعيين تمكين تضمين الخط",
"تعيين من إلى",
"تعيين صفحة كاملة",
"تعيين اسم ملف الإخراج",
"تعيين تنسيق الإخراج",
"تعيين ترتيب الصفحات",
"تعيين حجم الصفحة مم",
"تعيين مصدر الورق",
"تعيين اسم الطابعة",
"تعيين خيار اختيار الطابعة",
"تعيين برنامج الطباعة",
"تعيين نطاق الطباعة",
"تعيين الدقة",
"يدعم نسخ متعددة",
"إلى الصفحة"
]