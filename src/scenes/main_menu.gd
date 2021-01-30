extends Control

func _ready():
	pass

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			print("START")
			# Globals.goto_scene("game")
