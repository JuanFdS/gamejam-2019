extends KinematicBody2D

# This is a demo showing how KinematicBody2D
# move_and_slide works.

# Member variables
export var direction = "up"
var motion = Vector2()
const upMotion = Vector2(2, -1)

func destroy():
	set_collision_mask_bit(0, false)
	set_collision_layer_bit(0, false)
	queue_free()

func rules():
	return self.get_tree().get_root().get_node("dungeon").get_node("Reglamento")

func face_direction(direction):
	for child in get_children():
		if(child.is_class("AnimatedSprite")):
			child.flip_h = direction != upMotion

func calculated_direction():
	var ruleDirection = rules().direction(get_script())
	match direction:
		"up":
			return ruleDirection
		"down":
			return ruleDirection * (-1)

func _physics_process(delta):
	var thisFrameDirection = calculated_direction()

	face_direction(thisFrameDirection)
	
	motion = thisFrameDirection.normalized() * rules().speed(get_script())

	print(motion)

	move_and_slide(motion)
