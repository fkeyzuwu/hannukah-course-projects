extends CharacterBody2D

@export var speed = 350.0
@export var gravity = 60.0
@export var jump_force = 1000.0

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * speed
	velocity.y += gravity
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	move_and_slide()
	
