extends Node2D

@onready var alienScene = preload("res://alien.tscn")

func _ready():
	createArmy()
	
func createArmy(width: int = 11):
	for j in range(5):
		for i in range(width):
			var newAlien = alienScene.instantiate()
			newAlien.position = Vector2(20 + i*15, 20 + j * 10)
			add_child(newAlien)
