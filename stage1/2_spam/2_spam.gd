extends Node2D

var lastBeat: int = -1
var frameDuration: float = 60 / Global.bpm
var gameAudio: Node = AudioManager.get_node("level1_spam")
var gameLengthBeats: int= 8

@export var instructions: String = "Delete Spam!"

const EMAIL_SCENE = preload("res://stage1/2_spam/email.tscn")

var emailCount: int = 0

var emailLocations: Array[Vector2] = [
	Vector2(100.0, 200.0),
	Vector2(100.0, 350.0),
	Vector2(100.0, 500.0),
	Vector2(100.0, 650.0),
	Vector2(100.0, 800.0)
]

#@export var player: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = Global.gameTimeScaleFactor
	gameAudio.pitch_scale = Global.gameTimeScaleFactor
	gameAudio.play()

	Global.gameWon = 0
	
	for i in 5:
		spawn_email(emailLocations.pop_back())

func TransitionBack() -> void:
	var nextGame: PackedScene = load("res://universal_scenes/game_transition.tscn")
	var temp = nextGame.instantiate()
	temp.queue_free()
	get_tree().change_scene_to_packed(nextGame)
	
func spawn_email(emailLocation):
	var email_copy = EMAIL_SCENE.instantiate()
	
	
	
	email_copy.global_position = global_position + emailLocation
	print("spawn")	
	add_child(email_copy)
	
	
	emailCount += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	if currentBeat != lastBeat:
		lastBeat = currentBeat
		if lastBeat >= gameLengthBeats:
			TransitionBack()
