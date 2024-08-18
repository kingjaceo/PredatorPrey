class_name ObjectivePanel
extends PanelContainer

@export var objective: Objective
@onready var completion_reward_label = %Reward
@onready var objective_name_label = %ObjectiveName
@onready var description_label = %Description
@onready var progress_label = %Progress

signal accepted


func _ready():
	change_objective()


func change_objective():
	if objective:
		objective_name_label.text = objective.name
		description_label.text = objective.description
		completion_reward_label.text = str(objective.completion_reward)
		
		objective.activate()
		progress_label.text = objective.progress + "\n\n"
		objective.trigger.progress_made.connect(_update_progress)
	else:
		_clear()

func _update_progress():
	progress_label.text = objective.progress + "\n\n"


func _clear():
	objective_name_label.text = "No Objective"
	description_label.text = "Do whatever you want!"
	completion_reward_label.text = str(objective.completion_reward)
	progress_label.text = ""
