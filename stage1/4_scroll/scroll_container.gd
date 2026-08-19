extends ScrollContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_scroll_changed(value: float) -> void:
	var scrollbar := get_v_scroll_bar()

	if value >= scrollbar.max_value - 1.0:
		print("Reached the bottom!")
