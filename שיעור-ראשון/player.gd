extends CharacterBody2D

@export var speed = 100.0
@export var jump_force = 250.0
@export var gravity = 500.0

var coins = 0

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	
	# Move the player
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	# Animation
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("jump")
	
	move_and_slide()

func add_coin():
	coins += 1
	$Label.text = "Coins: " + str(coins)
	$CoinAudio.play()
