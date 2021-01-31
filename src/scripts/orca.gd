extends StaticBody2D

export(NodePath) var talking_zone_path
var talking_zone: Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	talking_zone = get_node(talking_zone_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
