/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  internetclass Component
**	Date : 2018.03.16
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

T_CT_INTERNETCLASS_IP_TITLE = "مكون فئة الإنترنت "
T_CT_INTERNETCLASS_IP_VALUE = "اسم الكائن :"
T_CT_INTERNETCLASS_IP_VALUE2 = "الميثود : "

T_CT_INTERNETCLASS_IP_VALUE2FUNC = [
	"download",
	"sendemail"
]
# Copy the list to support changing the generated method name in the Steps Tree
T_CT_INTERNETCLASS_IP_VALUE2STEPFUNC = [
    "تحميل",
    "ارسال_بريد_الكتروني"
]

/*
T_CT_INTERNETCLASS_IP_VALUE2LIST = [
	"download(cURL) --> String",
	"sendemail(cSMTPServer,cEmail,cPassword,cSender,cReceiver,cCC,cTitle,cContent)"
]
*/

T_CT_INTERNETCLASS_IP_VALUE2LIST = [
    "تحميل(رابط) --> سلسلة",
    "ارسال_بريد_الكتروني(خادم_SMTP,البريد_الالكتروني,كلمة_المرور,المرسل,المستلم,نسخة,عنوان,محتوى)"
]


T_CT_INTERNETCLASS_IP_VALUE3 = "المعطيات :"
T_CT_INTERNETCLASS_IP_VALUE4 = "الناتج :"