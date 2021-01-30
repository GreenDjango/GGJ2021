extends Node

func _ready():
	randomize()

func goto_scene(new_scene_name : String):
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/scenes/" + new_scene_name + ".tscn")
