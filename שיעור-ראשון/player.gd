extends CharacterBody2D

func _ready():
	print("godot")
	print("shalom kita")
	position.x = 586
	position.y = 286

func _physics_process(delta):
	if Input.is_action_pressed("right"): 
		position.x += 5
	
	if Input.is_action_pressed("left"): 
		position.x -= 5
