class_name Player
extends Entity

var objective: Objective
@onready var objective_panel = $CanvasLayer/ObjectivePanel


func _ready():
	Global.player = self
	lifetime = stats.max_lifetime
	sprite.texture = stats.sprite_texture


func change_data(new_data: EntityData):
	stats = new_data
	sprite.texture = stats.sprite_texture
	_reset()


func change_objective(new_objective: Objective):
	objective = new_objective
	objective_panel.objective = objective
	objective_panel.change_objective()
