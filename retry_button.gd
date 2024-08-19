extends Button


func _ready():
	pressed.connect(_retry)


func _retry():
	Global.reload_current_scene()
	
