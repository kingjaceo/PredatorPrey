class_name Behavior
extends Node

var priority: int = 0
var entity: Entity


func _ready():
	entity = get_parent().get_parent()


func execute(delta):
	pass


func _on_trigger(trigger: Area2D):
	pass


func _on_untrigger(trigger: Area2D):
	pass

