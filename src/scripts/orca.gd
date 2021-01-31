extends StaticBody2D

var talking_zone: Area2D
var orca_sprite: AnimatedSprite
var isPlayerEntered = false

var dialog1 := "You need to find your egg !"

# Called when the node enters the scene tree for the first time.
func _ready():
	talking_zone = get_node("TalkingZone")
	orca_sprite = get_node("AnimatedSprite")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isPlayerEntered && Input.is_key_pressed(KEY_E):
		orca_sprite.play("orca_talking")
		print("e")
		launchDialog(dialog1)

func launchDialog(text: String):
	Globals.dialog = text

func removeDialog():
	Globals.dialog = ""

func _on_TalkingZone_body_entered(body: Node):
	print("enter")
	if body is KinematicBody2D && !body.is_in_group("enemies"):
		isPlayerEntered = true
		orca_sprite.play("orca_showing")


func _on_TalkingZone_body_exited(body):
	print("exit")
	if body is KinematicBody2D && !body.is_in_group("enemies"):
		isPlayerEntered = false
		$AnimatedSprite/AnimationPlayer.animation_set_next("orca_leaving","hole")
		$AnimatedSprite/AnimationPlayer.play("orca_leaving")
		removeDialog()
		

func _on_AnimatedSprite_animation_finished():
	if orca_sprite.animation == "orca_showing":
		orca_sprite.stop()
