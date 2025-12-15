extends Area2D

var direction: Vector2
var speed = 1000.0

func _ready() -> void:
	var mouse_position = get_global_mouse_position()
	direction = $"../Player".global_position.direction_to(mouse_position)
	rotation = direction.angle()
	
func _process(delta: float) -> void:
	global_position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	queue_free()
	body.queue_free()
		
