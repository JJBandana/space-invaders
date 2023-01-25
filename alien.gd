extends CharacterBody2D

class_name Alien

@onready var sprite = $Sprite
@onready var animation_player = $AnimationPlayer
@onready var redLaser = preload("res://redLaser.tscn")
@onready var marker = $Marker2D
@onready var parent = get_parent()

var army = null

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
	army.enemiesArray.erase(self)
	army.alienKilled()
	
func delete():
	visible = false
	
func shoot():
	var laserNode = redLaser.instantiate()
	laserNode.position = marker.global_position
	get_parent().get_parent().add_child(laserNode)

func lessEasy():
	if army.enemiesDead % 5 == 0:
		animation_player.playback_speed += 0.1
