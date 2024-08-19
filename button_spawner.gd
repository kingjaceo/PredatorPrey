class_name ButtonSpawner
extends Spawner


func _ready():
	pass


func _spawn_new_scene():
	var new_instance = scene.instantiate()
	var new_position = Vector2(randf_range(0, Global.level_size.x), randf_range(0, Global.level_size.y))
	new_instance.position = new_position
	Global.world.add_child(new_instance)
