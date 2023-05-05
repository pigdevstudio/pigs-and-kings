extends Node2D

@export var initial_direction = -1

@onready var body = $BumpingEnemy2D
@onready var animation_player = $AnimationPlayer
@onready var sprites = $BumpingEnemy2D/AnimatedSprite2D

enum STATES{RUN, IDLE, DROP, DEAD}

var state = STATES.RUN

func _ready():
	body.direction = initial_direction


func _physics_process(delta):
	if body.direction > 0:
		sprites.flip_h = true
	elif body.direction < 0:
		sprites.flip_h = false

	match state:
		STATES.IDLE:
			sprites.play("idle")
		STATES.RUN:
			sprites.play("run")
		STATES.DROP:
			body.direction = 0
			body.set_physics_process(false)
			set_physics_process(false)
		STATES.DEAD:
			body.direction = 0
			body.set_physics_process(false)
			set_physics_process(false)


func die():
	animation_player.play("die")
	state = STATES.DEAD


func _on_vision_area_2d_area_entered(area):
	animation_player.play("drop_bomb")
	state = STATES.DROP


func _on_hurt_area_2d_hurt(damage):
	die()
