str1 = "abcdef"
str2 = "abcdef"
str3 = "def"
nCompare1 = strcmp(str1,str2)
? nCompare1
nCompare2 = strcmp(str1,str3)
? nCompare2
nCompare3 = strcmp(str3,str1)
? nCompare3
if str1 = str2 { 
	? "Yes"
}
if str1 != str3 { 
	? "Yes"
}
mystr = "one" + nl + "two" + nl + "three" + nl
? mystr
aList = str2list(mystr)
? aList
nSize = len(aList)
? nSize
