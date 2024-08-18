class_name GameData
extends Resource

@export var money: int = 10000:
	set(value):
		money = value
		money_changed.emit()

#var objectives: Array[Objective]
var buildings_destroyed: int = 0
var aid_delivered: int = 0
@export var tutorial_active: bool = true
@export var contract_capacity: int = 1


signal money_changed
signal planes_updated
signal contracts_updated
signal objectives_updated


func _on_building_destroyed():
	money += 1000
	buildings_destroyed += 1


func _on_aid_delivered():
	aid_delivered += 1
