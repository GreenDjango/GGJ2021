extends StaticBody2D

export(NodePath) var talking_zone_path
export(NodePath) var orca_sprite_path
var talking_zone: Area2D
var orca_sprite: AnimatedSprite
var isPlayerEntered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	talking_zone = get_node(talking_zone_path)
	orca_sprite = get_node(orca_sprite_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isPlayerEntered && Input.is_key_pressed(KEY_E):
		orca_sprite.play("orca_talking")
		launchDialog()

func launchDialog():
	Globals.dialog = "Hello fils de pute !"

func removeDialog():
	Globals.dialog = ""

func _on_TalkingZone_body_entered(body: Node):
	if body is KinematicBody2D && !body.is_in_group("enemies"):
		isPlayerEntered = true
		orca_sprite.play("orca_showing")


func _on_TalkingZone_body_exited(body):
	if body is KinematicBody2D && !body.is_in_group("enemies"):
		isPlayerEntered = false
		$AnimatedSprite/AnimationPlayer.animation_set_next("orca_leaving","hole")
		$AnimatedSprite/AnimationPlayer.play("orca_leaving")
		removeDialog()
		

func _on_AnimatedSprite_animation_finished():
	if orca_sprite.animation == "orca_showing":
		orca_sprite.stop()
