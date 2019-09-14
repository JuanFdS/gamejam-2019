extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var trollSpeed = 160

func trollSpeed():
	return trollSpeed

# Called when the node enters the scene tree for the first time.
func activateRule():
	trollSpeed *= 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass