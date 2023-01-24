extends Area2D

func _process(delta):
	position.y += 100 * delta

func _on_body_entered(body):
	if body is Player:
		body.die()
