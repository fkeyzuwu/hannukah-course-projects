class_name Enemy extends CharacterBody2D

@export var speed = 200.0

func _process(_delta: float) -> void:
	var direction = global_position.direction_to($"../Player".global_position)
	velocity = direction * speed
	move_and_slide()
