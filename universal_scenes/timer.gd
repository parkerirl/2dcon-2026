extends Control

# Called when the node enters the scene tree for the first time.
#if gamelengthbeats <= 8 , show timer
#advance timer graphic on every beat
'''
var timerShow: float = 0.0

func _ready() -> void:
	get_tree().node_added.connect(_on_node_added)

func _on_node_added(node: Node) -> void:
	if node.get_parent() == get_tree().root and node != self:
		_on_scene_loaded.call_deferred(node)

func _on_scene_loaded(currentScene: Node2D) -> void:
	print("A new scene has completely loaded: ", currentScene.name)
	self.visible = false
	
	if "gameLengthBeats" in currentScene:
		if currentScene.gameLengthBeats == 16:
			print("16 beat game")
		elif currentScene.gameLengthBeats == 8:
			print("8 beat game")
			self.visible = true
		#timerShow = currentScene.currentBeat
		print(currentScene.gameLengthBeats)
		#if timerShow == 8:
		#	self.visible = true
		#print(timerShow)
		
	else:
		print("No game length found.")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
'''
