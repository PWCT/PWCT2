func main  { 
	for x=1 to 2 step 1 { 
		if 1 { 
			try { 
				see 1/0
			catch 
				? :error
			} 
		} 
		try { 
			see 1/0
		catch 
			? :error
		} 
	} 
} 
return true
func one  { 
	? :one
} 
