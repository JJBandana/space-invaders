extends Node2D

@onready var background = $Background

var sum = 0

func _process(delta):
	sum += 0.4
	background.region_rect = Rect2(sum, sum, 256, 244)
