class_name Entity
extends Node2D

@export var wander_speed: float = 100.0
@export var dash_speed: float = 300.0
@export var dash_length_s: float = 1.0
@export var dash_cooldown_s: float = 5.0

@export var vision_radius: float = 100

@export var consumption: float = 0.5
@export var food_amount: float = 1.0

@export var baby_requirement: float = 10.0

@export var max_lifetime: float = 10.0

var lifetime: float
var baby_progress: float = 0.0

func _ready():
	lifetime = max_lifetime


func _process(delta):
	if baby_progress > baby_requirement:
		_spawn_baby()
	if lifetime <= 0:
		queue_free()

func _eat(trigger: Area2D):
	var food = trigger.get_parent()
	baby_progress += food.food_amount
	lifetime += food.food_amount
	food.queue_free()


func _spawn_baby():
	baby_progress = 0
	var baby = duplicate()
	get_parent().add_child(baby)
