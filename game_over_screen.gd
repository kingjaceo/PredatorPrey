extends Control


func _retry():
	get_tree().reload_current_scene()
	queue_free()
