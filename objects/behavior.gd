class_name Behavior
extends Node

var priority: int = 0
var entity: Entity
var active: bool = false

func _ready():
	entity = get_parent().get_parent()


func start():
	active = true


func execute(delta):
	pass


func end():
	active = false


func _on_trigger(trigger: Area2D):
	pass


func _on_untrigger():
	pass

