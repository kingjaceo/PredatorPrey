extends Node

var game_data: GameData
var level_height: int
var level_width: int


func transition_to(scene: PackedScene):
	get_tree().paused = false
	get_tree().change_scene_to_packed(scene)
	#if not player:
		#player = player_scene.instantiate()
	#get_tree().root.add_child(player)
