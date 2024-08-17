extends Label

@onready var cricket_controller = $"../CricketController"

func _process(_delta):
	text = cricket_controller.current_behavior.name
