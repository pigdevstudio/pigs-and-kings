extends Node2D

@export var health = 3

@onready var animation_player = $AnimationPlayer



func _on_hurt_box_2d_hurt(damage):
	health -= damage
	if health < 1:
		animation_player.play("break")
	else:
		animation_player.play("hit")
	
