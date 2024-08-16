class_name Entity
extends Node2D

@export var wander_speed: float = 100.0
@export var dash_speed: float = 300.0
@export var dash_length_s: float = 1.0
@export var dash_cooldown_s: float = 5.0

@export var idle_consumption: float = 0.5
@export var max_lifetime: float = 10.0
var lifetime: float


func _ready():
	lifetime = max_lifetime


func _process(delta):
	lifetime -= delta * idle_consumption
	if lifetime <= 0:
		queue_free()


func _on_food_detected(area: Area2D):
	lifetime = 10
	area.queue_free()
