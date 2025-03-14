#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  qprinterclass Component
#**	Date : 2021.08.09
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
T_CT_QPRINTERCLASS_IP_TITLE = "مكون فئة ال QPrinter"
T_CT_QPRINTERCLASS_IP_VALUE = "اسم الكائن :"
T_CT_QPRINTERCLASS_IP_VALUE2 = "الميثود : "
#/*
#T_CT_QPRINTERCLASS_IP_VALUE2LIST = [
#	"abort(void) --> bool",
#	"collateCopies(void) --> bool",
#	"colorMode(void) --> int",
#	"copyCount(void) --> int",
#	"creator(void) --> QString",
#	"delete(void) --> void",
#	"docName(void) --> QString",
#	"duplex(void) --> int",
#	"fontEmbeddingEnabled(void) --> bool",
#	"fromPage(void) --> int",
#	"fullPage(void) --> bool",
#	"init(parent) --> object",
#	"isValid(void) --> bool",
#	"newPage(void) --> bool",
#	"objectpointer(void) --> pointer",
#	"outputFileName(void) --> QString",
#	"outputFormat(void) --> int",
#	"pageOrder(void) --> int",
#	"pageRect(QPrinter::Unit unit) --> QRectF",
#	"paintEngine(void) --> QPaintEngine",
#	"paperRect(QPrinter::Unit unit) --> QRectF",
#	"paperSource(void) --> int",
#	"printEngine(void) --> QPrintEngine",
#	"printerName(void) --> QString",
#	"printerSelectionOption(void) --> QString",
#	"printerState(void) --> int",
#	"printProgram(void) --> QString",
#	"printRange(void) --> int",
#	"resolution(void) --> int",
#	"setCollateCopies(bool collate) --> void",
#	"setColorMode(QPrinter::ColorMode newColorMode) --> void",
#	"setCopyCount(int count) --> void",
#	"setCreator(QString) --> void",
#	"setDocName(QString) --> void",
#	"setDuplex(QPrinter::DuplexMode duplex) --> void",
#	"setFontEmbeddingEnabled(bool enable) --> void",
#	"setFromTo(int from, int to) --> void",
#	"setFullPage(bool fp) --> void",
#	"setOutputFileName(QString) --> void",
#	"setOutputFormat(QPrinter::OutputFormat format) --> void",
#	"setPageOrder(QPrinter::PageOrder pageOrder) --> void",
#	"setPageSizeMM(QSizeF) --> void",
#	"setPaperSource(QPrinter::PaperSource source) --> void",
#	"setPrinterName(QString) --> void",
#	"setPrinterSelectionOption(QString) --> void",
#	"setPrintProgram(QString) --> void",
#	"setPrintRange(QPrinter::PrintRange) --> void",
#	"setResolution(int dpi) --> void",
#	"supportsMultipleCopies(void) --> bool",
#	"toPage(void) --> int"
#]
#*/
T_CT_QPRINTERCLASS_IP_VALUE2LIST = ["إلغاء( لا شيء ) --> منطقي","تجميع_النسخ( لا شيء ) --> منطقي","وضعية_الألوان( لا شيء ) --> عدد_صحيح","عدد_النسخ( لا شيء ) --> عدد_صحيح","المنشئ( لا شيء ) --> سلسلة_نصية","حذف( لا شيء ) --> لا شيء","اسم_الوثيقة( لا شيء ) --> سلسلة_نصية","الازدواج( لا شيء ) --> عدد_صحيح","تمكين_تضمين_الخط( لا شيء ) --> منطقي","من_الصفحة( لا شيء ) --> عدد_صحيح","صفحة_كاملة( لا شيء ) --> منطقي","تهيئة( الأب ) --> كائن","هل_صالح( لا شيء ) --> منطقي","صفحة_جديدة( لا شيء ) --> منطقي","مؤشر_كائن( لا شيء ) --> مؤشر","اسم_ملف_الإخراج( لا شيء ) --> سلسلة_نصية","تنسيق_الإخراج( لا شيء ) --> عدد_صحيح","ترتيب_الصفحات( لا شيء ) --> عدد_صحيح","مستطيل_الصفحة( وحدة_الطابعة وحدة ) --> مستطيل_عائم","محرك_الرسم( لا شيء ) --> محرك_الرسم","مستطيل_الورق( وحدة_الطابعة وحدة ) --> مستطيل_عائم","مصدر_الورق( لا شيء ) --> عدد_صحيح","محرك_الطباعة( لا شيء ) --> محرك_الطباعة","اسم_الطابعة( لا شيء ) --> سلسلة_نصية","خيار_اختيار_الطابعة( لا شيء ) --> سلسلة_نصية","حالة_الطابعة( لا شيء ) --> عدد_صحيح","برنامج_الطباعة( لا شيء ) --> سلسلة_نصية","نطاق_الطباعة( لا شيء ) --> عدد_صحيح","الدقة( لا شيء ) --> عدد_صحيح","تعيين_تجميع_النسخ( منطقي تجميع ) --> لا شيء","تعيين_وضعية_الألوان( وضعية_الألوان الجديدة ) --> لا شيء","تعيين_عدد_النسخ( عدد_صحيح عدد ) --> لا شيء","تعيين_المنشئ( سلسلة_نصية ) --> لا شيء","تعيين_اسم_الوثيقة( سلسلة_نصية ) --> لا شيء","تعيين_الازدواج( وضعية_الازدواج ) --> لا شيء","تعيين_تمكين_تضمين_الخط( منطقي تمكين ) --> لا شيء","تعيين_من_إلى( عدد_صحيح من, عدد_صحيح إلى ) --> لا شيء","تعيين_صفحة_كاملة( منطقي صفحة_كاملة ) --> لا شيء","تعيين_اسم_ملف_الإخراج( سلسلة_نصية ) --> لا شيء","تعيين_تنسيق_الإخراج( تنسيق_الإخراج ) --> لا شيء","تعيين_ترتيب_الصفحات( ترتيب_الصفحات ) --> لا شيء","تعيين_حجم_الصفحة_مم( حجم_عائم ) --> لا شيء","تعيين_مصدر_الورق( مصدر_الورق ) --> لا شيء","تعيين_اسم_الطابعة( سلسلة_نصية ) --> لا شيء","تعيين_خيار_اختيار_الطابعة( سلسلة_نصية ) --> لا شيء","تعيين_برنامج_الطباعة( سلسلة_نصية ) --> لا شيء","تعيين_نطاق_الطباعة( نطاق_الطباعة ) --> لا شيء","تعيين_الدقة( عدد_صحيح نقطة_لكل_بوصة ) --> لا شيء","يدعم_نسخ_متعددة( لا شيء ) --> منطقي","إلى_الصفحة( لا شيء ) --> عدد_صحيح"]
T_CT_QPRINTERCLASS_IP_VALUE3 = "المعطيات :"
T_CT_QPRINTERCLASS_IP_VALUE4 = "الناتج :"
T_CT_QPRINTERCLASS_IP_VALUE2FUNC = ["abort","collatecopies","colormode","copycount","creator","delete","docname","duplex","fontembeddingenabled","frompage","fullpage","init","isvalid","newpage","objectpointer","outputfilename","outputformat","pageorder","pagerect","paintengine","paperrect","papersource","printengine","printername","printerselectionoption","printerstate","printprogram","printrange","resolution","setcollatecopies","setcolormode","setcopycount","setcreator","setdocname","setduplex","setfontembeddingenabled","setfromto","setfullpage","setoutputfilename","setoutputformat","setpageorder","setpagesizemm","setpapersource","setprintername","setprinterselectionoption","setprintprogram","setprintrange","setresolution","supportsmultiplecopies","topage"]
T_CT_QPRINTERCLASS_IP_VALUE2STEPFUNC = ["إلغاء","تجميع_النسخ","وضعية_الألوان","عدد_النسخ","المنشئ","حذف","اسم_الوثيقة","الازدواج","تمكين_تضمين_الخط","من_الصفحة","صفحة_كاملة","تهيئة","هل_صالح","صفحة_جديدة","مؤشر_كائن","اسم_ملف_الإخراج","تنسيق_الإخراج","ترتيب_الصفحات","مستطيل_الصفحة","محرك_الرسم","مستطيل_الورق","مصدر_الورق","محرك_الطباعة","اسم_الطابعة","خيار_اختيار_الطابعة","حالة_الطابعة","برنامج_الطباعة","نطاق_الطباعة","الدقة","تعيين_تجميع_النسخ","تعيين_وضعية_الألوان","تعيين_عدد_النسخ","تعيين_المنشئ","تعيين_اسم_الوثيقة","تعيين_الازدواج","تعيين_تمكين_تضمين_الخط","تعيين_من_إلى","تعيين_صفحة_كاملة","تعيين_اسم_ملف_الإخراج","تعيين_تنسيق_الإخراج","تعيين_ترتيب_الصفحات","تعيين_حجم_الصفحة_مم","تعيين_مصدر_الورق","تعيين_اسم_الطابعة","تعيين_خيار_اختيار_الطابعة","تعيين_برنامج_الطباعة","تعيين_نطاق_الطباعة","تعيين_الدقة","يدعم_نسخ_متعددة","إلى_الصفحة"]
