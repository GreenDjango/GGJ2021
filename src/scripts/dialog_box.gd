extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setText(text: String):
	$RichTextLabel.text = text

func _process(delta):
	pass
