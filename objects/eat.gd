class_name Eat
extends Behavior


func execute(delta):
	pass


func _on_trigger(trigger: Area2D): # assume trigger is child of entity
	trigger.get_parent().queue_free()
	entity.lifetime = entity.max_lifetime
