? f(2)
mylist = new List([1,2,3])
f(mylist).print()
func f x
	return 2+x*x
class List
	aList = []
	func init vValue
		aList = vValue
	func operator cOperator,vValue
		if cOperator = "r+" { 
			cOperator = "+"
		}
		switch cOperator { 
			case "+"
				if isNumber(vValue) { 
					for t in aList step 1 { 
						t += vValue
					}
					elseif isObject(vValue)
						for t = 1 to len(aList) step 1 { 
							aList[t] += vValue[t]
						}
				}
			case "*"
				if isNumber(vValue) { 
					for t in aList step 1 { 
						t *= vValue
					}
					elseif isObject(vValue)
						for t = 1 to len(aList) step 1 { 
							aList[t] *= vValue[t]
						}
				}
			case "[]"
				return aList[vValue]
			case "len"
				return len(aList)
		}
		return self
	func print
		? aList
private
