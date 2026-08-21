extends TextureButton

@export var junk:bool = false
func _ready() -> void:
	junk = false

func _on_button_down() -> void:
	
	if junk == false:
		AudioManager.get_node("sfx_fail").play()
		Global.gameWon = -2
	else:
		junk = false
	
	get_parent().visible = false
	disabled = true
	AudioManager.get_node("sfx_click").play()
	
