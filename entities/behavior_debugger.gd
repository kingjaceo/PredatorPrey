extends Node2D

var draw_correct: bool
var entity: Entity
var behavior: Behavior
func _ready():
	entity = get_parent().get_parent().get_parent()
	behavior = get_parent()


func _process(delta):
	queue_redraw()


func _draw():
	if draw_correct:
		draw_line(entity.position, entity.position + behavior.direction * 100, Color.BLACK, 5.0)
	else:
		draw_line(entity.position, Vector2(200, 200), Color.BLACK, 5.0)
	draw_correct = not draw_correct
