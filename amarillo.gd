extends "unit.gd"

var dead = false;

func fall():
	return
	
func explode():
	$AnimatedSprite.animation = 'die'
	stopMoving()
	dead = true

func _process(delta):
	if dead:
		position.y -= 1