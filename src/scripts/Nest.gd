extends Node2D

var egg_in := false

func _ready():
	$AnimatedSprite.play("default")

func _on_Area2D_body_entered(body):
	if !egg_in && body is RigidBody2D && body.is_in_group("egg"):
		egg_in = true
		get_tree().call_group("player", "victory")
