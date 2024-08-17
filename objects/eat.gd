class_name Eat
extends Behavior


func execute(delta):
	pass


func _on_trigger(trigger: Area2D): # assume trigger is child of entity
	var food = trigger.get_parent()
	entity.baby_progress += food.food_amount
	entity.lifetime += food.food_amount
	food.queue_free()
