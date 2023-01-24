extends CharacterBody2D

@export var speed : int = 200

@onready var laser = preload("res://laser.tscn")

var direction
var can_shoot = true
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)

func _process(_delta):
	
	if Input.is_action_just_pressed("fire") && can_shoot:
		shoot()
	
	direction = Input.get_axis("left", "right")
	
	velocity.x = direction * speed
	
	position.x = clamp(position.x, 0 + 10, screen_size.x - 10)
	
	move_and_slide()
	
func shoot():
	var laserNode = laser.instantiate()
	laserNode.position = $Marker2D.global_position
	get_parent().add_child(laserNode)
	
