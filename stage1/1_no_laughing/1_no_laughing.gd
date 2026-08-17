extends Node2D

@export var instructions: String = "No laughing!"
@export var videos: Array[AnimatedSprite2D]
var videoToShow: AnimatedSprite2D

@export var guy: AnimatedSprite2D
var guyState: int

var inputDelay: int
var inputDelayCounter: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for sprite in videos:
		sprite.visible = false
		
	videoToShow = videos.pick_random()
	videoToShow.visible = true
	
	guyState = 0
	guy.play("default")
	# 0 = not laughing
	# 1 = laugh_1
	# 2 = laugh_2
	# 3 = laugh_3
	
	Global.gameWon = true
	inputDelay = 60
	inputDelayCounter = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	inputDelayCounter += 1
	
	if(inputDelayCounter > inputDelay):
	
		# Generate a random int between 1-10 to trigger initial laugh state
		var random_int = randi_range(1, 100)
		
		if(guyState == 0):
			if(random_int < 20):
				guy.play("laugh_1")
				guyState = 1
				
		elif(guyState == 1):
			if(random_int < 10):
				guy.play("laugh_2")
				guyState = 2
				
		elif(guyState == 2):
			if(random_int < 10):
				guy.play("laugh_3")
				guyState = 3
				Global.gameWon = false
