extends TextureButton

func _on_button_down() -> void:
	print("pressed!")
	get_parent().visible = false
	disabled = true
	AudioManager.get_node("sfx_win").play()
	Global.gameWon = 1
