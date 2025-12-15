extends Sprite2D

var move_speed_x = randf_range(50.0, 75.0)
var move_speed_y = randf_range(20.0, 30.0)
var x_direction = 1
var y_direction = 1

func _ready() -> void:
	$AnimationPlayer.play(&"spawn")

func _process(delta: float) -> void:
	global_position.x += x_direction * move_speed_x * delta
	global_position.y += y_direction * move_speed_y * delta
	
	if global_position.x >= 1000:
		x_direction = -1
	elif global_position.x <= 100:
		x_direction = 1
	
	if global_position.y >= 400:
		y_direction = -1
	elif global_position.y <= 350:
		y_direction = 1
	
