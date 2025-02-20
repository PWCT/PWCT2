#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  weblib_htmlpage Component
#**	Date : 2018.03.21
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
T_CT_WEBLIB_HTMLPAGE_IP_TITLE = "مكون فئة صفحة HTML"
T_CT_WEBLIB_HTMLPAGE_IP_VALUE = "اسم الكائن :"
T_CT_WEBLIB_HTMLPAGE_IP_VALUE2 = "الميثود : "
T_CT_WEBLIB_HTMLPAGECLASS_IP_VALUE2FUNC = ["braceend","cookie","decode","decodestring","getaudio","getbutton","getcookies","getdiv","getfilename","getform","geth1","geth2","geth3","geth4","geth5","geth6","gethtmlstart","getimage","getinput","getli","getlink","getnav","getnewline","getoption","getp","getselect","getspan","gettable","gettabs","gettd","gettextarea","getth","gettr","getul","getvideo","html","nooutput","output","print","script","scriptfunc","scriptfuncajax","scriptfuncalert","scriptfuncclean","scriptfuncselect","scriptlibs","scriptredirection","scriptscrollfixed","setcookie","starthtml","style","styleabsolute","stylebackcolor","stylecolor","styledivcenter","stylefixed","stylefloatleft","stylefloatright","stylefontsize","stylegradient","styleheight","stylehorizontalcenter","styleleft","stylemarginleft","stylemarginright","stylemargintop","stylepos","stylesize","stylesizefull","styletable","styletablenoborder","styletablerows","styletextcenter","styletextleft","styletextright","styletop","stylewidth","stylezindex","tabmlstring","tabpop","tabpush","text","urlencode","webprint"]
#Copy the list to support changing the generated method name in the Steps Tree
T_CT_WEBLIB_HTMLPAGECLASS_IP_VALUE2STEPFUNC = ["نهايةالقوس","كوكيز","فك_الشفرة","فك_سلسلة_الشفرة","جلب_الصوت","جلب_الزر","جلب_الكوكيز","جلب_div","جلب_اسم_الملف","جلب_النموذج","جلب_h1","جلب_h2","جلب_h3","جلب_h4","جلب_h5","جلب_h6","جلب_بداية_HTML","جلب_الصورة","جلب_المدخل","جلب_li","جلب_الرابط","جلب_التنقل","جلب_سطر_جديد","جلب_الخيار","جلب_p","جلب_التحديد","جلب_span","جلب_الجدول","جلب_التبويبات","جلب_td","جلب_منطقة_النص","جلب_th","جلب_tr","جلب_ul","جلب_الفيديو","HTML","لا_يوجد_مخرج","المخرج","طباعة","سكريبت","وظيفة_السكريبت","وظيفة_سكريبت_الأجاكس","وظيفة_سكريبت_التنبيه","وظيفة_سكريبت_التنظيف","وظيفة_سكريبت_التحديد","مكتبات_السكريبت","إعادة_توجيه_السكريبت","تمرير_السكريبت_الثابت","تعيين_الكوكيز","بدء_HTML","النمط","النمط_المطلق","لون_خلفية_النمط","لون_النمط","نمط_مركز_div","النمط_الثابت","نمط_العوامة_اليسرى","نمط_العوامة_اليمنى","حجم_خط_النمط","تدرج_النمط","ارتفاع_النمط","نمط_المركز_الأفقي","اليسار_للنمط","هوامش_اليسار_للنمط","هوامش_اليمين_للنمط","هوامش_الأعلى_للنمط","موضع_النمط","حجم_النمط","الحجم_الكامل_للنمط","نمط_الجدول","نمط_الجدول_بدون_حدود","صفوف_نمط_الجدول","نص_نمط_المركز","نص_نمط_اليسار","نص_نمط_اليمين","الأعلى_للنمط","عرض_النمط","مؤشر_z_للنمط","سلسلة_tabml","إزالة_tab","إضافة_tab","النص","ترميز_URL","طباعة_الويب"]
#/*
#T_CT_WEBLIB_HTMLPAGECLASS_IP_VALUE2LIST = [
#	"braceend()",
#	"cookie(cName,cValue)",
#	"decode(cInput) --> List",
#	"decodestring(cString) --> List",
#	"getaudio() --> Object",
#	"getbutton() --> Object",
#	"getcookies() --> List",
#	"getdiv() --> Object",
#	"getfilename(aArray,cVar) --> String",
#	"getform() --> Object",
#	"geth1() --> Object",
#	"geth2() --> Object",
#	"geth3() --> Object",
#	"geth4() --> Object",
#	"geth5() --> Object",
#	"geth6() --> Object",
#	"gethtmlstart() --> String",
#	"getimage() --> Object",
#	"getinput() --> Object",
#	"getli() --> Object",
#	"getlink() --> Object",
#	"getnav() --> Object",
#	"getnewline()",
#	"getoption() --> Object",
#	"getp() --> Object",
#	"getselect() --> Object",
#	"getspan() --> Object",
#	"gettable() --> Object",
#	"gettabs() --> cTabsString",
#	"gettd() --> Object",
#	"gettextarea() --> Object",
#	"getth() --> Object",
#	"gettr() --> Object",
#	"getul() --> Object",
#	"getvideo() --> Object",
#	"html(cString)",
#	"nooutput()",
#	"output() --> String",
#	"print()",
#	"script(cCode) --> String",
#	"scriptfunc(cFuncName,cCode) --> String",
#	"scriptfuncajax(cFuncName,cLink,cDiv) --> String",
#	"scriptfuncalert(cFuncName,cMsg) --> String",
#	"scriptfuncclean(cFuncName,cDiv) --> String",
#	"scriptfuncselect(cFuncName,aList,cDiv,cResult,cGridRow,cFuncClean,nTimeOut,cLink1,cLink2) --> String",
#	"scriptlibs() --> String",
#	"scriptredirection(cDir) --> String",
#	"scriptscrollfixed(cDiv,nSize) --> String",
#	"setcookie(cName,cValue,cExpires,cPath,cDomain,cSecure)",
#	"starthtml()",
#	"style(cStyle)",
#	"styleabsolute() --> String",
#	"stylebackcolor(cColor) --> String",
#	"stylecolor(cColor) --> String",
#	"styledivcenter(nWidth,nHeight) --> String",
#	"stylefixed() --> String",
#	"stylefloatleft() --> String",
#	"stylefloatright() --> String",
#	"stylefontsize(nSize) --> String",
#	"stylegradient(nStyle) --> String",
#	"styleheight(nHeight) --> String",
#	"stylehorizontalcenter() --> String",
#	"styleleft(nLeft) --> String",
#	"stylemarginleft(nMargin) --> String",
#	"stylemarginright(nMargin) --> String",
#	"stylemargintop(nMargin) --> String",
#	"stylepos(nTop,nLeft) --> String",
#	"stylesize(nWidth,nHeight) --> String",
#	"stylesizefull() --> String",
#	"styletable() --> String",
#	"styletablenoborder() --> String",
#	"styletablerows(nID) --> String",
#	"styletextcenter() --> String",
#	"styletextleft() --> String",
#	"styletextright() --> String",
#	"styletop(nTop) --> String",
#	"stylewidth(nWidth) --> String",
#	"stylezindex(nZIndex) --> String",
#	"tabmlstring(cString) --> String",
#	"tabpop()",
#	"tabpush()",
#	"text(cString)",
#	"urlencode(cString) --> String",
#	"webprint(cString)"
#]
#*/
T_CT_WEBLIB_HTMLPAGECLASS_IP_VALUE2LIST = ["نهايةالقوس()","كوكيز(اسم,قيمة)","فك_الشفرة(مدخل) --> قائمة","فك_سلسلة_الشفرة(سلسلة) --> قائمة","جلب_الصوت() --> كائن","جلب_الزر() --> كائن","جلب_الكوكيز() --> قائمة","جلب_div() --> كائن","جلب_اسم_الملف(مصفوفة,متغير) --> سلسلة","جلب_النموذج() --> كائن","جلب_h1() --> كائن","جلب_h2() --> كائن","جلب_h3() --> كائن","جلب_h4() --> كائن","جلب_h5() --> كائن","جلب_h6() --> كائن","جلب_بداية_HTML() --> سلسلة","جلب_الصورة() --> كائن","جلب_المدخل() --> كائن","جلب_li() --> كائن","جلب_الرابط() --> كائن","جلب_التنقل() --> كائن","جلب_سطر_جديد()","جلب_الخيار() --> كائن","جلب_p() --> كائن","جلب_التحديد() --> كائن","جلب_span() --> كائن","جلب_الجدول() --> كائن","جلب_التبويبات() --> سلسلة_تبويبات","جلب_td() --> كائن","جلب_منطقة_النص() --> كائن","جلب_th() --> كائن","جلب_tr() --> كائن","جلب_ul() --> كائن","جلب_الفيديو() --> كائن","HTML(سلسلة)","لا_يوجد_مخرج()","المخرج() --> سلسلة","طباعة()","سكريبت(كود) --> سلسلة","وظيفة_السكريبت(اسم_الوظيفة,كود) --> سلسلة","وظيفة_سكريبت_الأجاكس(اسم_الوظيفة,رابط,div) --> سلسلة","وظيفة_سكريبت_التنبيه(اسم_الوظيفة,رسالة) --> سلسلة","وظيفة_سكريبت_التنظيف(اسم_الوظيفة,div) --> سلسلة","وظيفة_سكريبت_التحديد(اسم_الوظيفة,قائمة,div,نتيجة,صف_الشبكة,وظيفة_التنظيف,مدة_الخروج,رابط1,رابط2) --> سلسلة","مكتبات_السكريبت() --> سلسلة","إعادة_توجيه_السكريبت(دليل) --> سلسلة","تمرير_السكريبت_الثابت(div,حجم) --> سلسلة","تعيين_الكوكيز(اسم,قيمة,انتهاء,مسار,مجال,آمن)","بدء_HTML()","نمط(نمط)","نمط_مطلق() --> سلسلة","لون_خلفية_النمط(لون) --> سلسلة","لون_النمط(لون) --> سلسلة","نمط_مركز_div(عرض,ارتفاع) --> سلسلة","نمط_ثابت() --> سلسلة","نمط_العوامة_اليسرى() --> سلسلة","نمط_العوامة_اليمنى() --> سلسلة","حجم_خط_النمط(حجم) --> سلسلة","تدرج_النمط(نمط) --> سلسلة","ارتفاع_النمط(ارتفاع) --> سلسلة","نمط_المركز_الأفقي() --> سلسلة","اليسار_للنمط(يسار) --> سلسلة","هوامش_اليسار_للنمط(يسار) --> سلسلة","هوامش_اليمين_للنمط(يمين) --> سلسلة","هوامش_الأعلى_للنمط(أعلى) --> سلسلة","موضع_النمط(أعلى,يسار) --> سلسلة","حجم_النمط(عرض,ارتفاع) --> سلسلة","الحجم_الكامل_للنمط() --> سلسلة","نمط_الجدول() --> سلسلة","نمط_الجدول_بدون_حدود() --> سلسلة","صفوف_نمط_الجدول(معرف) --> سلسلة","نص_نمط_المركز() --> سلسلة","نص_نمط_اليسار() --> سلسلة","نص_نمط_اليمين() --> سلسلة","الأعلى_للنمط(أعلى) --> سلسلة","عرض_النمط(عرض) --> سلسلة","مؤشر_z_للنمط(مؤشر_z) --> سلسلة","سلسلة_tabml(سلسلة) --> سلسلة","إزالة_tab()","إضافة_tab()","نص(سلسلة)","ترميز_URL(سلسلة) --> سلسلة","طباعة_الويب(سلسلة)"]
T_CT_WEBLIB_HTMLPAGE_IP_VALUE3 = "المعطيات :"
T_CT_WEBLIB_HTMLPAGE_IP_VALUE4 = "الناتج :"
