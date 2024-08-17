@tool
class_name Vision
extends Area2D

var entity: Entity
@onready var collision_shape = $CollisionShape2D
var visual_memory: Array[Area2D] = []
var closest_target: Area2D

signal closer_target_detected(target: Area2D)
signal no_target_detected()

func _ready():
	entity = get_parent()
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _process(_delta):
	collision_shape.shape.radius = entity.vision_radius


func _on_area_entered(area: Area2D):
	if not area in visual_memory:
		visual_memory.append(area)
	_check_emit_closest_target()


func _on_area_exited(area: Area2D):
	visual_memory.erase(area)
	if area == closest_target:
		closest_target = null
	_check_emit_closest_target()


func _check_emit_closest_target():
	var new_target = null
	var distance_to_closest_target = INF
	if is_instance_valid(closest_target):
		distance_to_closest_target = entity.position.distance_to(closest_target.global_position)
	var distance_to_new_target = distance_to_closest_target
	
	for target in visual_memory:
		distance_to_new_target = entity.position.distance_to(target.global_position)
		if distance_to_new_target < distance_to_closest_target:
			new_target = target
			distance_to_closest_target = distance_to_new_target
	
	if len(visual_memory) == 0:
		no_target_detected.emit()	
	elif new_target != closest_target:
		closer_target_detected.emit(new_target)
		closest_target = new_target
