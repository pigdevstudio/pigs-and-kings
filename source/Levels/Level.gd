extends Node2D

@onready var player = $PlayerCharacter2D
@onready var fade = $Overlay/Fade/AnimationPlayer


func _ready():
	fade.play("fade_in")
	if TeleportData.teleport_back:
		var portal = find_child(TeleportData.target_portal_name)
		portal.teleport_in(player)


func _on_door_player_entered():
	fade.play("fade_out")
	await fade.animation_finished
	TeleportData.current_portal.teleport_out()
