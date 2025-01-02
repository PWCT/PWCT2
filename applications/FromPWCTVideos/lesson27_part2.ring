aList = [
:name = "Ring",
:type = "Dynamic",
:year = 2016,
:license = "MIT"
]
aList2 = [
["name", "Ring"],
["type", "Dynamic"],
["year",2016],
["license","MIT"]
]
? aList
? aList2
nSize = len(aList)
for t = 1 to nSize step 1 { 
	? aList[t][2]
}
for t in aList step 1 { 
	? t[1]
}
? aList[:name]
? aList[:license]
? aList["type"]
? aList[:type]
