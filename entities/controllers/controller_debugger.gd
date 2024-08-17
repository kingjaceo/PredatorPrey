extends Label

@onready var controller = $"../Controller"

func _process(_delta):
	text = controller.current_behavior.name
