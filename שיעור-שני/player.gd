extends CharacterBody2D

@export var speed = 400.0

func _process(_delta):
	var direction = Input.get_vector(&"left", &"right", &"up", &"down").normalized()
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed(&"shoot"):
		var bullet = load("res://bullet.tscn").instantiate()
		get_tree().current_scene.add_child(bullet)
		bullet.global_position = global_position


func _on_speed_powerup_timer_timeout() -> void:
	speed = 400.0
