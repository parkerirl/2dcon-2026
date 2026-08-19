extends Area2D

func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		print("test 1")
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("test 2")
			
			#if(guyState > 0 and guyState < 3):
		#		guyState -= 1
