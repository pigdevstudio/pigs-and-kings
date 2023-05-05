class_name Spawner2D
extends Node2D

signal spawned(spawn)
@export var spawn_scene: PackedScene

func spawn(reference = spawn_scene):
	var spawn = reference.instantiate()
	add_child(spawn)
	# Prevents that the Spawner's transform affects its children
	spawn.top_level = true
	spawn.global_position = global_position
	spawned.emit(spawn)
	return spawn
