extends Control

@export_file("*.tscn") var main_menu_scene_path = "res://Screens/MainMenu.tscn"

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = not visible
		get_tree().paused = not get_tree().paused
		$SaveButton.grab_focus()


func _on_save_button_pressed():
	pass


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file(main_menu_scene_path)


func _on_quit_button_pressed():
	# Save before quitting
	get_tree().quit()
