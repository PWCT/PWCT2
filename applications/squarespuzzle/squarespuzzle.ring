# SquaresPuzzle Game (Using Allegro game programming library)
# Author : Majdi Sobain <majdisobain@gmail.com>
	load "gamelib.ring"
	# Constants and Global Variables
		BoardDim = 398
		SquarePositions = [[0,0],2,3,4,5,6,7,8,9]
		SquareDim = 0
		Moves = 0
		Squares = ["square",1]
	# Initialization
		al_init()
		al_init_image_addon()
		al_init_font_addon()
		al_init_ttf_addon()
		font = al_load_ttf_font("pirulen.ttf",14,0)
		display = al_create_display(406,500)
		al_set_window_title(display,"Squares Puzzle Game")
		al_set_display_icon(display,al_load_bitmap("sp-palace.jpg"))
		al_clear_to_color(al_map_rgb(255,255,255))
		Board = al_create_bitmap(boarddim,boarddim)
		al_set_target_bitmap(board)
		al_clear_to_color(al_map_rgb(220,220,220))
		al_set_target_bitmap(al_get_backbuffer(display))
		al_draw_bitmap(board,al_get_display_width(display)/2-boarddim/2,al_get_display_height(display)/2-boarddim/2,0)
		Image = al_create_sub_bitmap(al_load_bitmap("sp-palace.jpg"),0,0,boarddim-8,boarddim-8)
		MoveLabel = al_create_bitmap(al_get_display_width(display),30)
		al_set_target_bitmap(movelabel)
		al_clear_to_color(al_map_rgb(220,220,220))
		al_set_target_bitmap(al_get_backbuffer(display))
		al_draw_text(font,al_map_rgb(0,0,0),150,20,ALLEGRO_ALIGN_LEFT,"Squares :)")
	# Events Initialization
		al_flip_display()
		event_queue = al_create_event_queue()
		ev = al_new_allegro_event()
		al_register_event_source(event_queue,al_get_display_event_source(display))
		al_install_mouse()
		al_register_event_source(event_queue,al_get_mouse_event_source())
		al_install_keyboard()
		al_register_event_source(event_queue,al_get_keyboard_event_source())
	# SetSquaresPositionsAndDimensions
		squaredim = (boarddim-8)/3
		boardx = al_get_display_width(display)/2-boarddim/2
		boardy = al_get_display_height(display)/2-boarddim/2
		SquarePositions[1] = [boardx+2,boardy+2]
		SquarePositions[2] = [boardx+squaredim+4,boardy+2]
		SquarePositions[3] = [boardx+squaredim*2+6,boardy+2]
		SquarePositions[4] = [boardx+2,boardy+squaredim+4]
		SquarePositions[5] = [boardx+squaredim+4,boardy+squaredim+4]
		SquarePositions[6] = [boardx+squaredim*2+6,boardy+squaredim+4]
		SquarePositions[7] = [boardx+2,boardy+squaredim*2+6]
		SquarePositions[8] = [boardx+squaredim+4,boardy+squaredim*2+6]
		SquarePositions[9] = [boardx+squaredim*2+6,boardy+squaredim*2+6]
	# CreateSquares
		squares = list(9)
		ind = 1
		for j = 0 to 2 step 1 { 
			for i = 0 to 2 step 1 { 
				squares[ind] = [al_create_sub_bitmap(image,i*squaredim,j*squaredim,squaredim,squaredim),-1]
				ind += 1
			} 
		} 
		squares[9] = [al_create_sub_bitmap(board,1,1,squaredim,squaredim),-1]
	# Draw full Pic with timer
		al_draw_bitmap(image,al_get_display_width(display)/2-boarddim/2+4,al_get_display_height(display)/2-boarddim/2+4,0)
		al_flip_display()
		timer = al_create_timer(1)
		al_register_event_source(event_queue,al_get_timer_event_source(timer))
		al_start_timer(timer)
		moves = 3
		while true { 
			al_wait_for_event(event_queue,ev)
			al_draw_bitmap(movelabel,0,al_get_display_height(display)-30,0)
			al_draw_text(font,al_map_rgb(0,0,0),200,al_get_display_height(display)-20,ALLEGRO_ALIGN_LEFT,string(moves))
			moves -= 1
			al_flip_display()
			if moves = -1 { 
				moves = 0
				exit 1
			} 
		} 
		al_destroy_timer(timer)
		al_rest(1)
		al_draw_bitmap(movelabel,0,al_get_display_height(display)-30,0)
		al_draw_text(font,al_map_rgb(0,0,0),150,al_get_display_height(display)-20,ALLEGRO_ALIGN_LEFT,"Moves : "+moves)
	# RandomizePositions
		al_flip_display()
		for i = 1 to 9 step 1 { 
			while true { 
				Ind = LimitRandom(1,9)
				found = false
				for s in squares step 1 { 
					if ind = s[2] { 
						found = true
					} 
				} 
				if found = false { 
					squares[i][2] = ind
					exit 1
				} 
			} 
		} 
	# DrawRandomizedSquares
		al_set_target_bitmap(al_get_backbuffer(display))
		al_draw_bitmap(board,al_get_display_width(display)/2-boarddim/2,al_get_display_height(display)/2-boarddim/2,0)
		for s in squares step 1 { 
			al_draw_bitmap(s[1],SquarePositions[s[2]][1],SquarePositions[s[2]][2],0)
		} 
		al_flip_display()
		while true { 
			al_wait_for_event(event_queue,ev)
			switch al_get_allegro_event_type(ev) { 
				case ALLEGRO_EVENT_DISPLAY_CLOSE
					exit 1
				case ALLEGRO_EVENT_MOUSE_BUTTON_UP
					mouse_x = al_get_allegro_event_mouse_x(ev)
					mouse_y = al_get_allegro_event_mouse_y(ev)
					for cursqr = 1 to 9 step 1 { 
						dx = mouse_x-SquarePositions[cursqr][1]
						dy = mouse_y-SquarePositions[cursqr][2]
						if dx < squaredim AND dx > 0 { 
							if dy < squaredim AND dy > 0 { 
								ns = CheckNearSpace(cursqr)
								if ns! = 0 { 
									exsquareposition(cursqr,ns)
								} 
							} 
						} 
					} 
				case ALLEGRO_EVENT_KEY_UP
					switch al_get_allegro_event_keyboard_keycode(ev) { 
						case ALLEGRO_KEY_UP
							ps = GiveSelectedSqrInd(1)
							if ps! = 0 { 
								exsquareposition(ps,squares[9][2])
							} 
						case ALLEGRO_KEY_DOWN
							ps = GiveSelectedSqrInd(3)
							if ps! = 0 { 
								exsquareposition(ps,squares[9][2])
							} 
						case ALLEGRO_KEY_LEFT
							ps = GiveSelectedSqrInd(4)
							if ps! = 0 { 
								exsquareposition(ps,squares[9][2])
							} 
						case ALLEGRO_KEY_RIGHT
							ps = GiveSelectedSqrInd(2)
							if ps! = 0 { 
								exsquareposition(ps,squares[9][2])
							} 
					} 
			} 
			if Solved() = true { 
				ft = al_load_ttf_font("pirulen.ttf",20,0)
				lastpanel = al_create_bitmap(350,70)
				al_set_target_bitmap(lastpanel)
				al_clear_to_color(al_map_rgb(255,255,255))
				al_set_target_bitmap(al_get_backbuffer(display))
				al_draw_bitmap(lastpanel,al_get_display_width(display)/2-boarddim/2+24,al_get_display_height(display)/2-30,0)
				if moves < 50 { 
					al_draw_text(ft,al_map_rgb(0,0,0),40,al_get_display_height(display)/2-20,ALLEGRO_ALIGN_LEFT,"Congratulations ^_^")
					al_draw_text(font,al_map_rgb(0,0,0),80,al_get_display_height(display)/2,ALLEGRO_ALIGN_LEFT,"You Are Really Genius")
					elseif moves >= 50 AND moves < 100
						al_draw_text(ft,al_map_rgb(0,0,0),40,al_get_display_height(display)/2-20,ALLEGRO_ALIGN_LEFT,"Congratulations ^_^")
						al_draw_text(font,al_map_rgb(0,0,0),100,al_get_display_height(display)/2,ALLEGRO_ALIGN_LEFT,"You Are Really Smart")
					elseif moves >= 100 AND moves < 200
						al_draw_text(ft,al_map_rgb(0,0,0),40,al_get_display_height(display)/2-20,ALLEGRO_ALIGN_LEFT,"Congratulations ^_^")
						al_draw_text(font,al_map_rgb(0,0,0),100,al_get_display_height(display)/2,ALLEGRO_ALIGN_LEFT,"You Are Smart")
					elseif moves >= 200
						al_draw_text(ft,al_map_rgb(0,0,0),40,al_get_display_height(display)/2-20,ALLEGRO_ALIGN_LEFT,"Congratulations ^_^")
						al_draw_text(font,al_map_rgb(0,0,0),90,al_get_display_height(display)/2,ALLEGRO_ALIGN_LEFT,"But Slowly Solved")
				} 
				al_flip_display()
				al_rest(15)
				exit 1
			} 
		} 
	# Finalization
		al_destroy_event_queue(event_queue)
		al_destroy_allegro_event(ev)
		for s in squares step 1 { 
			al_destroy_bitmap(s[1])
		} 
		al_destroy_bitmap(image)
		al_destroy_bitmap(board)
		al_destroy_display(display)
	# END of Execution
		al_exit()
	func LimitRandom S,E { 
		while true { 
			r = random(e)
			if r >= s { 
				return r
			} 
		} 
	} 
	func ExSquarePosition filled,spaced { 
		al_set_target_bitmap(al_get_backbuffer(display))
		al_draw_bitmap(squares[find(squares,filled,2)][1],SquarePositions[squares[9][2]][1],SquarePositions[squares[9][2]][2],0)
		al_draw_bitmap(squares[9][1],SquarePositions[filled][1],SquarePositions[filled][2],0)
		squares[9][2] = filled
		squares[find(squares,filled,2)][2] = spaced
		moves += 1
		al_draw_bitmap(movelabel,0,al_get_display_height(display)-30,0)
		al_draw_text(font,al_map_rgb(0,0,0),150,al_get_display_height(display)-20,ALLEGRO_ALIGN_LEFT,"Moves : "+moves)
		al_flip_display()
	} 
	func CheckNearSpace i { 
		S = squares[9][2]
		switch i { 
			case 1
				switch s { 
					case 2
						return s
					case 4
						return s
				} 
			case 2
				switch s { 
					case 1
						return s
					case 3
						return s
					case 5
						return s
				} 
			case 3
				switch s { 
					case 2
						return s
					case 6
						return s
				} 
			case 4
				switch s { 
					case 1
						return s
					case 5
						return s
					case 7
						return s
				} 
			case 5
				switch s { 
					case 2
						return s
					case 4
						return s
					case 6
						return s
					case 8
						return s
				} 
			case 6
				switch s { 
					case 3
						return s
					case 5
						return s
					case 9
						return s
				} 
			case 7
				switch s { 
					case 4
						return s
					case 8
						return s
				} 
			case 8
				switch s { 
					case 5
						return s
					case 7
						return s
					case 9
						return s
				} 
			case 9
				switch s { 
					case 6
						return s
					case 8
						return s
				} 
		} 
		return 0
	} 
	func GiveSelectedSqrInd Dir { 
		# Up 1, Right 2, Down 3, Left 4
		S = squares[9][2]
		switch s { 
			case 1
				switch dir { 
					case 1
						return 4
					case 4
						return 2
				} 
			case 2
				switch dir { 
					case 1
						return 5
					case 2
						return 1
					case 4
						return 3
				} 
			case 3
				switch dir { 
					case 1
						return 6
					case 2
						return 2
				} 
			case 4
				switch dir { 
					case 1
						return 7
					case 4
						return 5
					case 3
						return 1
				} 
			case 5
				switch dir { 
					case 1
						return 8
					case 2
						return 4
					case 3
						return 2
					case 4
						return 6
				} 
			case 6
				switch dir { 
					case 1
						return 9
					case 2
						return 5
					case 3
						return 3
				} 
			case 7
				switch dir { 
					case 3
						return 4
					case 4
						return 8
				} 
			case 8
				switch dir { 
					case 2
						return 7
					case 3
						return 5
					case 4
						return 9
				} 
			case 9
				switch dir { 
					case 2
						return 8
					case 3
						return 6
				} 
		} 
		return 0
	} 
	func Solved  { 
		for i = 1 to 9 step 1 { 
			if squares[i][2]! = i { 
				return false
			} 
		} 
		return true
	} 
