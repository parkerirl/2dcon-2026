extends Node2D

@export var instructions: String = "No laughing!"
@export var videos: Array[AnimatedSprite2D]
var videoToShow: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for sprite in videos:
		sprite.visible = false
		
	videoToShow = videos.pick_random()
	videoToShow.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
