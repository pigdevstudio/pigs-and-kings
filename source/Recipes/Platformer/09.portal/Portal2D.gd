class_name Portal2D
extends InteractiveArea2D

@export_file("*.tscn") var next_scene_path
@export var target_portal_name = "Portal2D"


func teleport_in(object):
	object.global_position = global_position


func teleport_out(next_scene = load(next_scene_path)):
	TeleportData.target_portal_name = target_portal_name
	TeleportData.teleport_back = true
	get_tree().change_scene_to_packed(next_scene)


func _on_interaction_available():
	TeleportData.current_portal = self
