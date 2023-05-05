extends Spawner2D


func spawn(reference = spawn_scene):
	var bomb = super(reference)
	bomb.get_parent().remove_child(bomb)
	get_tree().root.find_child("Bombs", true, false).add_child(bomb)
	bomb.explode()
