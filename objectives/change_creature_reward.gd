class_name ChangeCreatureReward
extends Reward

@export var creature_data: EntityData
@export var next_objective: Objective


func receive():
	Global.change_player_data(creature_data)
	Global.change_player_objective(next_objective)
