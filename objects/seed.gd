class_name Seed
extends Node2D

@export var stats: FoodData
@export var seed_sprite = load("res://objects/seed_sprite.png")
@export var berry_sprite = load("res://objects/berry.png")
@onready var sprite = $Sprite2D

func _ready():
	var roll = randf()
	if roll <= 0.5:
		sprite.texture = seed_sprite
	else:
		sprite.texture = berry_sprite
