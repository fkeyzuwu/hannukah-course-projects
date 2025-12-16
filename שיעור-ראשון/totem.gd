extends Node2D

@export var speed = 50.0
var player_in_area = false

func _physics_process(delta):
	if player_in_area:
		var direction = position.direction_to(%Player.position)
		position += direction * speed * delta
		if direction.x > 0:
			$Sprite2D.flip_h = true
		elif direction.x < 0:
			$Sprite2D.flip_h = false

func _on_player_detection_area_body_entered(body):
	player_in_area = true

func _on_body_entered(body):
	get_tree().reload_current_scene.call_deferred()
