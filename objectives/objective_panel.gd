class_name ObjectivePanel
extends PanelContainer

@export var contract: Objective
@onready var completion_reward_label = %Reward
@onready var contract_name_label = %ContractName
@onready var description_label = %Description
@onready var progress_label = %Progress

signal accepted


func _ready():
	contract_name_label.text = contract.name
	description_label.text = contract.description
	completion_reward_label.text = str(contract.completion_reward)
	
	if contract.accepted:
		_show_accepted()


func _on_accept():
	_show_accepted()
	contract.accept()


func _show_accepted():
	progress_label.text = contract.progress + "\n\n"
	accepted.emit()


func _on_complete_pressed():
	queue_free()
