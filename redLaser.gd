extends Area2D

func _process(delta):
	position.y += 100 * delta

func _on_body_entered(body):
	if body is Player:
		body.die()

func explotion():
	set_process(false)
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("explotion")
	await get_tree().create_timer(0.5).timeout
	queue_free()
