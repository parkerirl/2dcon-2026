extends Node2D

var lastBeat: int = -1
var spritesToTween: Array[Node]
var frameDuration: float = 0.0
var instructionText = UI.get_node("instructions")
@export var stage1Games: Array[PackedScene] = []
var gamePool: Array = []
var lastPick = null

var gameAudio = AudioManager.get_node("earlyTransition")

var gameLengthBeats: int = 8

var nextGame: PackedScene
var temp 
var gameInstructions

var spedUp: bool = false

func PrepareMicrogame() -> void:
	if gamePool.is_empty():
		gamePool = stage1Games.duplicate()
	if lastPick != null and gamePool.size() > 1:
		gamePool.erase(lastPick)
	nextGame = gamePool.pick_random()
	lastPick = nextGame
	
	temp = nextGame.instantiate()
	gameInstructions = temp.instructions
	instructionText.clear()
	instructionText.append_text("[shake rate=12.0 level=18.0 connected=0]" + gameInstructions + "[/shake]")
	print (gameInstructions)

func MicrogameTransition() -> void:
	temp.queue_free()
	get_tree().change_scene_to_packed(nextGame)

func _ready() -> void:
	spedUp = false
	if Global.gameWon == 0:
		gameAudio = AudioManager.get_node("earlyFailTransition")
	elif Global.gameWon == 1:
		gameAudio = AudioManager.get_node("earlySuccessTransition")
	else:
		gameAudio = AudioManager.get_node("earlyTransition")
	#if Global.streak == 10:
	if Global.streak == 2:
		gameAudio = AudioManager.get_node("speedupTransition")
		#Global.gameTimeScaleFactor = Global.gameTimeScaleFactor * 1.1
		spedUp = true
		Global.streak = 0
	
	#NOTES: Engine.time_scale speeds up everything evenly but audio,
	#audio runs on its own server and must be controlled with pitch_scale.
	Engine.time_scale = Global.gameTimeScaleFactor
	gameAudio.pitch_scale = Global.gameTimeScaleFactor
	gameAudio.play()
	
	frameDuration = 60 / Global.bpm
	spritesToTween = $layout/animatedSprites.get_children()
	
	PrepareMicrogame()
	Global.streak += 1
	
	#Set sprite fps to length of a single beat of the current bpm
	for sprite in spritesToTween:
		sprite.sprite_frames.set_animation_speed("default", 1.0 / frameDuration)

func _physics_process(_delta: float) -> void:
	
	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	
	#ANIMATION EXECUTION--------------------------
	if currentBeat != lastBeat:
		lastBeat = currentBeat
		if lastBeat >= gameLengthBeats:
			if spedUp == true:
				Global.gameTimeScaleFactor = Global.gameTimeScaleFactor * 1.1
				get_tree().reload_current_scene()
			else:
				MicrogameTransition()
		
		for sprite in spritesToTween:
			var scaleTween = create_tween().set_parallel(true)
			scaleTween.tween_property(sprite, "scale", Vector2(1.05, 1.05), 0.1) \
				.set_trans(scaleTween.TRANS_CIRC).set_ease(scaleTween.EASE_OUT)
			scaleTween.chain().tween_property(sprite, "scale", Vector2(1.0, 1.0), 0.15) \
				.set_trans(scaleTween.TRANS_SINE).set_ease(scaleTween.EASE_OUT)
