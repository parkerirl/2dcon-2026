extends Node2D

var selected:bool = false
var mouse_offset = Vector2(0, 0)

func _ready() -> void:
	selected = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if selected:
		followMouse()
		
func followMouse():
	position = get_global_mouse_position() + mouse_offset
	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		print("test")
		if event.is_pressed():
			mouse_offset = position - get_global_mouse_position()
			selected = true
		else:
			selected = false
