extends PathFollow2D

@onready var timer = $Timer

func _on_timer_timeout():
	progress_ratio += 0.03
