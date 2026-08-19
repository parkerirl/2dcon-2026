extends Node2D

var selected: bool = false
var mouse_offset: Vector2 = Vector2.ZERO

var goal_reached: bool = false

func _input(event: InputEvent) -> void:
	if goal_reached == false:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var sprite_rect = $Sprite2D.get_rect()
				var global_rect = Rect2(
					$Sprite2D.global_position - sprite_rect.size / 2,
					sprite_rect.size
				)
				
				global_rect = global_rect.grow(32.0)
				
				if global_rect.has_point(event.position):
					selected = true
					mouse_offset = global_position - event.position
			else:
				selected = false

		elif event is InputEventMouseMotion and selected:
			global_position = event.position + mouse_offset

func _process(_delta: float) -> void:
	if goal_reached == false:
		
		# CHECK IF TOUCHING GOAL
		
		var player_rect = Rect2(
			$Sprite2D.global_position - $Sprite2D.get_rect().size / 2,
			$Sprite2D.get_rect().size
		)
		player_rect = player_rect.grow(32.0)

		var goal_rect = Rect2(
			$"../Goal".global_position - $"../Goal".get_rect().size / 2,
			$"../Goal".get_rect().size
		)
		goal_rect = goal_rect.grow(32.0)

		if player_rect.intersects(goal_rect):
			goal_reached = true
			AudioManager.get_node("sfx_win").play()
			Global.gameWon = 1
			
			
		# CHECK IF TOUCHING wall
		var polygon = $"../Maze1"

		# Convert the Polygon2D's local points to global coordinates
		var global_polygon: PackedVector2Array = PackedVector2Array()

		for point in polygon.polygon:
			global_polygon.append(polygon.to_global(point))

		# Convert the player's rectangle into a polygon
		var player_polygon := PackedVector2Array([
			player_rect.position,
			player_rect.position + Vector2(player_rect.size.x, 0),
			player_rect.position + player_rect.size,
			player_rect.position + Vector2(0, player_rect.size.y)
		])

		# Check for intersection
		var intersection = Geometry2D.intersect_polygons(
			player_polygon,
			global_polygon
		)

		if not intersection.is_empty():
			goal_reached = true
			$"../jumpscare".visible = true
			Global.gameWon = 0
			AudioManager.get_node("sfx_scream").play()
			
