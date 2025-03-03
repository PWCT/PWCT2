/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qmediaplayerclass Component
**	Date : 2021.08.09
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


T_CT_QMEDIAPLAYERCLASS_IP_TITLE = "مكون فئة ال QMediaPlayer"
T_CT_QMEDIAPLAYERCLASS_IP_VALUE = "اسم الكائن :"
T_CT_QMEDIAPLAYERCLASS_IP_VALUE2 = "الميثود : "

T_CT_QMEDIAPLAYERCLASS_IP_VALUE3 = "المعطيات :"
T_CT_QMEDIAPLAYERCLASS_IP_VALUE4 = "الناتج :"
T_CT_QMEDIAPLAYERCLASS_IP_VALUE2FUNC = [
	"bufferstatus",
	"currentmedia",
	"currentnetworkconfiguration",
	"delete",
	"duration",
	"error",
	"errorstring",
	"init",
	"isaudioavailable",
	"ismuted",
	"isseekable",
	"isvideoavailable",
	"media",
	"mediastatus",
	"mediastream",
	"objectpointer",
	"pause",
	"play",
	"playbackrate",
	"playlist",
	"position",
	"setmedia",
	"setmuted",
	"setplaybackrate",
	"setplaylist",
	"setposition",
	"setvideooutput",
	"setvolume",
	"state",
	"stop",
	"volume"
]

T_CT_QMEDIAPLAYERCLASS_IP_VALUE2STEPFUNC = [
"حالة الوسيطة",
"الوسائط الحالية",
"تكوين الشبكة الحالية",
"حذف",
"مدة",
"خطأ",
"نص الخطأ",
"تهيئة",
"هل الصوت متاح",
"هل مكتوم",
"هل يمكن البحث",
"هل الفيديو متاح",
"وسائط",
"حالة الوسائط",
"تدفق الوسائط",
"مؤشر الكائن",
"إيقاف مؤقت",
"تشغيل",
"سرعة التشغيل",
"قائمة التشغيل",
"موقع",
"تعيين الوسائط",
"تعيين مكتوم",
"تعيين سرعة التشغيل",
"تعيين قائمة التشغيل",
"تعيين الموقع",
"تعيين خرج الفيديو",
"تعيين الحجم",
"حالة",
"توقف",
"حجم"
]


/*
T_CT_QMEDIAPLAYERCLASS_IP_VALUE2LIST = [
	"bufferStatus(void) --> int",
	"currentMedia(void) --> QMediaContent",
	"currentNetworkConfiguration(void) --> QNetworkConfiguration",
	"delete(void) --> void",
	"duration(void) --> int",
	"error(void) --> int",
	"errorString(void) --> QString",
	"init(parent) --> object",
	"isAudioAvailable(void) --> bool",
	"isMuted(void) --> bool",
	"isSeekable(void) --> bool",
	"isVideoAvailable(void) --> bool",
	"media(void) --> QMediaContent",
	"mediaStatus(void) --> int",
	"mediaStream(void) --> QIODevice",
	"objectpointer(void) --> pointer",
	"pause(void) --> void",
	"play(void) --> void",
	"playbackRate(void) --> qreal",
	"playlist(void) --> QMediaPlaylist",
	"position(void) --> int",
	"setMedia(QUrl) --> void",
	"setMuted(bool muted) --> void",
	"setPlaybackRate(qreal rate) --> void",
	"setPlaylist(QMediaPlaylist *playlist) --> void",
	"setPosition(int position) --> void",
	"setVideoOutput(QVideoWidget *output) --> void",
	"setVolume(int volume) --> void",
	"state(void) --> int",
	"stop(void) --> void",
	"volume(void) --> int"
]
*/

T_CT_QMEDIAPLAYERCLASS_IP_VALUE2LIST = [
"حالة المخزن المؤقت( لاشىء ) --> عدد صحيح",
"وسائل الإعلام الحالية( لاشىء ) --> محتوى الوسائط",
"تكوين الشبكة الحالي( لاشىء ) --> تكوين الشبكة",
"حذف( لاشىء ) --> لاشىء",
"مدة( لاشىء ) --> عدد صحيح",
"خطأ( لاشىء ) --> عدد صحيح",
"نص الخطأ( لاشىء ) --> نص سلسلة",
"تهيئة( أصل ) --> كائن",
"هل الصوت متاح( لاشىء ) --> صحيح / خطأ",
"هل مكتوم( لاشىء ) --> صحيح / خطأ",
"هل يمكن البحث( لاشىء ) --> صحيح / خطأ",
"هل الفيديو متاح( لاشىء ) --> صحيح / خطأ",
"وسائل الإعلام( لاشىء ) --> محتوى الوسائط",
"حالة الوسائط( لاشىء ) --> عدد صحيح",
"تيار الوسائط( لاشىء ) --> جهاز الإدخال / الإخراج",
"مؤشر الكائن( لاشىء ) --> مؤشر",
"إيقاف مؤقت( لاشىء ) --> لاشىء",
"تشغيل( لاشىء ) --> لاشىء",
"معدل التشغيل( لاشىء ) --> معدل حقيقي",
"قائمة التشغيل( لاشىء ) --> قائمة تشغيل الوسائط",
"موقع( لاشىء ) --> عدد صحيح",
"تعيين الوسائط( عنوان ورل ) --> لاشىء",
"تعيين مكتوم( صحيح / خطأ مكتوم ) --> لاشىء",
"تعيين معدل التشغيل( معدل حقيقي ) --> لاشىء",
"تعيين قائمة التشغيل( قائمة تشغيل الوسائط *قائمة التشغيل ) --> لاشىء",
"تعيين الموقع( عدد صحيح موقع ) --> لاشىء",
"تعيين خرج الفيديو( أداة فيديو *خرج ) --> لاشىء",
"تعيين الحجم( عدد صحيح حجم ) --> لاشىء",
"حالة( لاشىء ) --> عدد صحيح",
"توقف( لاشىء ) --> لاشىء",
"حجم( لاشىء ) --> عدد صحيح"
]
