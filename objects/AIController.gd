class_name AIController
extends Node
# depends on being attached to an Entity

var current_behavior: Behavior


func _ready():
	current_behavior = get_child(0) # default behavior


func _process(delta):
	_check_update_current_behavior()
	current_behavior.execute(delta)


func _check_update_current_behavior():
	for child in get_children():
		if child.priority > current_behavior.priority:
			current_behavior = child
