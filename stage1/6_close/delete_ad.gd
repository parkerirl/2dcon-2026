extends TextureButton

func _on_button_down() -> void:
	get_parent().get_parent().nodesClosed += 1
	
	get_parent().queue_free()
	AudioManager.get_node("sfx_click").play()
	
