extends RichTextLabel

var lastBeat: int = -1
var frameDuration: float = 0.0
var gameAudio
var gameLengthBeats: int = 8

func _ready() -> void:
	if Global.gameWon == 0:
		gameAudio = AudioManager.get_node("earlyFailTransition")
	elif Global.gameWon == 1:
		gameAudio = AudioManager.get_node("earlySuccessTransition")
	else:
		gameAudio = AudioManager.get_node("earlyTransition")
	
	Engine.time_scale = Global.gameTimeScaleFactor
	gameAudio.pitch_scale = Global.gameTimeScaleFactor
	frameDuration = 60 / Global.bpm
	
	pivot_offset = size / 2

func Show() -> void:
	var displayInstructionsTween = create_tween().set_parallel(true)
	displayInstructionsTween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.8) \
		.set_trans(displayInstructionsTween.TRANS_EXPO).set_ease(displayInstructionsTween.EASE_OUT)
	displayInstructionsTween.tween_property(self, "modulate:a", 1.0, 1.0) \
		.set_trans(displayInstructionsTween.TRANS_SINE).set_ease(displayInstructionsTween.EASE_OUT)
		
func Hide() -> void:
	var displayInstructionsTween = create_tween().set_parallel(true)
	displayInstructionsTween.tween_property(self, "modulate:a", 0.0, 0.5) \
		.set_trans(displayInstructionsTween.TRANS_SINE).set_ease(displayInstructionsTween.EASE_OUT)

func _physics_process(_delta: float) -> void:
	if Global.gameWon == 0:
		gameAudio = AudioManager.get_node("earlyFailTransition")
	elif Global.gameWon == 1:
		gameAudio = AudioManager.get_node("earlySuccessTransition")
	else:
		gameAudio = AudioManager.get_node("earlyTransition")
		
	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	if currentBeat != lastBeat:
		print(currentBeat)
		lastBeat = currentBeat
		if currentBeat >= 4 and currentBeat < gameLengthBeats:
			Show()
		elif currentBeat >= gameLengthBeats:
			Hide()
		else:
			Hide()
