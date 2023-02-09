extends Node2D

@onready var alienScene = preload("res://alien.tscn")

var enemiesArray: Array = []
var goingLeft = false
var enemiesDead: int = 0

func _ready():
	createArmy()

func alienKilled():
	enemiesDead += 1
	print(enemiesDead)
	if enemiesDead % 5 == 0:
		$RunTimer.wait_time -= 0.1
		print($RunTimer.wait_time)

func createArmy(width: int = 11):
	for j in range(5):
		for i in range(width):
			var newAlien = alienScene.instantiate()
			newAlien.position = Vector2(20 + i*15, 20 + j * 10)
			add_child(newAlien)
			enemiesArray.append(newAlien)
			newAlien.army = self
	print(enemiesArray)

func timerOn():
	$ShootTimer.start()
	$RunTimer.start()

func timerOff():
	$ShootTimer.stop()
	$RunTimer.stop()

func selectShoot():
	if enemiesArray:
		var random_int : int = randi() % enemiesArray.size()
		var random_alien = enemiesArray[random_int]
		if is_instance_valid(random_alien):
			random_alien.shoot()

func _on_shoot_timer_timeout():
	selectShoot()

func _on_run_timer_timeout():
	if position.x < 65 && !goingLeft:
		position.x += 2
	elif position.x >= 65 && !goingLeft:
		position.y += 2
		goingLeft = true
	elif position.x > 0 && goingLeft:
		position.x -= 2
	elif position.x <= 0 && goingLeft:
		position.y += 2
		goingLeft = false
