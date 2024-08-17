class_name Spawner
extends Node

@export var scene: PackedScene
@export var time_between_spawns_s: float = 2
@export var max_y: float
@export var max_x: float
@export var initial_population: int = 0

func _ready():
	for i in range(initial_population):
		_spawn_new_scene()
	if time_between_spawns_s <= 0: 
		return
	while true:
		await get_tree().create_timer(time_between_spawns_s).timeout
		_spawn_new_scene()


func _spawn_new_scene():
	var new_instance = scene.instantiate()
	var new_position = Vector2(randf_range(0, max_x), randf_range(0, max_y))
	new_instance.position = new_position
	add_child(new_instance)
