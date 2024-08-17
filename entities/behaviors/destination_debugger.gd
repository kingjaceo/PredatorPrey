class_name DestinationDebugger
extends BehaviorDebugger


func _draw():
	if behavior.active:
		draw_line(entity.position, behavior.destination, Color.BLACK, 5.0)

