class_name Entity
extends Node2D

@export var stats: EntityData
@onready var sprite = $Sprite2D
@onready var collision_shape = $Body/CollisionShape2D
@onready var body: CollisionObject2D = $Body

var lifetime: float
var baby_progress: float = 0.0


func _ready():
	lifetime = stats.max_lifetime
	sprite.texture = stats.sprite_texture


func _process(delta):
	lifetime -= stats.consumption * delta
	if baby_progress > stats.baby_requirement:
		_spawn_baby()
	if lifetime <= 0:
		queue_free()
		
	_correct_position()


func _reset():
	baby_progress = 0
	lifetime = stats.max_lifetime
	position = Global.level_size / 2
	body.collision_layer = 0
	body.collision_mask = 0
	for prey in stats.prey_types:
		body.set_collision_mask_value(prey, true)
	
	for predator in stats.predator_types:
		body.set_collision_layer_value(predator, true)


func _eat(trigger: Area2D):
	var food = trigger.get_parent()
	baby_progress += food.stats.food_amount
	lifetime += food.stats.food_amount
	food.queue_free()
	Events.food_eaten.emit(self, food)


func _spawn_baby():
	baby_progress = 0
	var baby_scene = load(stats.baby_scene_path)
	var baby = baby_scene.instantiate()
	baby.position = position
	get_parent().add_child(baby)


func _correct_position():
	if position.y < 0:
		position.y += Global.level_size.y
		_reset_behavior()
	if position.y > Global.level_size.y:
		position.y -= Global.level_size.y
		_reset_behavior()

	if position.x < 0:
		position.x += Global.level_size.x
		_reset_behavior()
	if position.x > Global.level_size.x:
		position.x -= Global.level_size.x
		_reset_behavior()


func _reset_behavior():
	get_child(0).reset()
