extends Portal2D

signal player_entered

@onready var sprites = $AnimatedSprite2D


func _on_interacted():
	sprites.play("opening")



func _on_animated_sprite_2d_animation_finished():
	if sprites.animation == "opening":
		sprites.play("closing")
	elif sprites.animation == "closing":
		player_entered.emit()
