class_name Spawner
extends Node

@export var scene: PackedScene
@export var time_between_spawns_s: float = 2
@export var max_y: float
@export var max_x: float

func _ready():
	while true:
		_spawn_new_scene()
		await get_tree().create_timer(time_between_spawns_s).timeout


func _spawn_new_scene():
	var new_instance = scene.instantiate()
	var new_position = Vector2(randf_range(0, max_x), randf_range(0, max_y))
	new_instance.position = new_position
	add_child(new_instance)
