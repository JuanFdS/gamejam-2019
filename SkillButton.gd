extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var key = KEY_Q
export var player = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(ev):
	if Input.is_key_pressed(key):
		emit_signal("pressed")

