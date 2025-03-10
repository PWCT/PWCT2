class GameSound
	lUseSound = True
	lUseMusic = True
	lSoundFilesLoaded = False
	BackGroundMusic
	BackGoundSampleID
	lMusic = False
	PointSound
	PointSampleID
	lPlayPointSound = False
	HitSound
	HitSampleID
	lPlayHitSound = True
	StorySound
	StorySampleID
	lPlayStorySound = True
	MenuChangeSound
	MenuChangeSampleID
	lPlayMenuChangeSound = True
	MenuClickSound
	MenuClickSampleID
	lPlayMenuClickSound = True
	lPlayLevelSound = True
	func LoadSound  { 
		if lSoundFilesLoaded { 
			return 
		} 
		lSoundFilesLoaded = True
		BackGroundMusic = al_load_sample("sound/music3.wav")
		CheckFatalError(BackGroundMusic,"Can't load the sound file sound/music3.wav")
		PointSound = al_load_sample("sound/sfx_point.wav")
		CheckFatalError(PointSound,"Can't load the sound file sound/sfx_point.wav")
		HitSound = al_load_sample("sound/sfx_hit.wav")
		CheckFatalError(HitSound,"Can't load the sound file sound/sfx_hit.wav")
		StorySound = al_load_sample("sound/storymusic.wav")
		CheckFatalError(StorySound,"Can't load the sound file sound/storymusic.wav")
		MenuChangeSound = al_load_sample("sound/menuchange2.wav")
		CheckFatalError(MenuChangeSound,"Can't load the sound file sound/menuchange2.wav")
		MenuClickSound = al_load_sample("sound/menuclick2.wav")
		CheckFatalError(MenuClickSound,"Can't load the sound file sound/menuclick2.wav")
	} 
	func SoundOnOff  { 
		lUseSound = !lUseSound
		lPlayHitSound = !lPlayHitSound
		lPlayLevelSound = !lPlayLevelSound
		lPlayMenuChangeSound = !lPlayMenuChangeSound
		lPlayMenuClickSound = !lPlayMenuClickSound
	} 
	func MusicOnOff  { 
		lUseMusic = !lUseMusic
		if lUseMusic { 
			PlayBackGroundMusic()
			lMusic = False
			else
				al_stop_sample(BackGoundSampleID)
		} 
	} 
	func PlayBackGroundMusic  { 
		if lMusic = False { 
			BackGoundSampleID = al_new_allegro_sample_id()
			al_play_sample(BackGroundMusic,1.0,0.0,1.0,ALLEGRO_PLAYMODE_LOOP,BackGoundSampleID)
			lMusic = True
		} 
	} 
	func PlayPointSound  { 
		if lPlayPointSound = False { 
			return 
		} 
		if IsNULL(PointSampleID) { 
			PointSampleID = al_new_allegro_sample_id()
			al_play_sample(PointSound,1.0,0.0,1.0,ALLEGRO_PLAYMODE_ONCE,PointSampleID)
		} 
	} 
	func StopPointSound  { 
		if lPlayPointSound = False { 
			return 
		} 
		if  NOT ISNULL(PointSampleID) { 
			al_stop_sample(PointSampleID)
			PointSampleID = NULL
		} 
	} 
	func PlayHitSound  { 
		if lPlayHitSound = False { 
			return 
		} 
		if IsNULL(HitSampleID) { 
			HitSampleID = al_new_allegro_sample_id()
			al_play_sample(HitSound,1.0,0.0,1.0,ALLEGRO_PLAYMODE_ONCE,HitSampleID)
		} 
	} 
	func StopHitSound  { 
		if lPlayHitSound = False { 
			return 
		} 
		if  NOT ISNULL(HitSampleID) { 
			al_stop_sample(HitSampleID)
			HitSampleID = NULL
		} 
	} 
	func PlayMenuChangeSound  { 
		if lPlayMenuChangeSound = False { 
			return 
		} 
		if IsNULL(MenuChangeSampleID) { 
			MenuChangeSampleID = al_new_allegro_sample_id()
			al_play_sample(MenuChangeSound,1.0,0.0,1.0,ALLEGRO_PLAYMODE_ONCE,MenuChangeSampleID)
		} 
	} 
	func StopMenuChangeSound  { 
		if lPlayMenuChangeSound = False { 
			return 
		} 
		if  NOT ISNULL(MenuChangeSampleID) { 
			al_stop_sample(MenuChangeSampleID)
			MenuChangeSampleID = NULL
		} 
	} 
	func PlayMenuClickSound  { 
		if lPlayMenuClickSound = False { 
			return 
		} 
		if IsNULL(MenuClickSampleID) { 
			MenuClickSampleID = al_new_allegro_sample_id()
			al_play_sample(MenuClickSound,1.0,0.0,1.0,ALLEGRO_PLAYMODE_ONCE,MenuClickSampleID)
		} 
	} 
	func StopMenuClickSound  { 
		if lPlayMenuClickSound = False { 
			return 
		} 
		if  NOT ISNULL(MenuClickSampleID) { 
			al_stop_sample(MenuClickSampleID)
			MenuClickSampleID = NULL
		} 
	} 
	func PlayStorySound  { 
		if lPlayStorySound = False { 
			return 
		} 
		if IsNULL(StorySampleID) { 
			StorySampleID = al_new_allegro_sample_id()
			al_play_sample(StorySound,1.0,0.0,1.0,ALLEGRO_PLAYMODE_LOOP,StorySampleID)
		} 
	} 
	func StopStorySound  { 
		if lPlayStorySound = False { 
			return 
		} 
		if  NOT ISNULL(StorySampleID) { 
			al_stop_sample(StorySampleID)
			StorySampleID = NULL
		} 
	} 
	func PlayLevelSound  { 
		if lPlayLevelSound { 
			LevelSampleID = al_new_allegro_sample_id()
			al_play_sample(PointSound,1.0,0.0,1.0,ALLEGRO_PLAYMODE_ONCE,LevelSampleID)
		} 
	} 
	func Destroy  { 
		al_destroy_sample(StorySound)
		al_destroy_sample(BackGroundMusic)
		al_destroy_sample(PointSound)
		al_destroy_sample(HitSound)
	} 
private
