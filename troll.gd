extends KinematicBody2D

# This is a demo showing how KinematicBody2D
# move_and_slide works.

# Member variables
export var direction = "up"
var motion = Vector2()
const upMotion = Vector2(2, -1)

func _physics_process(delta):
	
	
	#if Input.is_action_pressed("move_up"):
	#motion += Vector2(0, -1)
	#if Input.is_action_pressed("move_bottom"):
		#motion += Vector2(0, 1)
	#if Input.is_action_pressed("move_left"):
		#motion += Vector2(-1, 0)
	#if Input.is_action_pressed("move_right"):	

	match direction:
		"up":
			motion += upMotion
		"down":
			motion += upMotion * (-1)
	
	motion = motion.normalized() * get_tree().get_current_scene().trollSpeed

	move_and_slide(motion)
