func main
	for t = 1 to 10
		mystate = ring_state_new()
		ring_state_mainfile(mystate,"cube.ring")
		ring_state_delete(mystate)
	next