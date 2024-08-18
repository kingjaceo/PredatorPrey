class_name Chase
extends Behavior

var target: Area2D
var destination: Vector2
var speed: float
var time_since_last_dash_s: float = 0
var dash_time_s: float = 0
@export var chase_time_s: float = 0.5


func execute(delta):
	if not is_instance_valid(target):
		target = null
		priority = 0
		return
		
	if target:
		destination = target.global_position
		
	var direction = (destination - entity.position).normalized()
	_check_update_speed(delta)
	entity.position += direction * delta * speed


func _on_trigger(trigger: Area2D):
	priority = 10
	if not target:
		target = trigger


func _on_untrigger():
	target = null
	#await get_tree().create_timer(chase_time_s).timeout
	priority = 0


func _check_update_speed(delta):
	if time_since_last_dash_s > entity.stats.dash_cooldown_s:
		speed = entity.stats.dash_speed
		dash_time_s = 0
	
	if dash_time_s < entity.stats.dash_length_s:
		speed = entity.stats.dash_speed
		dash_time_s += delta
		time_since_last_dash_s = 0
	else:
		speed = entity.stats.wander_speed
		time_since_last_dash_s += delta
