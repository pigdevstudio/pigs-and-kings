extends Control

@export_file("*.tscn") var start_scene_path = "res://Levels/Level1.tscn"
@export_file("*.tscn") var controls_scene_path = "res://Interface/InputRemap/InputRemap.tscn"


func _ready():
	$StartButton.grab_focus()
	load_input_settings()


func load_input_settings():
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file(start_scene_path)


func _on_continue_button_pressed():
	pass


func _on_quit_button_pressed():
	get_tree().quit()


func _on_controls_button_pressed():
	get_tree().change_scene_to_file(controls_scene_path)
