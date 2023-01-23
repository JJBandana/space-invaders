extends CharacterBody2D

@export var speed : int = 200

@onready var laser = preload("res://laser.tscn")

var direction
var can_shoot = true

func _process(_delta):
	
	if Input.is_action_just_pressed("fire") && can_shoot:
		shoot()
	
	direction = Input.get_axis("left", "right")
	
	velocity.x = direction * speed
	
	move_and_slide()
	
func shoot():
	var laserNode = laser.instantiate()
	laserNode.position = $Marker2D.global_position
	get_parent().add_child(laserNode)
	
