/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  templates Component
**	Date : 2021.08.10
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/


T_CT_TEMPLATES_IP_TITLE = "مكون القوالب"
T_CT_TEMPLATES_IP_VALUE = "القالب : "
T_CT_TEMPLATES_IP_VALUELIST = [
	"مرحبا ياعالم (واجهة خطية)",
	"الترحيب بشخص (واجهة خطية)",
	"حلقة وشرط"
]
T_CT_TEMPLATES_IP_VALUECODE = [
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
