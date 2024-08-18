class_name Entity
extends Node2D

@export var stats: EntityData
var lifetime: float
var baby_progress: float = 0.0

func _ready():
	lifetime = stats.max_lifetime


func _process(delta):
	lifetime -= stats.consumption * delta
	if baby_progress > stats.baby_requirement:
		_spawn_baby()
	if lifetime <= 0:
		queue_free()
		
	_correct_position()


func _eat(trigger: Area2D):
	var food = trigger.get_parent()
	baby_progress += food.food_amount
	lifetime += food.food_amount
	food.queue_free()


func _spawn_baby():
	baby_progress = 0
	var baby = duplicate()
	get_parent().add_child(baby)


func _correct_position():
	if position.y < 0:
		position.y += Global.level_height
		_reset_behavior()
	if position.y > Global.level_height:
		position.y -= Global.level_height
		_reset_behavior()

	if position.x < 0:
		position.x += Global.level_width
		_reset_behavior()
	if position.x > Global.level_width:
		position.x -= Global.level_width
		_reset_behavior()


func _reset_behavior():
	get_child(0).reset()
