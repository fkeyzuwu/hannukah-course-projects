extends Area2D

func _on_body_entered(player):
	player.speed = 1000
	player.speed_powerup_timer.start()
	player.speed_powerup_audio.play()
	queue_free()
