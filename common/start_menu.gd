class_name StartMenu
extends Node2D


func _load_world_with_player():
	Global.load_world_with_player()


func _load_world_with_observer():
	Global.load_world_with_observer()


func _exit():
	get_tree().quit()
