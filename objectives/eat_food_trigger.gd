class_name EatFoodTrigger
extends Trigger

@export var target_amount: int
var current_amount = 0


func activate():
	Events.food_eaten.connect(_on_food_eaten)


func _on_food_eaten(eater: Vector2):
	current_amount += 1
	if current_amount >= target_amount:
		triggered.emit()


func _get_progress() -> String:
	return str(round(current_amount / target_amount * 100)) + "%"
