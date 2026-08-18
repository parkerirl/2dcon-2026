extends CanvasLayer

@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	progress_bar.max_value = timer.wait_time
	timer.start()

func _process(_delta: float) -> void:
	progress_bar.value = timer.time_left
	print(timer.time_left)
