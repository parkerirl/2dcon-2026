extends Node2D

var lastBeat: int = -1
var frameDuration: float = 60 / Global.bpm
var gameAudio: Node = AudioManager.get_node("level1_close")
var gameLengthBeats: int = 8

@export var instructions: String = "Close ads!"

const AD_SCENE = preload("res://stage1/6_close/ad.tscn")

var nodesClosed: int = 0
var adCount: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = Global.gameTimeScaleFactor
	gameAudio.pitch_scale = Global.gameTimeScaleFactor
	gameAudio.play()

	Global.gameWon = 0
	
	var shuffledEmailIndex = range(0, 10)
	shuffledEmailIndex.shuffle()
	
	adCount = [4, 5, 6].pick_random()
	
	for i in adCount:
		spawn_ad()

func TransitionBack() -> void:
	var nextGame: PackedScene = load("res://universal_scenes/game_transition.tscn")
	var temp = nextGame.instantiate()
	temp.queue_free()
	get_tree().change_scene_to_packed(nextGame)
	
func spawn_ad():
	var ad_copy = AD_SCENE.instantiate()
	
	ad_copy.global_position = global_position + Vector2(randf_range(200, 1300),randf_range(200, 1000))
	add_child(ad_copy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.gameWon != 1:
		if nodesClosed == adCount:
			AudioManager.get_node("sfx_win").play()
			Global.gameWon = 1
	
	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	if currentBeat != lastBeat:
		lastBeat = currentBeat
		if lastBeat >= gameLengthBeats:
			TransitionBack()
