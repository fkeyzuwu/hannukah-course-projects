extends Area2D

func _on_body_entered(player: Node2D) -> void:
	player.speed = 1000.0
	$"../Player/SpeedPowerupTimer".start()
	queue_free()
