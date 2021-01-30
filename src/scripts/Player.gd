extends KinematicBody2D

var velocity := Vector2.ZERO
const speed_max := 200.0
var acceleration := 0.0
const acceleration_step := 0.005
const friction := 0.5
export(NodePath) var sprite_path
var player_sprite: AnimatedSprite = null

func _ready():
	player_sprite = get_node("AnimatedSprite")
	set_as_toplevel(true)

func _physics_process(delta : float):
	var input := Vector2.ZERO
	if Input.is_action_pressed("right"):
		input.x += 1
	if Input.is_action_pressed("left"):
		input.x -= 1
	if Input.is_action_pressed("down"):
		input.y += 1
	if Input.is_action_pressed("up"):
		input.y -= 1
	input = input.normalized()
	if input != Vector2.ZERO:
		if acceleration < 1:
			acceleration += acceleration_step
		velocity = input * speed_max * acceleration
#		velocity = input * delta * acceleration # No need delta
		player_sprite.play("run")
		if velocity.x > 0:
			player_sprite.flip_h = false
		elif velocity.x < 0:
			player_sprite.flip_h = true
	else:
		acceleration = 0
		velocity = velocity.move_toward(Vector2.ZERO, friction)
		player_sprite.play("idle")
#		velocity = velocity.move_toward(Vector2.ZERO, friction * delta) # No need delta

	move_and_slide(velocity)
	#var collide = move_and_collide(velocity, true, true, true)
	#if collide:
	#	print(collide.collider_id)
