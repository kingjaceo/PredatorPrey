class_name Flee
extends Behavior

var target: Area2D
var target_position: Vector2
var direction: Vector2
var speed: float
var time_since_last_dash_s: float = 0
var dash_time_s: float = 0
@export var flee_time_s: float = 1
var fleeing: bool = false


func execute(delta):
	if target and not is_instance_valid(target):
		return
		
	if target:
		target_position = target.global_position
		direction = -(target_position - entity.position).normalized()
	_check_update_speed(delta)
	entity.position += direction * delta * speed


func _on_trigger(trigger: Area2D):
	priority = 20
	fleeing = true
	if not target:
		target = trigger


func _on_untrigger():
	target = null
	fleeing = false
	await get_tree().create_timer(flee_time_s).timeout
	if not fleeing:
		priority = 0


func _check_update_speed(delta):
	if time_since_last_dash_s > entity.dash_cooldown_s:
		speed = entity.dash_speed
		dash_time_s = 0
	
	if dash_time_s < entity.dash_length_s:
		speed = entity.dash_speed
		dash_time_s += delta
		time_since_last_dash_s = 0
	else:
		speed = entity.wander_speed
		time_since_last_dash_s += delta
