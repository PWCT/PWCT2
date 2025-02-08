/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  fileclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

T_CT_FILECLASS_IP_TITLE = "مكون فئة الملف"
T_CT_FILECLASS_IP_VALUE = "اسم الكائن :"
T_CT_FILECLASS_IP_VALUE2 = "الميثود : "

T_CT_FILECLASS_IP_VALUE2FUNC = [
	"clearerr",
	"close",
	"dir",
	"eof",
	"error",
	"exists",
	"flush",
	"fread",
	"fwrite",
	"getc",
	"getpos",
	"gets",
	"open",
	"perror",
	"putc",
	"puts",
	"read",
	"remove",
	"rename",
	"reopen",
	"rewind",
	"seek",
	"setpos",
	"tell",
	"tempfile",
	"ungetc",
	"write"
]
# Copy the list to support changing the generated method name in the Steps Tree
T_CT_FILECLASS_IP_VALUE2STEPFUNC = [
    "مسح_خطأ",
    "اغلاق",
    "مجلد",
    "نهاية_الملف",
    "خطأ",
    "يوجد",
    "تنظيف",
    "قراءة_ملف",
    "كتابة_ملف",
    "احصل_على_حرف",
    "احصل_على_موقع",
    "احصل_على_سلسلة",
    "فتح",
    "طباعة_خطأ",
    "ضع_حرف",
    "ضع_سلسلة",
    "قراءة",
    "ازالة",
    "اعادة_تسمية",
    "اعادة_فتح",
    "اعادة_لف",
    "بحث",
    "تحديد_موقع",
    "اخبر",
    "ملف_مؤقت",
    "ارجاع_حرف",
    "كتابة"
]

/*
T_CT_FILECLASS_IP_VALUE2LIST = [
	"clearerr()",
	"close()",
	"dir(cFolderPath) --> List",
	"eof() --> Boolean",
	"error() --> Boolean",
	"exists(cFileName) --> Boolean",
	"flush()",
	"fread(nSize) --> String",
	"fwrite(cString)",
	"getc() --> String",
	"getpos() --> poshandle",
	"gets(nSize) --> String",
	"open(cFileName,cMode) --> FileHandle",
	"perror(cErrorMessage)",
	"putc(cChar)",
	"puts(cString)",
	"read(cFileName) --> cFileContent",
	"remove(cFileName)",
	"rename(cOldFileName,cNewFileName)",
	"reopen(cFileName,cMode) --> FileHandle",
	"rewind()",
	"seek(noffset,nwhence) --> Number",
	"setpos(poshandle)",
	"tell() --> Number",
	"tempfile() --> cTempFileName",
	"ungetc(cChar)",
	"write(cFileName,cStr)"
]
*/

T_CT_FILECLASS_IP_VALUE2LIST = [
    "مسح_خطأ()",
    "اغلاق()",
    "مجلد(مسار_المجلد) --> قائمة",
    "نهاية_الملف() --> منطقي",
    "خطأ() --> منطقي",
    "يوجد(اسم_الملف) --> منطقي",
    "تنظيف()",
    "قراءة_ملف(حجم) --> سلسلة",
    "كتابة_ملف(سلسلة)",
    "احصل_على_حرف() --> سلسلة",
    "احصل_على_موقع() --> مؤشر_موقع",
    "احصل_على_سلسلة(حجم) --> سلسلة",
    "فتح(اسم_الملف,وضع) --> مؤشر_ملف",
    "طباعة_خطأ(رسالة_خطأ)",
    "ضع_حرف(حرف)",
    "ضع_سلسلة(سلسلة)",
    "قراءة(اسم_الملف) --> محتوى_الملف",
    "ازالة(اسم_الملف)",
    "اعادة_تسمية(اسم_الملف_القديم,اسم_الملف_الجديد)",
    "اعادة_فتح(اسم_الملف,وضع) --> مؤشر_ملف",
    "اعادة_لف()",
    "بحث(ازاحة,مرجع) --> رقم",
    "تحديد_موقع(مؤشر_موقع)",
    "اخبر() --> رقم",
    "ملف_مؤقت() --> اسم_الملف_المؤقت",
    "ارجاع_حرف(حرف)",
    "كتابة(اسم_الملف,سلسلة)"
]


T_CT_FILECLASS_IP_VALUE3 = "المعطيات :"
T_CT_FILECLASS_IP_VALUE4 = "الناتج :"