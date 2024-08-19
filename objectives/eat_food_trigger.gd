class_name EatFoodTrigger
extends Trigger

@export var target_amount: float
@export var target_food_type: String
var current_amount: float = 0


func activate():
	current_amount = 0
	Events.food_eaten.connect(_on_food_eaten)


func _on_food_eaten(eater: Node2D, food: Node2D):
	var eater_groups = eater.get_groups()
	var food_groups = food.get_groups()
	if "player" in eater_groups and target_food_type in food_groups:
		current_amount += 1
		progress_made.emit()
		if current_amount >= target_amount:
			triggered.emit()


func _get_progress() -> String:
	var progress_string = str(round(current_amount / target_amount * 100)) + "%"
	return progress_string
