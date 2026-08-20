extends Node2D

var lastBeat: int = -1
var frameDuration: float = 60 / Global.bpm
var gameAudio: Node = AudioManager.get_node("level1_ratio")
var gameLengthBeats: int= 8

@export var instructions: String = "Ratio!"

#@export var player: Sprite2D

var questions = [
	"Q: How can I fix my marriage?",
	"Q: HELP! Minecraft is SUPER LAGGY!!!?",
	"Q: need advice - my AI art looks bad???",
	"Q: How can I make a game in Godot?"
]
var answers = [
	"A: Stop spending all ur $$$ on video games and get a JOB!!!!",
	"A: You need to download more dedicated RAM.",
	"A: Just give up, it worked for me",
	"A: I have no idea"
]
	

var selected_q: String
var selected_a: String
var counter: int
var sign: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = Global.gameTimeScaleFactor
	gameAudio.pitch_scale = Global.gameTimeScaleFactor
	gameAudio.play()

	Global.gameWon = 0
	
	selected_q = questions.pick_random()
	selected_a = answers.pick_random()
	
	$"question".text = selected_q
	$"answer".text = selected_a
	
	counter = [-8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8].pick_random()
	sign = "+"
	if counter < 0:
		sign = ""
	$"count".text = "{s}{c}".format({"s":sign, "c":counter})

func TransitionBack() -> void:
	var nextGame: PackedScene = load("res://universal_scenes/game_transition.tscn")
	var temp = nextGame.instantiate()
	temp.queue_free()
	get_tree().change_scene_to_packed(nextGame)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	sign = "+"
	if counter < 0:
		sign = ""
	$"count".text = "{s}{c}".format({"s":sign, "c":counter})
	
	if counter == 0:
		if Global.gameWon != 1:
			AudioManager.get_node("sfx_win").play()
			Global.gameWon = 1
	else:
		if Global.gameWon == 1:
			AudioManager.get_node("sfx_fail").play()
		Global.gameWon = 0
	
	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	if currentBeat != lastBeat:
		lastBeat = currentBeat
		if lastBeat >= gameLengthBeats:
			TransitionBack()


func _on_upvote_button_down() -> void:
	counter += 1


func _on_downvote_button_down() -> void:
	counter -= 1
