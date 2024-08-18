class_name Seed
extends Node2D

@export var food_amount: float = 1.0
@export var seed_sprite = load("res://Seed sprite.png")
@export var berry_sprite = load("res://berry.png")
@onready var sprite = $Sprite2D

func _ready():
	var roll = randf()
	if roll <= 0.5:
		sprite.texture = seed_sprite
	else:
		sprite.texture = berry_sprite
