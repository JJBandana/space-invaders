extends Node2D

@onready var alienScene = preload("res://alien.tscn")

var enemiesArray: Array = []

func _ready():
	createArmy()
	
func createArmy(width: int = 11):
	for j in range(5):
		for i in range(width):
			var newAlien = alienScene.instantiate()
			newAlien.position = Vector2(20 + i*15, 20 + j * 10)
			add_child(newAlien)
			enemiesArray.append(newAlien)
			newAlien.army = self
	print(enemiesArray)

func selectShoot():
	if enemiesArray:
		var random_int = randi() % enemiesArray.size()
		var random_alien = enemiesArray[random_int]
		if is_instance_valid(random_alien):
			random_alien.shoot()


func _on_shoot_timer_timeout():
	selectShoot()
