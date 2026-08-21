extends Node2D

var lastBeat: int = -1
var frameDuration: float = 60 / Global.bpm
var gameAudio: Node = AudioManager.get_node("level1_laugh")
@export var gameLengthBeats: int = 16
var gameTimer: Node = UI.get_node("timer")
var timerAnimation: Node = UI.get_node("timer_animation")
var timerAnimationFrame: float = 1.0

@export var instructions: String = "No laughing!"
@export var videos: Array[AnimatedSprite2D]
var videoToShow: AnimatedSprite2D

@export var guy: AnimatedSprite2D
var guyState: int
var guyAnim: Array[String]
var guyPosition: Vector2
var originalPosition: Vector2

var inputDelay: int
var inputDelayCounter: int

@export var inputArea: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	Engine.time_scale = Global.gameTimeScaleFactor
	gameAudio.pitch_scale = Global.gameTimeScaleFactor
	gameAudio.play()
	
	timerAnimation.seek(1.0, true)
	timerAnimationFrame = 1.0
	
	for sprite in videos:
		sprite.visible = false
		
	videoToShow = videos.pick_random()
	videoToShow.visible = true
	
	guyPosition = guy.position
	originalPosition = guy.position
	
	guyState = 0
	guyAnim = ["default", "laugh_1", "laugh_2", "laugh_3"]
	# 0 = not laughing
	# 1 = laugh_1
	# 2 = laugh_2
	# 3 = laugh_3
	
	Global.gameWon = 1
	inputDelay = [60, 75, 90, 120].pick_random()
	inputDelayCounter = 0
			
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if(guyState > 0 and guyState < 3):
				guyState -= 1

func TransitionBack() -> void:
	var nextGame: PackedScene = load("res://universal_scenes/game_transition.tscn")
	var temp = nextGame.instantiate()
	temp.queue_free()
	get_tree().change_scene_to_packed(nextGame)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	if currentBeat != lastBeat:
		lastBeat = currentBeat
		
		timerAnimation.seek(timerAnimationFrame, true)
		
		if gameLengthBeats == 8:
			timerAnimation.play("timer_animation")
			var timerTween = create_tween().set_parallel(true)
			timerTween.tween_property(gameTimer, "modulate:a", 1.0, 0.5) \
				.set_trans(timerTween.TRANS_SINE).set_ease(timerTween.EASE_OUT)
		elif gameLengthBeats == 16:
			if currentBeat == 8:
				timerAnimation.play("timer_animation")
				var timerTween = create_tween().set_parallel(true)
				timerTween.tween_property(gameTimer, "modulate:a", 1.0, 0.5) \
					.set_trans(timerTween.TRANS_SINE).set_ease(timerTween.EASE_OUT)
		
		timerAnimationFrame += 1
		
		if lastBeat >= gameLengthBeats:
			gameTimer.modulate.a = 0.0
			timerAnimation.stop()
			timerAnimation.seek(1.0, true)
			TransitionBack()
	
	guy.play(guyAnim[guyState])
	
	if(guyState > 0 and guyState < 3):
		var offset = Vector2(
			randf_range(-0.5, 0.5),
			randf_range(-0.5, 0.5),
		)
		guy.position += offset
	else:
		guy.position = originalPosition
	
	inputDelayCounter += 1
	
	if(inputDelayCounter > inputDelay):
	
		# Generate a random int between 1-10 to trigger initial laugh state
		var random_int = randi_range(1, 100)
		
		if(guyState == 0):
			if(random_int < 20):
				guyState = 1
				
				inputDelay = [60, 75, 90, 120].pick_random()
				inputDelayCounter = 0
				
		elif(guyState == 1):
			if(random_int < 10):
				guyState = 2
				
				inputDelay = [30, 45, 60, 75, 90].pick_random()
				inputDelayCounter = 0
				
		elif(guyState == 2):
			if(random_int < 10):
				guyState = 3
				Global.gameWon = 0
				var sfxLaugh = AudioManager.get_node("sfx_laugh")
				sfxLaugh.pitch_scale = Global.gameTimeScaleFactor
				sfxLaugh.play()
				var sfxFail = AudioManager.get_node("sfx_fail")
				sfxFail.pitch_scale = Global.gameTimeScaleFactor
				sfxFail.play()
