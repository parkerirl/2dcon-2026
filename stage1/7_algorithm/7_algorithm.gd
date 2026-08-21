extends Node2D

var lastBeat: int = -1
var frameDuration: float = 60 / Global.bpm
var gameAudio: Node = AudioManager.get_node("level1_algorithm")
var gameLengthBeats: int = 8

@export var instructions: String = "Odd one out!"

const PROD_SCENE = preload("res://stage1/7_algorithm/product.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = Global.gameTimeScaleFactor
	gameAudio.pitch_scale = Global.gameTimeScaleFactor
	gameAudio.play()

	Global.gameWon = 0
	
	var positions = [
		Vector2(300, 300),
		Vector2(900, 300),
		Vector2(1500, 300),
		Vector2(300, 700),
		Vector2(900, 700),
		Vector2(1500, 700),
	]
	positions.shuffle()
	
	var imgOrder = [1, 2, 3, 4, 5]
	imgOrder.shuffle()
	
	for i in 5:
		spawn_ad(positions[i], imgOrder[i])
	spawn_ad_bad(positions[5])

func TransitionBack() -> void:
	if Global.gameWon != 1:
		Global.gameWon = 0
		
	var nextGame: PackedScene = load("res://universal_scenes/game_transition.tscn")
	var temp = nextGame.instantiate()
	temp.queue_free()
	get_tree().change_scene_to_packed(nextGame)
	
func spawn_ad(pos, img):
	var prod_copy = PROD_SCENE.instantiate()
	prod_copy.global_position = global_position + pos
	
	prod_copy.set_image("res://stage1/7_algorithm/imgs1/good{i}.png".format({"i": img}))
	prod_copy.set_index(img)
	
	add_child(prod_copy)

func spawn_ad_bad(pos):
	var prod_copy = PROD_SCENE.instantiate()
	prod_copy.global_position = global_position + pos
	
	prod_copy.set_image("res://stage1/7_algorithm/imgs1/bad.png")
	prod_copy.set_index(5)
	
	add_child(prod_copy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	if currentBeat != lastBeat:
		lastBeat = currentBeat
		if lastBeat >= gameLengthBeats:
			TransitionBack()
