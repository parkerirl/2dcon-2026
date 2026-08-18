extends Node2D

var lastBeat: int = -1
var spritesToTween: Array[Node]
var frameDuration: float = 0.0
var instructionText = UI.get_node("instructions")
@export var stage1Games: Array[PackedScene] = []

var gameAudio = AudioManager.get_node("earlyTransition")

var gameLengthBeats: int = 8

var nextGame: PackedScene
var temp 
var gameInstructions

func PrepareMicrogame() -> void:
	nextGame = stage1Games.pick_random()
	temp = nextGame.instantiate()
	gameInstructions = temp.instructions
	instructionText.clear()
	instructionText.append_text("[shake rate=12.0 level=18.0 connected=0]" + gameInstructions + "[/shake]")
	print (gameInstructions)

#Controls the transition to each microgame
func MicrogameTransition() -> void:

	#await get_tree().create_timer(2.0).timeout
	temp.queue_free()
	get_tree().change_scene_to_packed(nextGame)
	
	#get gamewon boolean, if won, play win state, then play normal transition
	#if lost, remove 1 life, play lose state, then play normal transition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		
	if Global.gameWon == 0:
		gameAudio = AudioManager.get_node("earlyFailTransition")
	elif Global.gameWon == 1:
		gameAudio = AudioManager.get_node("earlySuccessTransition")
	else:
		gameAudio = AudioManager.get_node("earlyTransition")
	
	#NOTES: Engine.time_scale speeds up everything evenly but audio,
	#audio runs on its own server and must be controlled with pitch_scale.
	Engine.time_scale = Global.gameTimeScaleFactor
	gameAudio.pitch_scale = Global.gameTimeScaleFactor
	gameAudio.play()
	frameDuration = 60 / Global.bpm
	
	spritesToTween = $animatedSprites.get_children()
	
	PrepareMicrogame()
	
	#Set sprite fps to length of a single beat of the current bpm
	for sprite in spritesToTween:
		sprite.sprite_frames.set_animation_speed("default", 1.0 / frameDuration)
	
	#MicrogameTransition()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	
	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	
	
	#ANIMATION EXECUTION--------------------------
	if currentBeat != lastBeat:
		lastBeat = currentBeat
		if lastBeat >= gameLengthBeats:
			MicrogameTransition()
		
		for sprite in spritesToTween:
			var scaleTween = create_tween().set_parallel(true)
			scaleTween.tween_property(sprite, "scale", Vector2(1.05, 1.05), 0.1) \
				.set_trans(scaleTween.TRANS_CIRC).set_ease(scaleTween.EASE_OUT)
			scaleTween.chain().tween_property(sprite, "scale", Vector2(1.0, 1.0), 0.15) \
				.set_trans(scaleTween.TRANS_SINE).set_ease(scaleTween.EASE_OUT)
