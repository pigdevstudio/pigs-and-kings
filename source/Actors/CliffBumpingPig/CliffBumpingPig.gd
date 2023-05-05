extends Node2D

@export var initial_direction = -1
@export var max_health = 3

@onready var body = $BumpingEnemy2D
@onready var animation_player = $AnimationPlayer
@onready var sprites = $BumpingEnemy2D/Sprites
@onready var animated_sprites = $BumpingEnemy2D/Sprites/AnimatedSprite2D
@onready var cliff_detector = $BumpingEnemy2D/CliffDetector
@onready var ray = $BumpingEnemy2D/CliffDetector/RayCast2D

@onready var health = max_health

enum STATES{RUN, IDLE, DEAD, CLIFF}

var state = STATES.RUN

func _ready():
	body.direction = initial_direction


func _physics_process(delta):
	if body.direction > 0:
		sprites.scale.x = -1
	elif body.direction < 0:
		sprites.scale.x = 1
	
	match state:
		STATES.IDLE:
			animated_sprites.play("idle")
		STATES.RUN:
			animated_sprites.play("run")
		STATES.CLIFF:
			animation_player.play("cliff")
		STATES.DEAD:
			body.direction = 0
	
	if not ray.is_colliding():
		state = STATES.CLIFF

func die():
	animation_player.play("die")
	state = STATES.DEAD


func hit(damage):
	health -= damage
	if health >= 1:
		animation_player.play("hit")
	else:
		die()


func _on_hurt_area_2d_hurt(damage):
	hit(damage)


func _on_animated_sprite_2d_animation_finished():
	match animated_sprites.animation:
		"hit":
			state = STATES.RUN


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "cliff":
		state = STATES.RUN
		set_physics_process(true)


func _on_bumping_enemy_2d_bumped():
	cliff_detector.scale.x *= -1
