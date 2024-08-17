class_name Wander
extends Behavior

@export var wander_distance: float = 100
var destination: Vector2
@export var tolerance: float = 10


func _ready():
	priority = 1
	entity = get_parent().get_parent()
	_choose_new_destination()


func start():
	_choose_new_destination()
	active = true


func execute(delta):
	if entity.position.distance_to(destination) < tolerance:
		_choose_new_destination()
	
	_move_toward_destination(delta)


func _choose_new_destination():
	var new_angle = randf_range(0, 2*PI)
	destination = entity.position + Vector2(1, 0).rotated(new_angle) * wander_distance


func _move_toward_destination(delta):
	var direction = (destination - entity.position).normalized()
	entity.position += direction * delta * entity.wander_speed
