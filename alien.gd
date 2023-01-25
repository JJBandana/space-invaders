extends CharacterBody2D

class_name Alien

@onready var sprite = $Sprite
@onready var animation_player = $AnimationPlayer
@onready var redLaser = preload("res://redLaser.tscn")
@onready var marker = $Marker2D
@onready var parent = get_parent()

var army = null

var dead = false

@export var svalue : int = 0

func _ready():
	sprite.frame = svalue

func stopAnimation():
	if is_instance_valid(self):
		if animation_player.current_animation == "Die":
			queue_free()
	animation_player.stop()
	parent.timerOff()

func resumeAnimation():
	animation_player.play("Idle")
	parent.timerOn()

func explode():
	$CollisionShape2D.set_deferred("disabled", true)
	animation_player.play("Die")
	dead = true
	army.enemiesArray.erase(self)
	
func delete():
	visible = false
	
func shoot():
	var laserNode = redLaser.instantiate()
	laserNode.position = marker.global_position
	get_parent().get_parent().add_child(laserNode)
