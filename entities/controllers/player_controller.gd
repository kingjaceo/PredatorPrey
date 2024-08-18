class_name PlayerController
extends Node

var entity: Entity
var direction: Vector2
var can_dash: bool = true
var dash_time: float = 0.0
var time_since_last_dash: float = 0.0


func _ready():
	entity = get_parent()


func _process(delta):
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	direction = direction.normalized()
	
	var position_change = Vector2.ZERO
	time_since_last_dash += delta
	_check_update_can_dash(delta)
	if Input.is_action_pressed("dash") and can_dash:
		position_change = direction * entity.stats.dash_speed * delta
		dash_time += delta
		time_since_last_dash = 0
	else:
		position_change = direction * entity.stats.wander_speed * delta
	
	entity.position += position_change


func _check_update_can_dash(delta):
	# this gets called every frame
	if dash_time > entity.stats.dash_length_s:
		can_dash = false
		dash_time = 0.0
	if time_since_last_dash > entity.stats.dash_cooldown_s:
		can_dash = true


func reset():
	pass
