class_name TimeController
extends Node


func _input(event):
	if event.is_action_pressed("speed_1"):
		_change_speed(1)
	if event.is_action_pressed("speed_2"):
		_change_speed(2)
	if event.is_action_pressed("speed_5"):
		_change_speed(5)
	if event.is_action_pressed("toggle_pause"):
		_toggle_pause()


func _change_speed(value: float):
	Engine.time_scale = value


func _toggle_pause():
	if Engine.time_scale != 0:
		Engine.time_scale = 0
	elif Engine.time_scale == 0:
		Engine.time_scale = 1
