class_name EatFoodObjective
extends Objective


func accept():
	accepted = true
	if upfront_reward:
		upfront_reward.receive()


func activate():
	trigger.activate()
	trigger.triggered.connect(_on_trigger)


func complete():
	completion_reward.receive()
	objective_completed.emit()


func _on_trigger():
	completed = true
	triggered.emit()


func _get_progress():
	if trigger:
		return trigger.progress
