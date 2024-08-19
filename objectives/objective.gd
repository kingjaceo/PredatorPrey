class_name Objective
extends Resource

enum ObjectiveType {ACHIEVEMENT, OBJECTIVE}
@export var name: String
@export var description: String
@export var objective_type: ObjectiveType
@export var upfront_reward: Reward
@export var completion_reward: Reward
@export var trigger: Trigger
var progress: String:
	get = _get_progress
@export var accepted: bool
@export var completed: bool

signal triggered
signal objective_completed


func activate():
	trigger.activate()
	trigger.triggered.connect(_on_trigger)


func _complete():
	completion_reward.receive()
	objective_completed.emit()
	trigger.triggered.disconnect(_on_trigger)


func _on_trigger():
	completed = true
	_complete()


func _get_progress():
	if trigger:
		return trigger.progress
