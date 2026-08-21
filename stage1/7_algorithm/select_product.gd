extends TextureButton

func _on_button_down() -> void:
	var index = get_parent().index
	
	if index != 5:
		AudioManager.get_node("sfx_fail").play()
		Global.gameWon = -2
	else:
		if Global.gameWon != -2:
			AudioManager.get_node("sfx_win").play()
			Global.gameWon = 1
	
	AudioManager.get_node("sfx_click").play()
	
	get_parent().queue_free()
