extends Node2D

func _ready():
	pass


func _on_StartArea_body_entered(body):
	if body is KinematicBody2D && body.is_in_group("player"):
		Globals.dialog = "You need to find your egg!"


func _on_StartArea_body_exited(body):
	if body is KinematicBody2D && body.is_in_group("player"):
		Globals.dialog = ""
