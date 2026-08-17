extends RichTextLabel

func _ready() -> void:
	pivot_offset = size / 2
	Show()
	Hide()

func Show() -> void:
	await get_tree().create_timer(1.5).timeout
	var displayInstructionsTween = create_tween().set_parallel(true)
	displayInstructionsTween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.8) \
		.set_trans(displayInstructionsTween.TRANS_EXPO).set_ease(displayInstructionsTween.EASE_OUT)
	displayInstructionsTween.tween_property(self, "modulate:a", 1.0, 1.0) \
		.set_trans(displayInstructionsTween.TRANS_SINE).set_ease(displayInstructionsTween.EASE_OUT)
		
func Hide() -> void:
	await get_tree().create_timer(3.2).timeout
	var displayInstructionsTween = create_tween()
	displayInstructionsTween.tween_property(self, "modulate:a", 0.0, 0.5) \
		.set_trans(displayInstructionsTween.TRANS_SINE).set_ease(displayInstructionsTween.EASE_OUT)
