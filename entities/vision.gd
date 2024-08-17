@tool

extends Area2D

@onready var collision_shape = $CollisionShape2D


func _process(_delta):
	collision_shape.shape.radius = get_parent().vision_radius
