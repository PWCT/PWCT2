? "Enter Chapter: "
give chapter
? "Enter Images Count: "
give nCount
cOut = ""
for t = 1 to 0+nCount step 1 { 
	cOut += ".. image:: images/"+chapter+"/"+t+".png
		:alt: "+t+".png"+nl+nl
} 
? cOut
write("out.txt",cOut)
system("notepad out.txt")
