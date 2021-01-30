extends Control

func _ready():
	$AnimationPlayer.play("pingu_fly")

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			Globals.goto_scene("game")

