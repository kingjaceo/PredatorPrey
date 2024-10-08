class_name PlayerSpawner
extends Node

@export var player_scene: PackedScene
@export var spawn_position: Vector2

func _ready():
	if spawn_position == Vector2.ZERO:
		spawn_position = Global.level_size / 2
	if player_scene:
		var player = player_scene.instantiate()
		player.position = spawn_position
		add_child(player)
