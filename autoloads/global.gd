extends Node

var game_data: GameData
var level_size: Vector2
var player: Entity
var game_over_screen: PackedScene = load("res://ui/game_over_screen.tscn")
var victory_screen: PackedScene = load("res://ui/victory_screen.tscn")
var menus: CanvasLayer
var player_world: PackedScene = load("res://world/player_world.tscn")
var observer_world: PackedScene = load("res://world/observer_world.tscn")
var world: World
var creatures = ["cricket", "frog", "snake", "eagle"]

func load_world_with_player():
	transition_to(player_world)


func load_world_with_observer():
	transition_to(observer_world)


func transition_to(scene: PackedScene):
	get_tree().paused = false
	get_tree().change_scene_to_packed(scene)


func change_player_data(new_data: EntityData):
	player.change_data(new_data)


func change_player_objective(new_objective: Objective):
	player.change_objective(new_objective)


func game_over():
	var instance = game_over_screen.instantiate()
	menus.add_child(instance)


func victory():
	player._spawn_baby()
	player.queue_free()
	var instance = victory_screen.instantiate()
	menus.add_child(instance)
