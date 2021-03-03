for x=1 to 10 step 1 { 
	? :before
	for y=1 to 10 step 1 { 
		if x=1 { 
			? :one
			elseif x=2
				? :two
			elseif x=3
				? :three
			else
				? :mmm
		} 
		? :secondfor
	} 
	? :firstfor
} 
