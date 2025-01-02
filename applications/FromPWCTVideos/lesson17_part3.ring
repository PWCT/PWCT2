counter(1,10)
counter(15,20)
counter(25,30)
counter(100,105)
counter(20,10)
func counter nStart,nEnd
	? "before"
	nStep = 1
	if nStart > nEnd { 
		nStep = -1
	}
	for t = nStart to nEnd step nStep { 
		? t
	}
	? "after"
