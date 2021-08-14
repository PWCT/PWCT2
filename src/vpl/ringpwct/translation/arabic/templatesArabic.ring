/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  templates Component
**	Date : 2021.08.10
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


T_CT_TEMPLATES_IP_TITLE = "مكون القوالب"
T_CT_TEMPLATES_IP_VALUE = "القالب : "
T_CT_TEMPLATES_IP_VALUE2 = "بدون تعليقات"
T_CT_TEMPLATES_IP_VALUELIST = [
	"مرحبا ياعالم (واجهة خطية)",
	"الترحيب بشخص (واجهة خطية)",
	"حلقة وشرط"
]
T_CT_TEMPLATES_IP_VALUECODENOCOMMENTS = [
`
	? "مرحبا ياعالم"
`,
`
	? "ادخل اسمك؟" 
	give الاسم 
	? "مرحبا يا " + الاسم
`,
`
	for ل=1 to 10
		? ل
		if ل=3 
			? "رقم ثلاثة"
		ok
	next
`
]
T_CT_TEMPLATES_IP_VALUECODE = [
`
# 
# اهلا بك فى عالم البرمجة
# هنا نقوم بعمل اول تطبيق لنا
# والذى يقوم بعرض رسالة على الشاشة
#
	? "مرحبا ياعالم"
#
`,
`
#
# فى هذا التطبيق نطلب من المستخدم إدخال اسمه
# ثم بعد ذلك نقوم بعرض رسالة ترحيب
# ثم اسم المستخدم
#
	? "ادخل اسمك؟" 
	give الاسم 
	? "مرحبا يا " + الاسم
#
`,
`
#
# فى هذا التطبيق نستخدم حلقة التكرار 
# لعرض الارقام من واحد الى عشرة 
# وعندما نجد الرقم ثلاثة نعرض رسالة تبين ذلك
#
	for ع=1 to 10
		? ع
		if ع=3 
			? "رقم ثلاثة"
		ok
	next
#
`
]

