extends Node

var game_data: GameData
var level_size: Vector2
var player: Entity


func transition_to(scene: PackedScene):
	get_tree().paused = false
	get_tree().change_scene_to_packed(scene)


func change_player_data(new_data: EntityData):
	player.change_data(new_data)


func change_player_objective(new_objective: Objective):
	player.change_objective(new_objective)



