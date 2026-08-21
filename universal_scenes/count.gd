extends RichTextLabel

var lastBeat: int = -1
var frameDuration: float = 0.0
var gameAudio
var gameLengthBeats: int = 8

func _ready() -> void:
	pivot_offset = size / 2

func Show() -> void:
	self.visible = true
	var countTween = create_tween()
	countTween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.8) \
		.set_trans(countTween.TRANS_EXPO).set_ease(countTween.EASE_OUT)
	countTween.chain().tween_property(self, "scale", Vector2(1.0, 1.0), 0.8) \
		.set_trans(countTween.TRANS_EXPO).set_ease(countTween.EASE_OUT)
		
func Hide() -> void:
	self.visible = false
		
func _physics_process(_delta: float) -> void:
	if Global.gameWon == 0:
		gameAudio = AudioManager.get_node("earlyFailTransition")
	elif Global.gameWon == 1:
		gameAudio = AudioManager.get_node("earlySuccessTransition")
	else:
		gameAudio = AudioManager.get_node("earlyTransition")

	var time = gameAudio.get_playback_position() + AudioServer.get_time_to_next_mix() - AudioServer.get_output_latency()
	var currentBeat = floori(time * (Global.bpm / 60.0))
	if currentBeat != lastBeat:

		lastBeat = currentBeat

		if currentBeat == 4:
			Global.gameCount += 1
			Show()
			self.text = str(Global.gameCount)
		elif currentBeat >= 0 and currentBeat < gameLengthBeats:
			self.visible = true
		elif currentBeat >= gameLengthBeats:
			Hide()
		else:
			Hide()
