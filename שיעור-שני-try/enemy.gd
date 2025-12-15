extends CharacterBody2D

@export var speed = 100.0
@onready var player = $"../Player"
@export_custom(PROPERTY_HINT_NONE, "", PROPERTY_USAGE_READ_ONLY | PROPERTY_USAGE_EDITOR) var is_dead = false

func _physics_process(_delta):
	if player == null or is_dead:
		return
	
	var direction = position.direction_to(player.position)
	velocity = direction * speed
	
	if direction:
		$AnimatedSprite2D.play("walk")
		
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	body.queue_free()

func kill():
	if is_dead:
		return
	
	$CollisionShape2D.disabled = true
	$Area2D.monitoring = false
	$Area2D.monitorable = false
	$DieSound.play()
	is_dead = true
	$AnimatedSprite2D.play("die")
	await $AnimatedSprite2D.animation_finished
	queue_free()
