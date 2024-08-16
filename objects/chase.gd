class_name Chase
extends Behavior

var target: Area2D
var target_position: Vector2

func execute(delta):
	if not is_instance_valid(target):
		_on_untrigger(null)
		return
		
	if target:
		target_position = target.global_position
		
	var direction = (target_position - entity.position).normalized()
	entity.position += direction * delta * entity.dash_speed


func _on_trigger(trigger: Area2D):
	priority = 10
	if not target:
		target = trigger


func _on_untrigger(trigger: Area2D):
	target = null
	priority = 0
