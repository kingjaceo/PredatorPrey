extends Node2D

enum {TOP, BOTTOM, LEFT, RIGHT}
@export_enum("TOP", "BOTTOM", "LEFT", "RIGHT") var boundary_type: int
var pad: int = 32

func _on_area_entered(area: Area2D):
	match boundary_type:
		TOP:
			area.get_parent().position.y = Global.level_height - pad
		BOTTOM:
			area.get_parent().position.y = pad
		LEFT:
			area.get_parent().position.x = Global.level_width - pad
		RIGHT:
			area.get_parent().position.x = pad
