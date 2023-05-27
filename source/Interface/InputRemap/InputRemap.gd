extends Control

const CONTROL_SETTINGS_FILE_PATH = "user://control_settings.json"


func _on_back_button_pressed():
	save_input_settings()
	get_tree().change_scene_to_file("res://Screens/MainMenu.tscn")


func save_input_settings():
	var file = FileAccess.open(CONTROL_SETTINGS_FILE_PATH, FileAccess.WRITE)
	var dictionary = {}
	for child in $RemappingControl.get_children():
		var action = child.get_child(0).binding_action
		dictionary[action] = InputMap.action_get_events(action)[0].physical_keycode
	file.store_string(JSON.stringify(dictionary))
