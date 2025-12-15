extends CharacterBody2D

@export var speed = 100.0
@onready var speed_powerup_timer = $SpeedPowerupTimer
@onready var speed_powerup_audio = $SpeedPowerupAudio

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	
	if direction:
		$AnimatedSprite2D.play("walk")
		
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("idle")
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = load("res://player_bullet.tscn").instantiate()
		bullet.position = position
		var mouse_position = get_global_mouse_position()
		var bullet_direction = position.direction_to(mouse_position)
		bullet.rotation = bullet_direction.angle()
		bullet.direction = bullet_direction
		get_tree().current_scene.add_child(bullet)
		$ShootAudio.play()
	
	move_and_slide()

func _on_speed_powerup_timer_timeout():
	speed = 300.0
