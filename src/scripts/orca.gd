extends StaticBody2D

var orca_sprite: AnimatedSprite

var dialog1 := "I saw your egg take away by the wind of the blizzard!\nBut be careful, some inuit are mad at us.\nBe safe on your journey."

# Called when the node enters the scene tree for the first time.
func _ready():
	orca_sprite = get_node("AnimatedSprite")
	orca_sprite.play("orca_out")

func launchDialog(text: String):
	Globals.dialog = text

func removeDialog():
	Globals.dialog = ""

func _on_TalkingZone_body_entered(body: Node):
	if body is KinematicBody2D && body.is_in_group("player"):
		orca_sprite.play("orca_talking")
		launchDialog(dialog1)
		# $AnimatedSprite/AnimationPlayer.play_backwards("orca_leaving")
		# $AnimatedSprite/AnimationPlayer.animation_set_next("")

func _on_TalkingZone_body_exited(body):
	if body is KinematicBody2D && body.is_in_group("player"):
		orca_sprite.play("orca_out")
		removeDialog()
		# $AnimatedSprite/AnimationPlayer.play("orca_leaving")
		# $AnimatedSprite/AnimationPlayer.animation_set_next("orca_leaving","hole")
