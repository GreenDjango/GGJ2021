extends Control

func _ready():
	pass

func _process(_delta):
	$Heart1.self_modulate.a = min(Globals.life, 1.0)
	$Heart2.self_modulate.a = min(max(Globals.life - 1.0, 0), 1.0)
	$Heart3.self_modulate.a = min(max(Globals.life - 2.0, 0), 1.0)

func _input(event):
	if Globals.life <= 0 && event is InputEventKey:
		if event.pressed:
			Globals.restart_game()
