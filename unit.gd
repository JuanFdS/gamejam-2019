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

func _physics_process(delta):
	var ruleDirection = rules().direction(get_script())

	match direction:
		"up":
			motion += ruleDirection
		"down":
			motion += ruleDirection * (-1)
	
	motion = motion.normalized() * rules().speed(get_script())

	move_and_slide(motion)
