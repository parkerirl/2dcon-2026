extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"): # Escape key by default
		toggle_pause()

func toggle_pause() -> void:
	var new_state : bool = !get_tree().paused
	get_tree().paused = new_state
	
	# Optional: Show/hide your Pause Menu UI
	$PauseMenu.visible = new_state 
