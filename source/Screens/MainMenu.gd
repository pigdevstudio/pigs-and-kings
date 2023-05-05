extends Control

@export_file("*.tscn") var start_scene_path = "res://Levels/Level1.tscn"


func _ready():
	$StartButton.grab_focus()


func _on_start_button_pressed():
	get_tree().change_scene_to_file(start_scene_path)


func _on_continue_button_pressed():
	pass


func _on_quit_button_pressed():
	get_tree().quit()
