extends CharacterBody2D

class_name Alien

@onready var sprite = $Sprite
@onready var animation_player = $AnimationPlayer

@export var svalue : int = 2

func _ready():
	sprite.frame = svalue

func explode():
	$CollisionShape2D.set_deferred("disabled", true)
	animation_player.play("Die")
	
func delete():
	visible = false
