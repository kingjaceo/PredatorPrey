class_name BehaviorDebugger
extends Node2D

var entity: Entity
var behavior: Behavior


func _ready():
	entity = get_parent().get_parent().get_parent()
	behavior = get_parent()


func _process(delta):
	queue_redraw()


func _draw():
	pass
