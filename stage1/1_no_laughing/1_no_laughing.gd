extends Node2D

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
	
	Global.gameWon = true
	inputDelay = [60, 75, 90, 120].pick_random()
	inputDelayCounter = 0
			
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if(guyState > 0 and guyState < 3):
				guyState -= 1
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
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
				
				inputDelay = [60, 75, 90, 120].pick_random()
				inputDelayCounter = 0
				
		elif(guyState == 2):
			if(random_int < 10):
				guyState = 3
				Global.gameWon = false
				
				inputDelay = [60, 75, 90, 120].pick_random()
				inputDelayCounter = 0
