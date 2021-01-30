extends Control

func _ready():
	pass

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			Globals.goto_scene("game")

