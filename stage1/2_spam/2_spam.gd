extends Node2D

var lastBeat: int = -1
var frameDuration: float = 60 / Global.bpm
var gameAudio: Node = AudioManager.get_node("level1_spam")
var gameLengthBeats: int= 8

@export var instructions: String = "Delete Spam!"

const EMAIL_SCENE = preload("res://stage1/2_spam/email.tscn")

var emailCount: int = 0

var emailObjects = []

var emailLocations: Array[Vector2] = [
	Vector2(100.0, 200.0),
	Vector2(100.0, 350.0),
	Vector2(100.0, 500.0),
	Vector2(100.0, 650.0),
	Vector2(100.0, 800.0)
]

var emailText: Array[String] = [
	"[b]IMPORTANT OFFER!!1[/b] - We have been trying to contact you about an incredible offer!! We are giving...",
	"[b]Hot Single Gamers In Your Area[/b] - These Gamers Are Ready 2 Play With You <3<3<3<3...",
	"[b]you wont BELIEVE what these celebs look like now[/b] - These Are The Top 10 Skincare Techniques YOur...",
	"[b]Generate YOUR ART with AI[/b] - These new AI models are BETTER thAn human ART says Experts...",
	"[b]TO WHOM IT MAY CONCERN[/b] - I AM A PRINCE LOOKING TO GIVE AWAY MY FORTUNES AND GEMS TO AN HONORABLE HEIR...",
	"[b]Reschedule meeting[/b] - Sorry, Friday doesn't work for me: can we do next Monday instead? I will be...",
	"[b]IT ticket created[/b] - Your IT ticket #67000 has been created and will be serviced. We will contact you...",
	"[b]Vacation photos[/b] - Hey, I found some pics from that trip last summer, can you let me know which ones...",
	"[b]2DCon Game Jam Deadline[/b] - We should probably work on our game, the deadline is coming up...",
	"[b]Annual Performance Review[/b] - We need to discuss your work ethic, you've been gaming on the job...",
	"[b]Dinner Reservation[/b] - Success! Your have booked a reservation for the Eraflure Cafe at 7:00 PM...",
]
# BAD: 0, 1, 2, 3, 4
# GOOD: 5, 6, 7, 8, 9, 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = Global.gameTimeScaleFactor
	gameAudio.pitch_scale = Global.gameTimeScaleFactor
	gameAudio.play()

	Global.gameWon = 0
	
	var shuffledEmailIndex = range(0, 10)
	shuffledEmailIndex.shuffle()
	
	for i in 5:
		spawn_email(emailLocations.pop_back(), shuffledEmailIndex[i])

func TransitionBack() -> void:
	if Global.gameWon != 1:
		Global.gameWon = 0
	var nextGame: PackedScene = load("res://universal_scenes/game_transition.tscn")
	var temp = nextGame.instantiate()
	temp.queue_free()
	get_tree().change_scene_to_packed(nextGame)
	
func spawn_email(emailLocation, index):
	var email_copy = EMAIL_SCENE.instantiate()
	
	email_copy.set_text(emailText[index])
	email_copy.global_position = global_position + emailLocation
	add_child(email_copy)
	if index in [0, 1, 2, 3, 4]:
		email_copy.set_junk(true)
		emailCount += 1
	emailObjects.append(email_copy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Global.gameWon == -2:
		for i in emailObjects:
			i.disable()
		
	var noJunk = true	
	for i in emailObjects:
		if i.get_junk() == true:
			noJunk = false
			break
	if noJunk == true:
		Global.gameWon = 1
	
	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	if currentBeat != lastBeat:
		lastBeat = currentBeat
		if lastBeat >= gameLengthBeats:
			TransitionBack()
