extends Area2D

var direction
@export var speed = 15.0

func _physics_process(delta):
	position += direction * speed

func _on_body_entered(enemy):
	if not enemy.is_dead:
		enemy.kill()
		queue_free()
