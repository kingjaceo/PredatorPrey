class_name AIController
extends Node

var current_behavior: Behavior


func _ready():
	_find_new_behavior()


func _process(delta):
	_check_update_current_behavior()
	current_behavior.execute(delta)


func _check_update_current_behavior():
	var new_behavior = current_behavior
	for child in get_children():
		if child.priority > current_behavior.priority:
			new_behavior = child
	
	if new_behavior != current_behavior:
		current_behavior.end()
		current_behavior = new_behavior
		current_behavior.start()


func _find_new_behavior():
	current_behavior = get_child(0)
	for child in get_children():
		if child.priority > current_behavior.priority:
			current_behavior = child
	current_behavior.start()


func reset():
	if current_behavior:
		current_behavior.end()
		current_behavior = null
	_find_new_behavior()
