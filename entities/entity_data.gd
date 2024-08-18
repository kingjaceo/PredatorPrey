class_name EntityData
extends Resource

@export var wander_speed: float = 100.0
@export var dash_speed: float = 300.0
@export var dash_length_s: float = 1.0
@export var dash_cooldown_s: float = 5.0
@export var vision_radius: float = 100
@export var consumption: float = 0.5
@export var food_amount: float = 1.0
@export var baby_requirement: float = 10.0
@export var max_lifetime: float = 10.0
@export_file() var baby_scene_path: String
@export var sprite_texture: Texture
@export var prey_types: Array[int] = []
@export var predator_types: Array[int] = []
