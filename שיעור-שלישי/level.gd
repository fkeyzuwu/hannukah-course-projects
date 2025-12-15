extends Node2D

var money = 0
var robot_income = 0
var robot_buy = 10

var update_timings: Array[float]

func _process(delta: float) -> void:
	for i in update_timings.size():
		var time = update_timings[i]
		time -= delta
		if time <= 0:
			add_robot_income()
			time = 1.0
		update_timings[i] = time
	
	$AddRobotButton.disabled = robot_buy > money

func _on_add_score_button_pressed() -> void:
	money += 1
	update_money_text()

func _on_add_robot_button_pressed() -> void:
	if money >= robot_buy:
		var robot = load("res://farming_robot.tscn").instantiate()
		add_child(robot)
		robot.global_position = Vector2(500, 500)
		money -= robot_buy
		update_timings.append(1.0)
		robot_buy = ceili(robot_buy * 1.15)
		$AddRobotButton.text = "קנה רובוט ב" + str(robot_buy) + " שקל"
		update_money_text()
		$AddRobotButton/BuyRobotSound.play()

func add_robot_income() -> void:
	money += 1
	update_money_text()

func update_money_text():
	$ScoreLabel.text = "Money: " + str(money)
