clockspersecond = clockspersecond()
nClock1 = clock()
nSum = 0
for t = 1 to 100_000 step 1 { 
	nSum = nSum+t
}
nClock2 = clock()
? (nClock2- nClock1)/ clockspersecond
