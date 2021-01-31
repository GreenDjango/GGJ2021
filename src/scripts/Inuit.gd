extends KinematicBody2D

var speed := 40.0
var targets := []

func _ready():
	$AnimatedSprite.play("idle")

func _physics_process(_delta : float):
	if targets.empty():
		return

	var distance : float = global_position.distance_to(targets[0].global_position)
	if distance >= 30.0 && $AnimatedSprite.animation != "run":
		$AnimatedSprite.play("run")
	elif distance < 30.0 && $AnimatedSprite.animation != "attack":
		$AnimatedSprite.play("attack")

	var direction : Vector2 = (targets[0].global_position - global_position).normalized()
	if direction.x > 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	# warning-ignore:return_value_discarded
	move_and_slide(direction * speed)

func _on_Area2D_body_entered(body : Node):
	if body is KinematicBody2D && !body.is_in_group("enemies"):
		targets.push_back(body)
		if $AnimatedSprite.animation == "idle":
			$AnimatedSprite.play("run")

func _on_Area2D_body_exited(body : Node):
	for i in range(targets.size()):
		if targets[i].get_instance_id() == body.get_instance_id():
			targets.remove(i)
			if $AnimatedSprite.animation != "idle" && targets.empty():
				$AnimatedSprite.play("idle")
			return

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		if targets[0].has_method("hurt"):
			targets[0].call_deferred("hurt", 0.5)
