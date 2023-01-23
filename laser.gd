extends Area2D

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player")

var speed = 180

func _ready():
	player.can_shoot = false

func _physics_process(delta):
	position.y -= speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.explode()
		queue_free()

func _on_tree_exiting():
	player.can_shoot = true
