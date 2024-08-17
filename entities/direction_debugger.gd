class_name DirectionDebugger
extends BehaviorDebugger


func _draw():
	if behavior.active:
		draw_line(entity.position, entity.position + behavior.direction * 100, Color.BLACK, 5.0)
